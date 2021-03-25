

function fish_greeting

	set c_yellow  (set_color --bold yellow)
	set c_green (set_color --bold green)
	set c_blue (set_color --bold blue)
	set c_cyan (set_color --bold cyan)
	set c_black  (set_color black)
	set c_reset (set_color normal)
	set __split "$c_black=================================$c_reset"
	
	clear
	echo "$__split"
	echo -n -s " 🌝  "
	echo -n -s "$c_yellow"
	echo -n -s "Hey "
	echo -n -s "$c_green"
	echo -n -s "Canis Minor "
	echo -n -s "$c_blue"
	echo -n -s "~ "
	echo -n -s "$c_cyan"
	date "+%H:%M:%S"
	echo "$__split"
end
