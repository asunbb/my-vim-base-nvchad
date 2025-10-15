
require "nvchad.options"

-- ======================== asunbb 自定义
-- 使用 :h vim.o 查看 vim.o 和 vim.opt 不同格式用法
local o = vim.o
local opt = vim.opt

-- 高亮光标行和光标行号
opt.cursorlineopt = "both"

-- 显示光标相对行数
opt.relativenumber = true

-- 是否 neovim 运行在 neovide 中
---@type boolean|nil
local is_neovide = vim.g.neovide
if is_neovide then
  -- 设置字体和大小
  o.guifont = "Hack Nerd Font Mono:h15"
end

-- tab
-- 每个 tab 的可见空格数量
opt.tabstop = 4
opt.softtabstop = 4
-- 一个 tab 按键插入的空格数量
opt.shiftwidth = 4
-- 把 tab 按键扩展成空格
opt.expandtab = true

