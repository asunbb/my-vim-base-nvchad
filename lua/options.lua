
require "nvchad.options"

-- asunbb 自定义
-- 使用 :h vim.o 查看 vim.o 和 vim.opt 不同格式用法
local o = vim.o
local opt = vim.opt

-- 高亮光标行和光标行号
opt.cursorlineopt = "both"

-- 显示光标相对行数
opt.relativenumber = true

