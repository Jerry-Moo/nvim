-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local uv, api = vim.loop, vim.api
local helper = require('core.helper')
local vim_path = helper.get_config_path()

local Packer = {}
Packer.__index = Packer
