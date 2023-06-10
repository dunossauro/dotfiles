from libqtile.config import Key, Group
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = 'mod4'
alt = 'mod1'
terminal = guess_terminal()

foco = [     # Foco das janelas
    Key([mod], 'Left', lazy.layout.left(), desc='Move focus to left'),
    Key([mod], 'Right', lazy.layout.right(), desc='Move focus to right'),
    Key([mod], 'Down', lazy.layout.down(), desc='Move focus down'),
    Key([mod], 'Up', lazy.layout.up(), desc='Move focus up'),
]

movimentação = [
    Key(
        [mod],
        'space',
        lazy.window.toggle_floating(),
        desc='Window floating',
    ),
    Key(
        [mod, 'shift'],
        'Left',
        lazy.layout.shuffle_left(),
        desc='Move window to the left',
    ),
    Key(
        [mod, 'shift'],
        'Right',
        lazy.layout.shuffle_right(),
        desc='Move window to the right',
    ),
    Key(
        [mod, 'shift'],
        'Down',
        lazy.layout.shuffle_down(),
        desc='Move window down',
    ),
    Key(
        [mod, 'shift'],
        'Up',
        lazy.layout.shuffle_up(),
        desc='Move window down',
    ),
]

keys = [
    *foco,
    *movimentação,
    Key([mod], 'Return', lazy.spawn(terminal), desc='Launch terminal'),
    Key([mod], 'Tab', lazy.next_layout(), desc='Toggle between layouts'),
    Key([mod, 'shift'], 'q', lazy.window.kill(), desc='Kill focused window'),
    Key([mod, 'control'], 'r', lazy.reload_config(), desc='Reload the config'),
    Key([mod, 'control'], 'q', lazy.shutdown(), desc='Shutdown Qtile'),
    # Rofi
    Key([alt], 'F2', lazy.spawn('rofi -show run'), desc='Open rofi'),
    Key([alt], 'Tab', lazy.spawn('rofi -show window'), desc='Open rofi'),
    # Music
    Key([alt], 'Down', lazy.spawn('playerctl play-pause'), desc='Pause music'),
    Key([alt], 'Left', lazy.spawn('playerctl previous'), desc='Pause music'),
    Key([alt], 'Right', lazy.spawn('playerctl next'), desc='Pause music'),
    # TODO: Key([alt], 'Up', lazy.spawn('playerctl stop'), desc="Pause music"),
]

groups = [Group(i) for i in '123456789']

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc='Switch to group {}'.format(i.name),
            ),
            Key(
                [mod, 'shift'],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc='Switch to & move focused window to group {}'.format(
                    i.name
                ),
            ),
        ]
    )
