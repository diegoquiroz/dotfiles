hs.ipc.cliInstall("/opt/homebrew/bin/")

stackline = require("stackline")
stackline:init({
	paths = {
		yabai = "/opt/homebrew/bin/yabai",
	},
})
stackline.config:toggle("appearance.showIcons")
stackline.config:set("appearance.offset.x", 10)
