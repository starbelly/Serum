defmodule Serum.Build.FileProcessor.PostList do
  @moduledoc false

  alias Serum.PostList
  alias Serum.Project
  alias Serum.Result

  @type tag_groups() :: [{Tag.t(), [Post.t()]}]
  @type tag_counts() :: [{Tag.t(), integer()}]

  @doc false
  @spec generate_lists([map()], Project.t()) :: Result.t({[PostList.t()], tag_counts()})
  def generate_lists(compact_posts, proj)
  def generate_lists([], _proj), do: {:ok, {[], []}}

  def generate_lists(compact_posts, proj) do
    IO.puts("Generating post lists...")

    tag_groups = group_posts_by_tag(compact_posts)

    [{nil, compact_posts} | tag_groups]
    |> Task.async_stream(fn {tag, posts} ->
      PostList.generate(tag, posts, proj)
    end)
    |> Enum.map(&elem(&1, 1))
    |> Result.aggregate_values(:file_processor)
    |> case do
      {:ok, lists} -> {:ok, {List.flatten(lists), get_tag_counts(tag_groups)}}
      {:error, _} = error -> error
    end
  end

  @spec group_posts_by_tag([map()], map()) :: tag_groups()
  defp group_posts_by_tag(posts, acc \\ %{})

  defp group_posts_by_tag([], acc) do
    Enum.map(acc, fn {tag, posts} -> {tag, Enum.reverse(posts)} end)
  end

  defp group_posts_by_tag([post | posts], acc1) do
    new_acc =
      Enum.reduce(post.tags, acc1, fn tag, acc2 ->
        acc2
        |> Map.get_and_update(tag, fn
          nil -> {nil, [post]}
          posts when is_list(posts) -> {posts, [post | posts]}
        end)
        |> elem(1)
      end)

    group_posts_by_tag(posts, new_acc)
  end

  @spec get_tag_counts(tag_groups()) :: tag_counts()
  defp get_tag_counts(tags) do
    Enum.map(tags, fn {k, v} -> {k, Enum.count(v)} end)
  end
end
