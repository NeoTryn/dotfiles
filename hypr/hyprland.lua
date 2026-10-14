local dark_amethyst = 0xff0D630
local deep_space_blue = 0xff18314F
local dusk_blue = 0xff384E77
local lavender_grey = 0xff9097C0
local powder_blue = 0xffA7BBEC

hl.config({
	general = {
		border_size = 1,
		gaps_in = 4,
		gaps_out = 4,
		layout = "dwindle",
		locale = "en_US",
		no_focus_fallback = true,
		resize_on_border = true,
		col = {
			active_border = powder_blue,
			inactive_border = dark_amethyst,
		},
		snap = {
			enabled = true,
		}
	},
	decoration = {
		active_opacity = 0.92,
		inactive_opacity = 0.8,
		rounding = 8,
		rounding_power = 3.0,
		blur = {
			enabled = true,
			size = 2,
			aurora = {
			},
		},
		shadow = {
			enabled = true,
		},
		glow = {
			enabled = true,
			color = powder_blue,
			color_inactive = dark_amethyst,
			range = 5,
			render_power = 2,
		},
	},
	misc = {
		disable_hyprland_logo = true,
	},
	animations = {
		enabled = true,
	},
    input = {
        kb_layout = "de",
		follow_mouse = 1,
	},
	xwayland = {
		force_zero_scaling = true,
	}
})

hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@60",
	position = "auto"
})

hl.monitor({
	output = "DP-1",
	mode = "3840x2160@144",
	position = "0x0",
	cm = "auto",
})

hl.monitor({
	output = "DP-2",
	mode = "2560x1440@165",
	position = "auto-center-left",
	cm = "auto",
	transform = 3,
})

hl.device({
	name = "elan050b:00-04f3:31c3-touchpad",
	enabled = true,
})

local suppressMaximizeRule = hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
 })

hl.bind("SUPER + Q", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + B", hl.dsp.exec_cmd("brave"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle"}))
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlauncher"))

hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprsunset & waybar & hyprpaper")
end)

for i = 1, 10 do
	local key = i % 10
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move( {workspace = i }))
end
