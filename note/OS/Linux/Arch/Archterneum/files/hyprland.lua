hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpm reload -n")
    hl.exec_cmd("~/.config/hypr/mpvpaper.sh startLoop 3600")
    hl.exec_cmd("hyprlock -c ~/.config/hypr/hyprlock.conf --immediate-render || hyprctl dispatch exit")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hypridle -c ~/.config/hypr/hypridle.conf")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("vesktop --start-minimized")
    hl.exec_cmd("steam -silent -vgui")
    hl.exec_cmd("zen-browser --new-tab https://doc.altherneum.fr/outils/cube")
    hl.exec_cmd("cliphist wipe")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme \"Adwaita-dark\"")
end)

hl.monitor({
    output = "DP-3",
    mode = "1920x1080",
    position = "0x0",
    scale = "1",
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080",
    position = "auto-left",
    scale = "1",
})

local terminal = "xfce4-terminal"
local terminal_args = "--hide-menubar --hide-scrollbar --hide-toolbar"
local terminal_caller = terminal .. " " .. terminal_args
local fileManager = "nautilus"
local menu = "~/.config/rofi/start.sh"

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("SSH_AUTH_SOCK", "$XDG_RUNTIME_DIR/ssh-agent.socket")

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

hl.config({
    plugin = {
        hyprbars = {
            bar_height = 35,
            bar_blur = true,
            bar_part_of_window = true,
            bar_precedence_over_border = true,
            bar_padding = 50,
            bar_button_padding = 10,
            bar_text_align = "left",
            on_double_click = "hyprctl dispatch 'hl.dsp.window.fullscreen({ mode = \"maximized\", action = \"toggle\" })'",
        },
    },
})


hl.plugin.hyprbars.add_button({
    bg_color = "rgba(0, 0, 0, 0)",
    fg_color = "rgb(FFFFFF)",
    size = 25,
    icon = "",
    action = "hyprctl dispatch 'hl.dsp.window.close()'",
})

hl.plugin.hyprbars.add_button({
    bg_color = "rgba(0, 0, 0, 0)",
    fg_color = "rgb(FFFFFF)",
    size = 10,
    icon = "|",
    action = "",
})

-- Fullscreen Button (was: "hyprctl dispatch fullscreen 1")
hl.plugin.hyprbars.add_button({
    bg_color = "rgba(0, 0, 0, 0)",
    fg_color = "rgb(FFFFFF)",
    size = 25,
    icon = "🗖",
    action = "hyprctl dispatch 'hl.dsp.window.fullscreen({ mode = \"maximized\", action = \"toggle\" })'",
})

hl.plugin.hyprbars.add_button({
    bg_color = "rgba(0, 0, 0, 0)",
    fg_color = "rgb(FFFFFF)",
    size = 10,
    icon = "|",
    action = "",
})

-- Minimize Button (was: "hyprctl dispatch movetoworkspacesilent special:minimized")
hl.plugin.hyprbars.add_button({
    bg_color = "rgba(0, 0, 0, 0)",
    fg_color = "rgb(FFFFFF)",
    size = 25,
    icon = "🗕",
    action   = "~/.config/hypr/minimize.sh",
})

hl.plugin.hyprbars.add_button({
    bg_color = "rgba(0, 0, 0, 0)",
    fg_color = "rgb(FFFFFF)",
    size = 10,
    icon = "|",
    action = "",
})

hl.plugin.hyprbars.add_button({
    bg_color = "rgba(0, 0, 0, 0)",
    fg_color = "rgb(FFFFFF)",
    size = 25,
    icon = "⎗",
    action = "hyprctl dispatch 'hl.dsp.window.float({ action = \"toggle\" })'",
})

hl.plugin.hyprbars.add_button({
    bg_color = "rgba(0, 0, 0, 0)",
    fg_color = "rgb(FFFFFF)",
    size = 10,
    icon = "|",
    action = "",
})

-- Move to Workspace 0 (was: "hyprctl dispatch movetoworkspacesilent +0")
hl.plugin.hyprbars.add_button({
    bg_color = "rgba(0, 0, 0, 0)",
    fg_color = "rgb(FFFFFF)",
    size = 25,
    icon = "⇪",
    action = "~/.config/hypr/resume.sh",
})

hl.plugin.hyprbars.add_button({
    bg_color = "rgba(0, 0, 0, 0)",
    fg_color = "rgb(FFFFFF)",
    size = 10,
    icon = "|",
    action = "",
})   

local mainMod = "SUPER"
hl.bind(mainMod .. " + Super_L", hl.dsp.exec_cmd("pkill rofi || " .. menu), { release = true })
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -s -m window -o ~/Images/hyprshot/"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -s -m output -o ~/Images/hyprshot/"))
hl.bind("CTRL + PRINT", hl.dsp.exec_cmd("hyprshot -s -m region -o ~/Images/hyprshot/"))

hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("~/show_desktop.sh 0.4"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("~/show_desktop.sh 0.05 ; pidof hyprlock || $(hyprlock ; ~/show_desktop.sh)"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal_caller))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit, "))
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.window_rule({
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

hl.window_rule({
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.layer_rule({
    match = { namespace = "rofi" },
    blur = true,
})

hl.layer_rule({
    match = { namespace = "waybar" },
    blur = true,
})

hl.layer_rule({
    match = { namespace = "xfce4-terminal" },
    blur = true,
})

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 1,
        col = {
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 5,
        rounding_power = 1,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },
    animations = {
        enabled = false,
    },
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        allow_session_lock_restore = true,
        session_lock_xray = true,
    },
    input = {
        kb_layout = "fr",
        kb_variant = "",
        kb_model = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        numlock_by_default = true,
        touchpad = {
            natural_scroll = false,
        },
    },
})