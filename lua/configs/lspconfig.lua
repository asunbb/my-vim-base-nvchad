require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers:

---------------------------------------- asunbb 自定义
local vim_lsp = vim.lsp
local vim_api = vim.api
---@type string
local name_lua_ls = "lua_ls"
---@type string
local name_lua_version = "Lua 5.4"
---@type number
local autocmd_group_lsp_lua = vim_api.nvim_create_augroup("lsp_lua_conf", {clear = true})

-- 当 lsp 客户端执行初始化并连接到 buffer 后执行
vim_api.nvim_create_autocmd('LspAttach', {
    group = autocmd_group_lsp_lua,
    ---@param ev vim.api.keyset.create_autocmd.callback_args
    callback = function(ev)
        local client = vim_lsp.get_client_by_id(ev.data.client_id)
        if client and client.name == name_lua_ls then
            client.config.settings.Lua.runtime.version = name_lua_version
            -- 通知服务器配置更改
            if client.server_capabilities.workspaceConfiguration then
                client:notify("workspace/didChangeConfiguration", {
                    settings = client.config.settings
                })
            end
        end
    end
})

