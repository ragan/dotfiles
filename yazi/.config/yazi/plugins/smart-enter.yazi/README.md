# smart-enter.yazi

[`Open`][open] files or [`enter`][enter] directories all in one key!

## Installation

```sh
ya pack -a yazi-rs/plugins:smart-enter
```

## Usage

Bind your <kbd>l</kbd> key to plugin, in your `~/.config/yazi/yazi.toml`:

```toml
[[manager.prepend_keymap]]
on   = "l"
run  = "plugin smart-enter"
desc = "Enter child directory, or open a file"
```

## Advanced

By default, `--hovered` is passed to [`open`][open] command, make the behavior consistent with [`enter`][enter] command avoiding accidental triggers,
which means both will only target the currently hovered file.

If you still want `open` to target multiple selected files, add this to your `~/.config/yazi/yazi.toml`:

```lua
[plugin.smart-enter]
open_multi = true
```

**Note:** This plugin's configuration format may vary - check upstream documentation for latest usage.

## License

This plugin is MIT-licensed. For more information check the [LICENSE](LICENSE) file.

[open]: https://yazi-rs.github.io/docs/configuration/keymap/#manager.open
[enter]: https://yazi-rs.github.io/docs/configuration/keymap/#manager.enter
