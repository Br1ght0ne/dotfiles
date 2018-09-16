# BrightOne's build of st - the simple (suckless) terminal

Forked from [https://github.com/LukeSmithxyz/st](https://github.com/LukeSmithxyz/st).

Patches:

+ copy to clipboard
+ solarized colors (light and dark toggleable)
+ vertcenter
+ scrollback with keyboard
+ scrollback with mouse

## Luke Smith's additions

+ Default font is system "mono" at 14pt
+ Fixed transparency patch (see below for installation)
+ Toggle light/dark mode now Alt-Tab instead of the frequently conflicting F6
+ Alt-k and Alt-j scroll back/foward in history one line at a time
+ Alt-u and Alt-d scroll back/foward in history a page at a time

## Terminal-specific mappings

(Additions before me.)

+ Scroll through history -- Shift+PageUp/PageDown or Shift+Mouse wheel
+ Increase/decrease font size -- Shift+Alt+PageUp/PageDown
+ Return to default dont size -- Shift+Alt+Home
+ Paste -- Shift+Insert

## Installation for newbs

```
make
sudo make install
```

### Transparency

If you want transparency, run the following. (You will also need to have a composite manager, such as compton or xcompmgr running for the transparency to appear.)

```
make clean
patch < patches/transparency.diff
make
sudo make install
```

And to remove transparency, just unapply the diff patch and reinstall.

```
make clean
patch -R < patches/transparency.diff
make
sudo make install
```
