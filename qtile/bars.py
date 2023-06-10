from libqtile import bar, widget
from libqtile.config import Screen

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.WindowName(),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
                widget.CPU(),
                widget.Battery(),
                widget.Wlan(),
                widget.PulseVolume(),
                widget.Bluetooth(),
                widget.QuickExit(),
                widget.Systray(),
            ],
            24,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.WindowName(),
            ],
            20,
        ),
    ),
]
