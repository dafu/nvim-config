-- scoop install luarocks cmake mingw
-- go install github.com/mattn/efm-langserver@latest
-- luarocks install --server=https://luarocks.org/dev luaformatter

require "lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {formatCommand = "lua-format -i", formatStdin = true}
            }
        }
    }
}
