-- User window rules. This file is not managed by DMS.

hl.window_rule({
	match = { class = "^(thunar|Thunar|org\\.xfce\\.Thunar)$" },
	float = true,
	size = { "monitor_w * 0.36", "monitor_h * 0.39" },
	center = true,
	suppress_event = "maximize",
})

hl.window_rule({
	match = { class = "^(firefox)$", title = "^(Picture-in-Picture)$" },
	float = true,
	size = { 480, 270 },
	move = { "monitor_w-window_w-24", "monitor_h-window_h-24" },
	pin = true,
	no_initial_focus = true,
})
