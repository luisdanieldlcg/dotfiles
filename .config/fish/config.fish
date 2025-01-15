# disable greeting
set fish_greeting

abbr e nvim
abbr c cargo
abbr ca cargo add
abbr cr cargo run
abbr g git
abbr gs git status
abbr gc git commit -am
abbr gcl git clone
abbr gck git checkout
abbr gp git push

if command -v eza > /dev/null
	abbr l 'eza'
	abbr ls 'eza'
	abbr ll 'eza -l'
	abbr lll 'eza -la'
end

if command -v paru > /dev/null 
    abbr p 'paru'
else
    abbr p 'sudo pacman -Syu' 
end

if command -v fvm > /dev/null 
    abbr f 'fvm flutter'
    abbr fr 'fvm flutter run'
    abbr frdev 'fvm flutter run --flavor dev --target lib/main_dev.dart'
    abbr fc 'fvm flutter clean'
    abbr fpg 'fvm flutter pub get'
else
    abbr f  flutter
    abbr fr flutter run
    abbr frdev 'flutter run --flavor dev --target lib/main_dev.dart'
    abbr fc 'flutter clean'
    abbr fpg flutter pub get
end

if [ "$TTY1" = "/dev/tty1" ]; then
    exec Hyprland
end

function fish_prompt
    set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
    echo -n $USER
	set_color brwhite
    echo -n @
	set_color yellow
	echo -n (hostnamectl hostname)
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
