local options = {
  -- neovide_fullscreen = true,
  neovide_remember_window_size = true,
}

for key, value in pairs(options) do
  vim.g[key] = value
end
