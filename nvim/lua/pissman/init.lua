-- Load order matters: leader must be set (in remap) before lazy.nvim loads plugins.
require("pissman.set")
require("pissman.remap")
require("pissman.autocmds")
require("pissman.lazy")
