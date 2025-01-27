defmodule Serum.BuildTest do
  use ExUnit.Case
  require Serum.TestHelper
  import Serum.TestHelper
  alias Serum.Build
  alias Serum.Project.Loader, as: ProjectLoader

  setup do
    tmp_dir = get_tmp_dir("serum_test_")
    src = Path.join(tmp_dir, "src")
    dest = Path.join(tmp_dir, "dest")

    Enum.each([tmp_dir, src, dest], &File.mkdir_p!/1)
    make_project(src)

    {:ok, proj} = ProjectLoader.load(src, dest)

    on_exit(fn -> File.rm_rf!(tmp_dir) end)

    {:ok, [src: src, dest: dest, proj: proj]}
  end

  test "everything went well", %{dest: dest, proj: proj} do
    assert {:ok, ^dest} = mute_stdio(do: Build.build(proj))

    # Clean the destination dir when is not empty
    assert {:ok, ^dest} = mute_stdio(do: Build.build(proj))
  end

  test "skip copying assets and media", %{src: src, dest: dest, proj: proj} do
    File.rm_rf!(Path.join(src, "assets"))
    File.rm_rf!(Path.join(src, "media"))

    assert {:ok, ^dest} = mute_stdio(do: Build.build(proj))
  end

  test "no write permission on dest", %{dest: dest, proj: proj} do
    File.chmod!(dest, 0o555)

    assert {:error, _} = mute_stdio(do: Build.build(proj))

    File.chmod!(dest, 0o755)
    File.rm_rf!(dest)

    parent = Path.expand(Path.join(dest, ".."))

    File.chmod!(parent, 0o555)

    assert {:error, _} = mute_stdio(do: Build.build(proj))

    File.chmod!(parent, 0o755)
  end

  test "failed to load required files", %{src: src, proj: proj} do
    File.rm_rf!(Path.join(src, "templates"))

    assert {:error, _} = mute_stdio(do: Build.build(proj))
  end

  test "failed to process some files", %{src: src, proj: proj} do
    "pages/bad-*.*"
    |> fixture()
    |> Path.wildcard()
    |> Enum.each(fn file ->
      File.cp!(file, Path.join([src, "pages", Path.basename(file)]))
    end)

    assert {:error, _} = mute_stdio(do: Build.build(proj))
  end
end
