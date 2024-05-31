local has_ts_comments, ts_comments = pcall(require, "ts-comments")

if not has_ts_comments then
  error("Failed to load ts-comments")
  return
end

ts_comments.setup {
  lang = {
    astro = "<!-- %s -->",
    axaml = "<!-- %s -->",
    blueprint = "// %s",
    c = "// %s",
    c_sharp = "// %s",
    clojure = { ";; %s", "; %s" },
    cpp = "// %s",
    cs_project = "<!-- %s -->",
    cue = "// %s",
    fsharp = "// %s",
    fsharp_project = "<!-- %s -->",
    gleam = "// %s",
    glimmer = "{{! %s }}",
    graphql = "# %s",
    handlebars = "{{! %s }}",
    hcl = "# %s",
    html = "<!-- %s -->",
    hyprlang = "# %s",
    ini = "; %s",
    javascript = {
      "// %s", -- default commentstring when no treesitter node matches
      "/* %s */",
      call_expression = "// %s", -- specific commentstring for call_expression
      jsx_attribute = "// %s",
      jsx_element = "{/* %s */}",
      jsx_fragment = "{/* %s */}",
      spread_element = "// %s",
      statement_block = "// %s",
    },
    php = "// %s",
    rego = "# %s",
    rescript = "// %s",
    rust = { "// %s", "/* %s */" },
    sql = "-- %s",
    svelte = "<!-- %s -->",
    terraform = "# %s",
    tsx = {
      "// %s", -- default commentstring when no treesitter node matches
      "/* %s */",
      call_expression = "// %s", -- specific commentstring for call_expression
      jsx_attribute = "// %s",
      jsx_element = "{/* %s */}",
      jsx_fragment = "{/* %s */}",
      spread_element = "// %s",
      statement_block = "// %s",
    },
    twig = "{# %s #}",
    typescript = { "// %s", "/* %s */" }, -- langs can have multiple commentstrings
    vue = "<!-- %s -->",
    xaml = "<!-- %s -->",
  },
}
