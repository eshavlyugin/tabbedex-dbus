# tabbedex-dbus
DBus support for urxvt tabbedex plugin

Inspired by [tabbedex](https://github.com/stepb/urxvt-tabbedex) and [dbus](https://github.com/Elv13/urxvt-dbus) plugins.

Install:
1. Install urxvt, xwininfo, xdotool, dbus-send utilities
2. Copy tabbedex extension to urxvt modules path

Usage:
- Run a command in a new tab
    urxvtCtl -f -e="command"
- Open new tab with name "name"
    urxvtCtl -f -t="name"
- Activate existing or create new tab with name "name"
    urxvtCtl -f -a="name"

-f flag stand for activating urxvt window and can be ommited
