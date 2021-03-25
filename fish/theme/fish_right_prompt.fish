set -g __fish_git_prompt_char_cleanstate "$c_green✔"
set -g __fish_git_prompt_char_conflictedstate "$c_red✖ "

set -g __fish_git_prompt_char_dirtystate "$c_magenta±"
set -g __fish_git_prompt_char_stagedstate "$c_yellow⊙"
set -g __fish_git_prompt_char_untrackedfiles "$c_cyan※"

# Function
function __chain_right_prompt_git
  if test (__if_git)
  	__chain_git
    echo -n -s "$git_arr[2]"
    echo -n -s "$c_reset"
    echo -n -s "$c_black"
  end
end

# Output
function fish_right_prompt
  __chain_right_prompt_git
end
