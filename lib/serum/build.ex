defmodule Serum.Build do
  @moduledoc """
  A module for managing the overall project build procedure.
  """

  import Serum.Util
  alias Serum.Build.FileEmitter
  alias Serum.Build.FileLoader
  alias Serum.Build.FileProcessor
  alias Serum.Build.FragmentGenerator
  alias Serum.Build.PageGenerator
  alias Serum.Plugin
  alias Serum.Project
  alias Serum.Result
  alias Serum.Theme

  @doc """
  Builds the given Serum project.

  ## Build Procedure

  1. Tries to load plugins and a theme.

  2. Checks if the system timezone is properly set.

      Timex requires the local timezone information to format the date/time
      string. If it's not set or invalid, Timex will fail.

  3. Checks if the current user has enough permission on the destination
    directory and cleans it if it already exists.

  4. Loads source files. See `Serum.Build.FileLoader`.

  5. Processes source files and produces intermediate data structures.
    See `Serum.Build.FileProcessor`.

  6. Generates HTML fragments from the intermediate data.
    See `Serum.Build.FragmentGenerator`.

  7. Renders full HTML pages from fragments and writes them to files.
    See `Serum.Build.FileEmitter`.

  8. Copies `assets/` and `media/` directories if they exist.
  """
  @spec build(Project.t()) :: Result.t(binary())
  def build(%Project{src: src, dest: dest} = proj) do
    with {:ok, proj} <- load_plugins(proj),
         :ok <- Plugin.build_started(src, dest),
         :ok <- pre_check(dest),
         :ok <- do_build(proj),
         :ok <- copy_assets(src, dest, proj.theme),
         :ok <- Plugin.build_succeeded(src, dest),
         :ok <- Plugin.finalizing(src, dest) do
      {:ok, dest}
    else
      {:error, _} = error ->
        with :ok <- Plugin.build_failed(src, dest, error),
             :ok <- Plugin.finalizing(src, dest) do
          error
        else
          {:error, _} = plugin_error -> plugin_error
        end
    end
  end

  @spec load_plugins(Project.t()) :: Result.t(Project.t())
  defp load_plugins(proj) do
    with {:ok, plugins} <- Plugin.load_plugins(proj.plugins),
         {:ok, theme} <- Theme.load(proj.theme.module) do
      Plugin.show_info(plugins)

      {:ok, %Project{proj | theme: theme}}
    else
      {:error, _} = error -> error
    end
  end

  @spec pre_check(binary()) :: Result.t()
  defp pre_check(dest) do
    with :ok <- check_tz(),
         :ok <- check_dest_perm(dest) do
      clean_dest(dest)
    else
      {:error, _} = error -> error
    end
  end

  @spec do_build(Project.t()) :: Result.t()
  defp do_build(proj) do
    with {:ok, files} <- FileLoader.load_files(proj.src, proj.theme),
         {:ok, map} <- FileProcessor.process_files(files, proj),
         {:ok, fragments} <- FragmentGenerator.to_fragment(map),
         {:ok, files} <- PageGenerator.run(fragments, map.templates["base"]) do
      FileEmitter.run(files)
    else
      {:error, _} = error -> error
    end
  end

  # Checks if the system timezone is set and valid.
  @spec check_tz() :: Result.t()
  defp check_tz do
    Timex.local()
    :ok
  rescue
    _ -> {:error, "system timezone is not set"}
  end

  # Checks if the effective user have a write
  # permission on the destination directory.
  @spec check_dest_perm(binary) :: Result.t()
  defp check_dest_perm(dest) do
    parent = dest |> Path.join("") |> Path.dirname()

    result =
      case File.stat(parent) do
        {:error, reason} -> reason
        {:ok, %File.Stat{access: :none}} -> :eacces
        {:ok, %File.Stat{access: :read}} -> :eacces
        {:ok, _} -> :ok
      end

    case result do
      :ok -> :ok
      err -> {:error, {err, dest, 0}}
    end
  end

  # Removes all files and directories in the destination directory,
  # excluding dotfiles so that git repository is not blown away.
  @spec clean_dest(binary) :: Result.t()
  defp clean_dest(dest) do
    File.mkdir_p!(dest)
    msg_mkdir(dest)

    dest
    |> File.ls!()
    |> Enum.reject(&String.starts_with?(&1, "."))
    |> Enum.map(&Path.join(dest, &1))
    |> Enum.map(fn path ->
      case File.rm_rf(path) do
        {:ok, _} -> :ok
        {:error, reason, ^path} -> {:error, {reason, path, 0}}
      end
    end)
    |> Result.aggregate(:clean_dest)
  end

  @spec copy_assets(binary(), binary(), Theme.t()) :: Result.t()
  defp copy_assets(src, dest, theme) do
    IO.puts("Copying assets and media...")

    case copy_theme_assets(theme, dest) do
      :ok ->
        try_copy(Path.join(src, "assets"), Path.join(dest, "assets"))
        try_copy(Path.join(src, "media"), Path.join(dest, "media"))

      {:error, _} = error ->
        error
    end
  end

  @spec copy_theme_assets(Theme.t(), binary()) :: Result.t()
  defp copy_theme_assets(theme, dest) do
    case Theme.get_assets(theme) do
      {:ok, false} -> :ok
      {:ok, path} -> try_copy(path, Path.join(dest, "assets"))
      {:error, _} = error -> error
    end
  end

  @spec try_copy(binary, binary) :: :ok
  defp try_copy(src, dest) do
    case File.cp_r(src, dest) do
      {:error, reason, _} ->
        warn("Cannot copy #{src}: #{:file.format_error(reason)}. Skipping.")

      {:ok, _} ->
        :ok
    end
  end
end
