
require "nvchad.options"

-- asunbb 自定义
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

