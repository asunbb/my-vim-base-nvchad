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

-- 配置 roslyn_ls 使用 mason 安装的 roslyn
local uv = vim.uv or vim.loop
local fs = vim.fs

-- 将 mason bin 路径添加到 PATH
local mason_bin_path = vim.fn.stdpath("data") .. "/mason/bin"
vim.env.PATH = mason_bin_path .. ":" .. vim.env.PATH

-- 使用 vim.lsp.config 配置 roslyn_ls (Neovim 0.11+ 方式)
vim_lsp.config("roslyn_ls", {
    cmd = {
        "roslyn",
        '--logLevel',
        'Information',
        '--extensionLogDirectory',
        fs.joinpath(uv.os_tmpdir(), 'roslyn_ls/logs'),
        '--stdio',
    },
    filetypes = { 'cs' },
    -- root_dir = function(bufnr, on_dir)
    --     -- local path = fs.root(bufnr, {'.sln', '.csproj'})
    --     -- print("333333 -> " .. path)
    --     -- return path
    -- end,
    root_markers = {'.sln', '.csproj'},
    on_attach = function(client, bufnr)
        print("[Roslyn] Language server attached! Client: " .. client.name)
    end,
    settings = {
        ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
        },
        ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
        },
    },
})

vim_lsp.enable("roslyn_ls")

-- 创建 autocmd 在打开 C# 文件时自动启动 roslyn_ls
-- local autocmd_group_roslyn = vim_api.nvim_create_augroup("roslyn_ls_autostart", {clear = true})
-- vim_api.nvim_create_autocmd('FileType', {
--     group = autocmd_group_roslyn,
--     pattern = 'cs',
--     callback = function(ev)
--         -- 使用服务器名称启动 LSP (Neovim 0.11+ 方式)
--         vim_lsp.start({
--             name = "roslyn_ls",
--             bufnr = ev.buf,
--         })
--     end,
-- })
