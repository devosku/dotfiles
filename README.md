# Dotfiles

## Overview

This is my personal dotfiles repo.

Originally forked off from https://github.com/jeffaco/dotfiles.

## Supports multiple platforms

Directory | Purpose
--------- | -------
nix       | Ubuntu
windows   | Windows

## Using this repo

To clone dotfiles onto a new system:

```
$ git clone git@github.com:morko/dotfiles.git
```

## Bootstrapping in Linux

```
$ bash ./nix/bootstrap.sh
```

## Bootstrapping in Windows

```
cd windows\
bootstrap.ps1
```

Reload the terminal and then:

```
cd windows\
install-dependencies.ps1
```

## Useful notes for new systems

This section contains useful notes for newly installed systems.

### Share .ssh and .aws configurations with Windows and WSL

Add the following to `/etc/fstab` (replace `<your-user>`):


```
C:/Users/<your-user>/.ssh /home/<your-user>/.ssh drvfs rw,noatime,uid=1000,gid=1000,case=off,umask=0077,fmask=0177, 0 0
C:/Users/<your-user>/.aws /home/<your-user>/.aws drvfs rw,noatime,uid=1000,gid=1000,case=off,umask=0077,fmask=0177, 0 0
```

### Fix ctrl+v and ctrl-c in Windows terminal overriding vim keybinds

https://learn.microsoft.com/en-us/windows/terminal/install#settings-json-file

Edit `%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`.

Under "actions" modify the entries so that you will have to press ctrl+shift
instead of just ctrl:

```
{
    "command": 
    {
        "action": "copy",
        "singleLine": false
    },
    "keys": "ctrl+shift+c"
},
{
    "command": "paste",
    "keys": "ctrl+shift+v"
},
```

### Dual booting windows and ubuntu

Fix the "clock problem" by making linux use 'local' time:

    Ubuntu 15.04 systems and above (e.g. Ubuntu 16.04 LTS):
        open a terminal and execute the following command
        ```
        timedatectl set-local-rtc 1
        ```
