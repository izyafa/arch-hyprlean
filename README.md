# Arch Lightweight Hyprland Setup
This will be a hyprland setup for my business-grade laptop with 8 gigs of ram that is dual-booting Win10 and Arch. (not done yet)

### End Goals:
- RAM usage on idle is 1 GB or less.
- Easy media and file transfer between phone and the laptop.
- Floating window for Wi-Fi, Bluetooth, Speaker, notif, etc.
- Syncronized WhatsApp, Social media, and Browser stuff 
- User can choose when to go full on keyboard for works or pure mouse for quality of life
- Looks beautiful (riced) when it can be, or save more memory when it needs to be

### Rules:
- Try to use less daemon
- Modularized the Dotfiles for easy configuration

## Configurations
Software, utilities, and miscellaneous stuff used to achieve said goals

### Plugins/Utility used:
- Waybar (Workspace, Running App, Hardware, and system control mgmt.)
- ...might use Quickshell instead
- Fuzzel                (Launchers)
- NetworkManager        (Network manager, not using iwctl cuz its a hassle)
- PulseAudio            (Sound manager)
- ufw                   (firewall, some port is opened for a lot of apps, so need something to manage that)
- Hyprlock & Hypridle   (for sleep & lock)
- Hyprpaper             (walpaper mgmt.)
- Wlogout               (the power button)
- Swaync                (Notif mgmt.)
- Grim & Wf-recorder    (Screenshot & record)
- (something to do googlescan)
- (something to zoom in and zoom out screen following the cursor)
- (script for cheatsheet

### App used: 
- Firefox               (Browser)
- Dolphin               (File Manager)
- KDE Connect           (Device integration)
- Foot                  (Terminal)
- VSCodium              (IDE)
- LibreOffice           (Office Suites)
- NeoVim                (Text editor)
- Ghostwriter           (Note taking... or just use NVim)
- KDE Connect
- LocalSend

### I have yet to fully figure out
- Gaming
- Security, firewall, and networking..?
- Multiple firefox profiles mgmt
- Study and work mgmt
- Virtualization (to run MS Office Suite without dual-booting)
