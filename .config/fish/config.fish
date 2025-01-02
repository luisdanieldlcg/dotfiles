set fish_greeting

abbr -a c cargo
abbr ca cargo add
abbr cr cargo run
abbr g git
abbr gc git commit -m
abbr gcl git clone
abbr gck git checkout

if [ "$TTY1" = "/dev/tty1" ]; then
    exec Hyprland
end
