vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end


  augroup _close_tree
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  augroup end
]])

--[[ augroup _format ]]
--[[   autocmd! ]]
--[[   autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000) ]]
--[[ augroup end ]]

-- local opts = { noremap = true, silent = true }
-- local keymap = vim.api.nvim_set_keymap
--
-- vim.api.nvim_create_autocmd({ "BufUnload" }, {
--   pattern = "*.md",
--   command = "MarkdownPreviewStop"
-- })
