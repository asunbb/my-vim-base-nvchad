require "nvchad.autocmds"

local creat_autocmd = vim.api.nvim_create_autocmd

-- 进入 buffer 页面时自动检查刷新文件是否有更新
-- autocmd 事件可参考 https://neovim.io/doc/user/autocmd.html#_5.-events
creat_autocmd("BufEnter", {
  ---@param args vim.api.keyset.create_autocmd.callback_args
  callback = function(args)
    vim.cmd(":checktime")
  end,
  -- 任意 buffer
  pattern = "*",
})

