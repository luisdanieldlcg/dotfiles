# disable greeting
set fish_greeting

abbr z zellij
abbr e helix
abbr c cargo
abbr ca cargo add
abbr cr cargo run
abbr g git
abbr gs git status
abbr gc git commit -am
abbr gcl git clone
abbr gck git checkout
abbr gp git push
abbr gb git branch
abbr z zellij
abbr zl zellij --layout
abbr fwatch watchexec -w . -e dart "zellij action move-focus down && zellij action write-chars 'r' && zellij action move-focus up"

set -Ux EDITOR helix
set fish_term24bit 1

if command -v eza >/dev/null
    abbr l eza
    abbr ls eza
    abbr ll 'eza -l'
    abbr lll 'eza -la'
end

if command -v paru >/dev/null
    abbr p paru
else
    abbr p 'sudo pacman -Syu'
end

# https://zellij.dev/documentation/integration
# if set -q ZELLIJ
# else
# zellij
# end

if command -v fvm >/dev/null
    abbr f 'fvm flutter'
    abbr fr 'fvm flutter run'
    abbr frdev 'fvm flutter run --flavor dev --target lib/main_dev.dart'
    abbr fc 'fvm flutter clean'
    abbr fpg 'fvm flutter pub get'
else
    abbr f flutter
    abbr fr flutter run
    abbr frdev 'flutter run --flavor dev --target lib/main_dev.dart'
    abbr fc 'flutter clean'
    abbr fpg flutter pub get
end

set TTY1 (tty)

if [ "$TTY1" = /dev/tty1 ]
    exec Hyprland
end

function fish_prompt
    set_color blue
    echo -n $USER
    set_color brwhite
    echo -n @
    set_color yellow
    if command -v hostnamectl >/dev/null
        echo -n (hostnamectl hostname)
        # hostnamectl does not exists on macos
    else if command -v hostname >/dev/null
        echo -n (hostname)
    end
    if [ $PWD != $HOME ]
        set_color brblack
        echo -n ':'
        set_color yellow
        echo -n (basename $PWD)
    end
    set_color green
    printf '%s ' (__fish_git_prompt)
    set_color brblack
    echo -n '| '
    set_color normal
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function fwatch
    set PID_FILE "/tmp/tf"(random)".pid"
    zellij --layout="flutter"
end
