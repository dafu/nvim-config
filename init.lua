local configs = {
  "core.plugins",
  "configs.lsp",
  "configs.lspsaga",
  -- "configs.cmp",
  "configs.fzf",
  "configs.treesitter",
  "configs.wiki",
  "configs.timer",
  "configs.gopls",
  "configs.neoformat",
  "configs.gpg",
  "configs.mini",
  "configs.gitsigns",
  "configs.nord",
  "core.disabled",
  "core.options",
  "core.statusline",
  "core.autocmds",
  "core.keybinds",
}

local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
  impatient.enable_profile()
end

for _, f in pairs(configs) do
  local ok, err = pcall(require, f)
  if not ok then
    print('Error loading: ' .. f .. ': ' .. err)
  end
end
