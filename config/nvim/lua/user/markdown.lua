local options = {
  nvim_markdown_preview_theme = "github",
  nvim_markdown_preview_format = "markdown",
}

for k, v in pairs(options) do
  vim.g[k] = v
end
