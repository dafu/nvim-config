local starter = require("mini.starter")
starter.setup({
	evaluate_single = true,
	header = [[
██████╗  █████╗ ███████╗██╗   ██╗   ██████╗ ███████╗██╗   ██╗
██╔══██╗██╔══██╗██╔════╝██║   ██║   ██╔══██╗██╔════╝██║   ██║
██║  ██║███████║█████╗  ██║   ██║   ██║  ██║█████╗  ██║   ██║
██║  ██║██╔══██║██╔══╝  ██║   ██║   ██║  ██║██╔══╝  ╚██╗ ██╔╝
██████╔╝██║  ██║██║     ╚██████╔╝██╗██████╔╝███████╗ ╚████╔╝ 
╚═════╝ ╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝╚═════╝ ╚══════╝  ╚═══╝  
]],
	footer = "",
	items = {
		starter.sections.recent_files(10, false),
		starter.sections.recent_files(5, true),
		starter.sections.sessions(5, true),
	},
	content_hooks = {
		starter.gen_hook.adding_bullet(),
		starter.gen_hook.aligning("center", "center"),
	},
})
