require "nvchad.mappings"

---@type function
local keymap = vim.keymap.set

keymap("n", ";", ":", { desc = "CMD enter command mode" })
keymap("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- 是否 neovim 运行在 neovide 中
---@type boolean|nil
local is_neovide = vim.g.neovide
if is_neovide then
  -- 使用 ctrl+-/ctrl+= 改变全局渲染缩放
  keymap({ "n", "v" }, "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  keymap({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
end

