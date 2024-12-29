local FRemap = require('foundation_remapping')
local remapper = FRemap.new()

remapper:remap('rcmd', 'f19')
remapper:register()

require('Spoons/input_source')
require('Spoons/app_watcher')
