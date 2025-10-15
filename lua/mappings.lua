require "nvchad.mappings"

---@type function
local keymap = vim.keymap.set

local diagnostic = vim.diagnostic

--keymap("n", ";", ":", { desc = "CMD enter command mode" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

keymap("i", "jk", "<ESC>")

-- nvchad.ui 默认使用 tab/shift+tab 切换标签页
-- ...

-- neovide 相关
-- 是否 neovim 运行在 neovide 中
---@type boolean|nil
local is_neovide = vim.g.neovide
if is_neovide then
  -- 使用 ctrl+-/ctrl+= 改变全局渲染缩放
  keymap({ "n", "v" }, "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  keymap({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
end

-- vim.lsp 诊断
-- 默认设置参考 https://neovim.io/doc/user/diagnostic.html#diagnostic-defaults
-- 定位到下个错误点
local goto_next_error = function()
  diagnostic.jump({severity = diagnostic.severity.ERROR, count = 1})
end
-- 定位到下个警告点
local goto_next_warning = function()
  diagnostic.jump({severity = diagnostic.severity.WARN, count = 1})
end
keymap("n", "<Leader>ge", goto_next_error, {desc = "[diagnostic] goto next error"})
keymap("n", "<Leader>gw", goto_next_warning, {desc = "[diagnostic] goto next warning"})

-- 代码注释相关快捷键 (ai辅助总结)
-- neovim 内置功能如下，参考文件 vim/_defeault.lua
--   普通模式下的 gcc 注释行
--   视图模式下 gc 注释选中区域
--   使用 :verbose map gc 查看
-- NvChad 重映射改造，参考文件 nvchad/lua/mappings.lua
--   普通视图模式，<leader>/ 注释代码
