%{"base" => %{__struct__: Serum.Template, ast: {:__block__, [], [{:__block__, [], [{:require, [line: 2], [{:__aliases__, [line: 2], [:Serum, :Template, :Helpers]}]}, {:import, [line: 3], [{:__aliases__, [line: 3], [:Serum, :Template, :Helpers]}]}]}, {:=, [], [{:arg0, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{{:., [line: 9], [{{:., [line: 9], [{:__aliases__, [line: 9, alias: false], [:EEx, :Engine]}, :fetch_assign!]}, [line: 9], [{:var!, [line: 9, context: EEx.Engine, import: Kernel], [{:assigns, [line: 9], EEx.Engine}]}, :page]}, :title]}, [line: 9], []}]}]}, {:=, [], [{:arg1, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{{:., [line: 9], [{{:., [line: 9], [{:__aliases__, [line: 9, alias: false], [:EEx, :Engine]}, :fetch_assign!]}, [line: 9], [{:var!, [line: 9, context: EEx.Engine, import: Kernel], [{:assigns, [line: 9], EEx.Engine}]}, :site]}, :name]}, [line: 9], []}]}]}, {:=, [], [{:arg2, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{:base, [line: 12], []}]}]}, {:=, [], [{:arg3, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{{:., [line: 12], [{{:., [line: 12], [{:__aliases__, [line: 12, alias: false], [:EEx, :Engine]}, :fetch_assign!]}, [line: 12], [{:var!, [line: 12, context: EEx.Engine, import: Kernel], [{:assigns, [line: 12], EEx.Engine}]}, :site]}, :name]}, [line: 12], []}]}]}, {:=, [], [{:arg4, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{{:., [line: 13], [{{:., [line: 13], [{:__aliases__, [line: 13, alias: false], [:EEx, :Engine]}, :fetch_assign!]}, [line: 13], [{:var!, [line: 13, context: EEx.Engine, import: Kernel], [{:assigns, [line: 13], EEx.Engine}]}, :site]}, :description]}, [line: 13], []}]}]}, {:=, [], [{:arg5, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{{:., [], [{:fn, [], [{:->, [], [[], {:__block__, [], [{:__block__, [], [{:require, [line: 2], [{:__aliases__, [line: 2], [:Serum, :Template, :Helpers]}]}, {:import, [line: 3], [{:__aliases__, [line: 3], [:Serum, :Template, :Helpers]}]}]}, {:=, [], [{:arg0, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{:page, [line: 6], ["index"]}]}]}, {:=, [], [{:arg1, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{:base, [line: 7], ["posts"]}]}]}, {:<<>>, [], ["\n<ul>\n  <li><a href=\"", {:::, [], [{:arg0, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "\">Home</a></li>\n  <li><a href=\"", {:::, [], [{:arg1, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "\">Posts</a></li>\n</ul>\n"]}]}]}]}]}, [], []}]}]}, {:=, [], [{:arg6, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{{:., [line: 15], [{:__aliases__, [line: 15, alias: false], [:EEx, :Engine]}, :fetch_assign!]}, [line: 15], [{:var!, [line: 15, context: EEx.Engine, import: Kernel], [{:assigns, [line: 15], EEx.Engine}]}, :contents]}]}]}, {:<<>>, [], ["\n<!doctype html>\n<html>\n  <head>\n    <meta charset=\"utf-8\">\n    <title>", {:::, [], [{:arg0, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, " - ", {:::, [], [{:arg1, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "</title>\n  </head>\n  <body>\n    <h1><a href=\"", {:::, [], [{:arg2, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "\">", {:::, [], [{:arg3, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "</a></h1>\n    <p>", {:::, [], [{:arg4, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "</p>\n    ", {:::, [], [{:arg5, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "\n    ", {:::, [], [{:arg6, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "\n  </body>\n</html>\n"]}]}, file: "base.html.eex", type: :template}, "list" => %{__struct__: Serum.Template, ast: {:__block__, [], [{:__block__, [], [{:require, [line: 2], [{:__aliases__, [line: 2], [:Serum, :Template, :Helpers]}]}, {:import, [line: 3], [{:__aliases__, [line: 3], [:Serum, :Template, :Helpers]}]}]}, {:=, [], [{:arg0, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{{:., [line: 5], [{{:., [line: 5], [{:__aliases__, [line: 5, alias: false], [:EEx, :Engine]}, :fetch_assign!]}, [line: 5], [{:var!, [line: 5, context: EEx.Engine, import: Kernel], [{:assigns, [line: 5], EEx.Engine}]}, :page]}, :title]}, [line: 5], []}]}]}, {:=, [], [{:arg1, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{:for, [line: 7], [{:<-, [line: 7], [{:x, [line: 7], nil}, {{:., [line: 7], [{:__aliases__, [line: 7, alias: false], [:EEx, :Engine]}, :fetch_assign!]}, [line: 7], [{:var!, [line: 7, context: EEx.Engine, import: Kernel], [{:assigns, [line: 7], EEx.Engine}]}, :all_posts]}]}, [do: {:__block__, [], [{:=, [], [{:arg1, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{{:., [line: 9], [{:x, [line: 9], nil}, :url]}, [line: 9], []}]}]}, {:=, [], [{:arg2, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{{:., [line: 9], [{:x, [line: 9], nil}, :title]}, [line: 9], []}]}]}, {:=, [], [{:arg3, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{{:., [line: 11], [{:x, [line: 11], nil}, :date]}, [line: 11], []}]}]}, {:<<>>, [], ["\n    <li>\n      <p><a href=\"", {:::, [], [{:arg1, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "\">", {:::, [], [{:arg2, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "</a>\n      &mdash;\n      <span class=\"date\">", {:::, [], [{:arg3, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "</span></p>\n    </li>\n  "]}]}]]}]}]}, {:<<>>, [], ["\n<h2>", {:::, [], [{:arg0, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "</h2>\n<ul>\n  ", {:::, [], [{:arg1, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "\n</ul>\n"]}]}, file: "list.html.eex", type: :template}, "page" => %{__struct__: Serum.Template, ast: {:__block__, [], [{:__block__, [], [{:require, [line: 2], [{:__aliases__, [line: 2], [:Serum, :Template, :Helpers]}]}, {:import, [line: 3], [{:__aliases__, [line: 3], [:Serum, :Template, :Helpers]}]}]}, {:=, [], [{:arg0, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{{:., [line: 5], [{:__aliases__, [line: 5, alias: false], [:EEx, :Engine]}, :fetch_assign!]}, [line: 5], [{:var!, [line: 5, context: EEx.Engine, import: Kernel], [{:assigns, [line: 5], EEx.Engine}]}, :contents]}]}]}, {:<<>>, [], ["\n", {:::, [], [{:arg0, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "\n"]}]}, file: "page.html.eex", type: :template}, "post" => %{__struct__: Serum.Template, ast: {:__block__, [], [{:__block__, [], [{:require, [line: 2], [{:__aliases__, [line: 2], [:Serum, :Template, :Helpers]}]}, {:import, [line: 3], [{:__aliases__, [line: 3], [:Serum, :Template, :Helpers]}]}]}, {:=, [], [{:arg0, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{{:., [line: 5], [{{:., [line: 5], [{:__aliases__, [line: 5, alias: false], [:EEx, :Engine]}, :fetch_assign!]}, [line: 5], [{:var!, [line: 5, context: EEx.Engine, import: Kernel], [{:assigns, [line: 5], EEx.Engine}]}, :page]}, :title]}, [line: 5], []}]}]}, {:=, [], [{:arg1, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{{:., [line: 6], [{{:., [line: 6], [{:__aliases__, [line: 6, alias: false], [:EEx, :Engine]}, :fetch_assign!]}, [line: 6], [{:var!, [line: 6, context: EEx.Engine, import: Kernel], [{:assigns, [line: 6], EEx.Engine}]}, :page]}, :date]}, [line: 6], []}]}]}, {:=, [], [{:arg2, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{{:., [line: 6], [{{:., [line: 6], [{:__aliases__, [line: 6, alias: false], [:EEx, :Engine]}, :fetch_assign!]}, [line: 6], [{:var!, [line: 6, context: EEx.Engine, import: Kernel], [{:assigns, [line: 6], EEx.Engine}]}, :site]}, :author]}, [line: 6], []}]}]}, {:=, [], [{:arg3, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{:unless, [line: 7], [{{:., [line: 7], [{:__aliases__, [line: 7], [:Enum]}, :empty?]}, [line: 7], [{{:., [line: 7], [{{:., [line: 7], [{:__aliases__, [line: 7, alias: false], [:EEx, :Engine]}, :fetch_assign!]}, [line: 7], [{:var!, [line: 7, context: EEx.Engine, import: Kernel], [{:assigns, [line: 7], EEx.Engine}]}, :page]}, :tags]}, [line: 7], []}]}, [do: {:__block__, [], [{:=, [], [{:arg3, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{:for, [line: 10], [{:<-, [line: 10], [{:t, [line: 10], nil}, {{:., [line: 10], [{{:., [line: 10], [{:__aliases__, [line: 10, alias: false], [:EEx, :Engine]}, :fetch_assign!]}, [line: 10], [{:var!, [line: 10, context: EEx.Engine, import: Kernel], [{:assigns, [line: 10], EEx.Engine}]}, :page]}, :tags]}, [line: 10], []}]}, [do: {:__block__, [], [{:=, [], [{:arg3, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{{:., [line: 11], [{:t, [line: 11], nil}, :list_url]}, [line: 11], []}]}]}, {:=, [], [{:arg4, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{{:., [line: 11], [{:t, [line: 11], nil}, :name]}, [line: 11], []}]}]}, {:<<>>, [], ["\n      <li><a href=\"", {:::, [], [{:arg3, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "\">", {:::, [], [{:arg4, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "</a></li>\n    "]}]}]]}]}]}, {:<<>>, [], ["\n  <p>Tags:</p>\n  <ul>\n    ", {:::, [], [{:arg3, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "\n  </ul>\n"]}]}]]}]}]}, {:=, [], [{:arg4, [], EEx.Engine}, {{:., [], [{:__aliases__, [alias: false], [:String, :Chars]}, :to_string]}, [], [{{:., [line: 15], [{:__aliases__, [line: 15, alias: false], [:EEx, :Engine]}, :fetch_assign!]}, [line: 15], [{:var!, [line: 15, context: EEx.Engine, import: Kernel], [{:assigns, [line: 15], EEx.Engine}]}, :contents]}]}]}, {:<<>>, [], ["\n<h1>", {:::, [], [{:arg0, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "</h1>\n<p>Posted on ", {:::, [], [{:arg1, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, " by ", {:::, [], [{:arg2, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "</p>\n", {:::, [], [{:arg3, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "\n", {:::, [], [{:arg4, [], EEx.Engine}, {:binary, [], EEx.Engine}]}, "\n"]}]}, file: "post.html.eex", type: :template}}