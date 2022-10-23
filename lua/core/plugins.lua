-- local PKGS = {
--     'savq/paq-nvim'
-- }

local function clone_paq()
    local path = vim.fn.stdpath 'data' .. '/site/pack/paqs/start/paq-nvim'
    if vim.fn.empty(vim.fn.glob(path)) > 0 then
        vim.fn.system {
            'git',
            'clone',
            '--depth=1',
            'https://github.com/savq/paq-nvim.git',
            path,
        }
    end
end

local function bootstrap()
    clone_paq()

    -- Load Paq
    vim.cmd 'packadd paq-nvim'
    local paq = require 'paq'

    -- Exit nvim after installing plugins
    vim.cmd 'autocmd User PaqDoneInstall quit'

    -- Read and install packages
    paq(PKGS):install()
end

local function sync_all()
    -- package.loaded.paq = nil
    (require 'paq')(PKGS):sync()
end

function addPkgs(p)
  for _, plugin in ipairs(p) do
    table.insert(PKGS, plugin)
  end
end

return { bootstrap = bootstrap, sync_all = sync_all }
