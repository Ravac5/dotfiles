# Wallcards

A `lively` wallpaper selector for images and videos with live preview.

> [!IMPORTANT]
> This plugin is in an early state. Since it hasn't been tested extensively,
there are probably some rough edges. More features are coming — if you find
bugs or have ideas, let me know on GitHub.

https://github.com/user-attachments/assets/9ffbc83d-95e5-4dcd-a834-7bd224211b55

## Features

- Browse image and video wallpapers as a scrollable card stack
- Live preview — applies the wallpaper and updates the colorscheme as you navigate
- Filter by type or jump to a random card
- Keyboard and partial mouse navigation
- Automatic thumbnail generation for fast browsing

## Future Work

- Video wallpaper support
- Card sorting based on colors
- Plugin settings panel
- Better Bar widget
- More customizability

## Dependencies

```sh
pacman -S imagemagick ffmpeg
```

## IPC Commands

Control the plugin from the command line:

```sh
qs -c noctalia-shell ipc call plugin:wallcards toggle
```

## Keybinding Examples

Add to your compositor configuration:

### Hyprland

```conf
bind = SUPER, A, exec, qs -c noctalia-shell ipc call plugin:wallcards toggle
```

### Keybinds

| Key | Action |
| --- | --- |
| `J` / `←` | Previous wallpaper |
| `K` / `→` | Next wallpaper |
| `H` | Scroll page back |
| `L` | Scroll page forward |
| `R` / `↑` | Shuffle |
| `P` | Toggle live preview |
| `A` | Show all |
| `I` | Filter images |
| `V` | Filter videos |
| `Enter` / `Space` / `↓` | Apply wallpaper |
| `Esc` / `Q` | Close |

Scroll wheel also works for navigation.

## Configuration

Settings are currently only defined in `manifest.json` in the plugin directory
`~/.config/noctalia/plugins/wallcards`. A settings panel is coming soon.

| Setting | Description |
| --- | --- |
| `animation_duration` | Duration of card transition animations in ms |
| `background_color` | Color of the dimmed backdrop |
| `background_opacity` | Opacity of the dimmed backdrop |
| `cards_shown` | Number of visible cards in the stack |
| `card_height` | Height of the card area in pixels |
| `card_spacing` | Gap between cards in pixels |
| `card_strip_width` | Width of non-center cards |
| `card_radius` | Border radius of the cards |
| `filter_images` | File extensions treated as images |
| `filter_videos` | File extensions treated as videos |
| `live_preview` | Apply wallpaper while navigating |
| `selected_filter` | Default filter on open (`all`, `images`, `videos`) |
| `shear_factor` | Sheasring applied to the card stack |
| `top_bar_height` | Height of the toolbar |
| `top_bar_radius` | Border radius of the toolbar |

## License

MIT License - see repository for details.

## Credits

- Inspired by [liixini/skwd](https://github.com/liixini/skwd)
- Built for [Noctalia Shell](https://github.com/noctalia-dev/noctalia-shell)
