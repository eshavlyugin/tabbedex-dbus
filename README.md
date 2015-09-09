# tabbedex-dbus
DBus support for urxvt tabbedex plugin

Inspired by [tabbedex](https://github.com/stepb/urxvt-tabbedex) and [dbus](https://github.com/Elv13/urxvt-dbus) plugins.

Install:
- Install urxvt, xwininfo, xdotool, dbus-send utilities
- Copy tabbedex extension to urxvt modules path

Usage:
- Run a command in a new tab
```shell
    urxvtCtl -f -e="command"
```
- Open new tab with name "name"
```shell
    urxvtCtl -f -t="name"
```
- Activate existing or create new tab with name "name"
```shell
    urxvtCtl -f -a="name"
```
- -f flag stand for activating urxvt window and can be ommited
