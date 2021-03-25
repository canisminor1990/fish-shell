# Initialize
set c_red (set_color --bold red)
set c_magenta (set_color --bold magenta)
set c_yellow (set_color --bold yellow)
set c_green (set_color --bold green)
set c_blue (set_color --bold blue)
set c_cyan (set_color --bold cyan)
set c_black  (set_color --bold black)
set c_reset (set_color normal)

# Configure __fish_git_prompt
set -g __fish_git_prompt_show_informative_status true
set -g __fish_git_prompt_showupstream true
set -g __fish_git_prompt_describe_style contains

set -g chain_prompt_glyph '$'
set -g chain_git_branch_glyph "⎇"
set -g __fish_prompt_hostname (hostname|cut -d . -f 1)

set -g __fish_git_prompt_char_upstream_ahead "$c_magenta⇡"
set -g __fish_git_prompt_char_upstream_behind "$c_magenta⇣"

set -g __fish_git_prompt_char_stateseparator ','

# Function
function __chain_git
    set -g git (__fish_git_prompt "$c_cyan %s$c_reset")
    set -g git_arr (string split , $git)
end

function __if_git
  echo (command git symbolic-ref HEAD ^/dev/null)
end

function __chain_prompt_root
   echo -n -s $c_green
   echo -n -s "$USER"
   echo -n -s "@"
   echo -n -s "$__fish_prompt_hostname"
   echo -n -s $c_reset
   echo -n -s ':'

end

function __chain_prompt_dir
  echo -n -s $c_blue
  echo -n -s (prompt_pwd)
  echo -n -s '/'
end

function __chain_prompt_git
  if test (__if_git)
    __chain_git
    echo -n -s $c_cyan
    echo -n -s "$chain_git_branch_glyph"
    echo -n -s "$git_arr[1]"
  end
end

function __chain_prompt_arrow
  if test $last_status = 0
    echo -n -s $c_reset
  else
    echo -n -s $c_red
  end
  echo -n "$chain_prompt_glyph "
end

# Output
function fish_prompt
  set -g last_status $status

  __chain_prompt_root
  __chain_prompt_dir
  __chain_prompt_git
  __chain_prompt_arrow

  echo -n -s $c_reset
end
