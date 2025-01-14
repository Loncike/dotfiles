local lsp = require("lsp-zero")

local function attach(opts)

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

lsp.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}
    attach(opts)
end)

lsp.preset("recommended")

lsp.ensure_installed({
  "tsserver",
  "lua_ls",
  "rust_analyzer",
})

-- Fix Undefined global "vim"
lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

require("lspconfig.configs").myGoLps={
    default_config = {
        name = "goLspTry",
        cmd= {"gopls"},
        filetypes = {"gowork", "gomod", "go", "gotmpl"},
        root_dir = require("lspconfig.util").root_pattern({"go.work", "go.mod", ".git"}),
        settings = {
            gopls = {completeUnimported = true,
                    usePlaceholders=false,
                    analyses={
                    unusedparams = true}}
        }
    }
}


require('lspconfig').ocamllsp.setup({
    cmd = { "ocamllsp" },
    on_attach = function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}
        attach(opts)
    end
})

--[[
-- Fix Undefined global "vim"
lsp.configure("rust_analyzer", {
    cmd = { "" },
})
--]]


local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["P"] = cmp.mapping.select_prev_item(cmp_select),
  ["N"] = cmp.mapping.select_next_item(cmp_select),
  ["Y"] = cmp.mapping.confirm({ select = true }),
  ["<S-Space>"] = cmp.mapping.complete(),
})
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I"
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    attach(opts)
end)

lsp.configure("myGoLps",{force_setup = true})
lsp.setup()
