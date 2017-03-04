#
# Prompt theme name:
#   dangerous
#
# Description:
#   a sophisticated theme
#
# Author:
#   Joseph Tannhuber <sepp.tannhuber@yahoo.de>
#
# Sections:
#   -> Files
#   -> Functions
#     -> Pre execute
#     -> Directory history
#     -> Command history
#     -> Bookmarks
#     -> Sessions
#     -> Commandline editing with $EDITOR
#     -> Git segment
#     -> Bind-mode segment
#     -> Symbols segment
#   -> Prompt initialization
#   -> Left prompt
#
###############################################################################

###############################################################################
# => Files
###############################################################################

# Config file
set -g dangerous_config "$HOME/.config/fish/dangerous_config.fish"

# Temporary files
set -g dangerous_tmpfile '/tmp/'(echo %self)'_dangerous_edit.fish'

###############################################################################
# => Functions
###############################################################################

fzf_key_bindings

################
# => Pre execute
################
function __dangerous_preexec -d 'Execute after hitting <Enter> before doing anything else'
  set -l cmd (commandline | sed 's|\s\+|\x1e|g')
  if [ $_ = 'fish' ]
    if [ -z $cmd[1] ]
      set -e cmd[1]
    end
    if [ -z $cmd[1] ]
      return
    end
    set -e dangerous_prompt_error[1]
    if not type -q $cmd[1]
      if [ -d $cmd[1] ]
        set dangerous_prompt_error (cd $cmd[1] ^&1)
        and commandline ''
        commandline -f repaint
        return
      end
    end
    switch $cmd[1]
      case 'c'
        if begin
            [ (count $cmd) -gt 1 ]
            and [ $cmd[2] -gt 0 ]
            and [ $cmd[2] -lt $pcount ]
          end
          commandline $prompt_hist[$cmd[2]]
          echo $prompt_hist[$cmd[2]] | xsel -b -i
          commandline -f repaint
          return
        end
      case 'cd'
        if [ (count $cmd) -le 2 ]
          set dangerous_prompt_error (eval $cmd ^&1)
          and commandline ''
          if [ (count $dangerous_prompt_error) -gt 1 ]
            set dangerous_prompt_error $dangerous_prompt_error[1]
          end
          commandline -f repaint
          return
        end
      case 'day' 'night'
        if [ (count $cmd) -eq 1 ]
          eval $cmd
          commandline ''
          commandline -f repaint
          return
        end
    end
  end
  commandline -f execute
end

#####################
# => Fish termination
#####################
function __dangerous_on_termination -s HUP -s INT -s QUIT -s TERM --on-process %self -d 'Execute when shell terminates'
  set -l item (contains -i %self $dangerous_sessions_active_pid ^ /dev/null)
  __dangerous_detach_session $item
end

######################
# => Directory history
######################
function __dangerous_create_dir_hist -v PWD -d 'Create directory history without duplicates'
  if [ "$pwd_hist_lock" = false ]
    if contains $PWD $$dir_hist
      set -e $dir_hist[1][(contains -i $PWD $$dir_hist)]
    end
    set $dir_hist $$dir_hist $PWD
    set -g dir_hist_val (count $$dir_hist)
  end
end

function __dangerous_cd_prev -d 'Change to previous directory, press H in NORMAL mode.'
  if [ $dir_hist_val -gt 1 ]
    set dir_hist_val (expr $dir_hist_val - 1)
    set pwd_hist_lock true
    cd $$dir_hist[1][$dir_hist_val]
    commandline -f repaint
  end
end

function __dangerous_cd_next -d 'Change to next directory, press L in NORMAL mode.'
  if [ $dir_hist_val -lt (count $$dir_hist) ]
    set dir_hist_val (expr $dir_hist_val + 1)
    set pwd_hist_lock true
    cd $$dir_hist[1][$dir_hist_val]
    commandline -f repaint
  end
end

function d -d 'List directory history, jump to directory in list with d <number>'
  set -l num_items (expr (count $$dir_hist) - 1)
  if [ $num_items -eq 0 ]
    set_color $fish_color_error[1]
    echo 'Directory history is empty. '(set_color normal)'It will be created automatically'
    return
  end
  for i in (seq $num_items)
    if [ (expr \( $num_items - $i \) \% 2) -eq 0 ]
      set_color normal
    else
      set_color $dangerous_colors[3]
    end
    echo '›' (expr $num_items - $i)\t$$dir_hist[1][$i] | sed "s|$HOME|~|"
  end
  if [ $num_items -eq 1 ]
    set last_item ''
  else
    set last_item '-'(expr $num_items - 1)
  end
  echo -en $dangerous_cursors[2]
  set input_length (expr length (expr $num_items - 1))
  read -p 'echo -n (set_color $dangerous_colors[5])"♻ Goto [e|0"$last_item"] ❯ "' -n $input_length -l dir_num
  switch $dir_num
    case (seq 0 (expr $num_items - 1))
      cd $$dir_hist[1][(expr $num_items - $dir_num)]
    case 'e'
      read -p 'echo -n (set_color $dangerous_colors[5])"♻ Erase [0"$last_item"] ❯ "' -n $input_length -l dir_num
      set -e $dir_hist[1][(expr $num_items - $dir_num)] ^ /dev/null
      set dir_hist_val (count $$dir_hist)
      tput cuu1
  end
  for i in (seq (expr $num_items + 1))
    tput cuu1
  end
  tput ed
  tput cuu1
  set pcount (expr $pcount - 1)
  set no_prompt_hist 'T'
end

####################
# => Command history
####################
function __dangerous_create_cmd_hist -e fish_prompt -d 'Create command history without duplicates'
  if [ $_ = 'fish' ]
    set -l IFS ''
    set -l cmd (echo $history[1] | fish_indent | expand -t 4)
    # Create prompt history
    if begin
        [ $pcount -gt 0 ]
        and [ $no_prompt_hist = 'F' ]
      end
      set prompt_hist[$pcount] $cmd
    else
      set no_prompt_hist 'F'
    end
    set pcount (expr $pcount + 1)
    # Create command history
    if not begin
        expr $cmd : '[cdms] ' > /dev/null
        or contains $cmd $dangerous_nocmdhist
      end
      if contains $cmd $$cmd_hist
        set -e $cmd_hist[1][(contains -i $cmd $$cmd_hist)]
      end
      set $cmd_hist $$cmd_hist $cmd
    end
  end
  set fish_bind_mode insert
  echo -n \a
end

function c -d 'List command history, load command from prompt with c <prompt number>'
  set -l num_items (count $$cmd_hist)
  if [ $num_items -eq 0 ]
    set_color $fish_color_error[1]
    echo 'Command history is empty. '(set_color normal)'It will be created automatically.'
    return
  end
  for i in (seq $num_items)
    if [ (expr \( $num_items - $i \) \% 2) -eq 0 ]
      set_color normal
    else
      set_color $dangerous_colors[3]
    end
    echo -n '› '(expr $num_items - $i)
    set -l item (echo $$cmd_hist[1][$i])
    echo -n \t$item\n
  end
  if [ $num_items -eq 1 ]
    set last_item ''
  else
    set last_item '-'(expr $num_items - 1)
  end
  echo -en $dangerous_cursors[4]
  set input_length (expr length (expr $num_items - 1))
  read -p 'echo -n (set_color $dangerous_colors[9])"↩ Exec [e|0"$last_item"] ❯ "' -n $input_length -l cmd_num
  switch $cmd_num
    case (seq 0 (expr $num_items - 1))
      commandline $$cmd_hist[1][(expr $num_items - $cmd_num)]
      echo $$cmd_hist[1][(expr $num_items - $cmd_num)] | xsel -b -i
      for i in (seq (count (echo $$cmd_hist\n)))
        tput cuu1
      end
    case 'e'
      read -p 'echo -n (set_color $dangerous_colors[9])"↩ Erase [0"$last_item"] ❯ "' -n $input_length -l cmd_num
      for i in (seq (count (echo $$cmd_hist\n)))
        tput cuu1
      end
      tput cuu1
      set -e $cmd_hist[1][(expr $num_items - $cmd_num)] ^ /dev/null
  end
  tput ed
  tput cuu1
  set pcount (expr $pcount - 1)
  set no_prompt_hist 'T'
end

##############
# => Bookmarks
##############
function mark -d 'Create bookmark for present working directory.'
  if not contains $PWD $bookmarks
    set -U bookmarks $PWD $bookmarks
    set pwd_hist_lock true
    commandline -f repaint
  end
end

function unmark -d 'Remove bookmark for present working directory.'
  if contains $PWD $bookmarks
    set -e bookmarks[(contains -i $PWD $bookmarks)]
    set pwd_hist_lock true
    commandline -f repaint
  end
end

function m -d 'List bookmarks, jump to directory in list with m <number>'
  set -l num_items (count $bookmarks)
  if [ $num_items -eq 0 ]
    set_color $fish_color_error[1]
    echo 'Bookmark list is empty. '(set_color normal)'Enter '(set_color $fish_color_command[1])'mark '(set_color normal)'in INSERT mode or '(set_color $fish_color_command[1])'m '(set_color normal)'in NORMAL mode, if you want to add the current directory to your bookmark list.'
    return
  end
  for i in (seq $num_items)
    if [ $PWD = $bookmarks[$i] ]
      set_color $dangerous_colors[10]
    else
      if [ (expr \( $num_items - $i \) \% 2) -eq 0 ]
        set_color normal
      else
        set_color $dangerous_colors[3]
      end
    end
    echo '› '(expr $num_items - $i)\t$bookmarks[$i] | sed "s|$HOME|~|"
  end
  if [ $num_items -eq 1 ]
    set last_item ''
  else
    set last_item '-'(expr $num_items - 1)
  end
  echo -en $dangerous_cursors[1]
  set input_length (expr length (expr $num_items - 1))
  read -p 'echo -n (set_color $dangerous_colors[10])"⌘ Goto [0"$last_item"] ❯ "' -n $input_length -l dir_num
  switch $dir_num
    case (seq 0 (expr $num_items - 1))
      cd $bookmarks[(expr $num_items - $dir_num)]
  end
  for i in (seq (expr $num_items + 1))
    tput cuu1
  end
  tput ed
  tput cuu1
end

#############
# => Sessions
#############
function __dangerous_delete_zombi_sessions -d 'Delete zombi sessions'
  for i in $dangerous_sessions_active_pid
    if not contains $i %fish
      set -l item (contains -i $i $dangerous_sessions_active_pid)
      set -e dangerous_sessions_active_pid[$item]
      set -e dangerous_sessions_active[$item]
    end
  end
end

function __dangerous_create_new_session -d 'Create a new session'
  set -U dangerous_session_cmd_hist_$argv[1] $$cmd_hist
  set -U dangerous_session_dir_hist_$argv[1] $$dir_hist
  set -U dangerous_sessions $argv[1] $dangerous_sessions
end

function __dangerous_erase_session -d 'Erase current session'
  if [ (count $argv) -eq 1 ]
    set_color $fish_color_error[1]
    echo 'Missing argument: name of session to erase'
    return
  end
  if contains $argv[2] $dangerous_sessions_active
    set_color $fish_color_error[1]
    echo "Session '$argv[2]' cannot be erased because it's currently active."
    return
  end
  if contains $argv[2] $dangerous_sessions
    set -e dangerous_session_cmd_hist_$argv[2]
    set -e dangerous_session_dir_hist_$argv[2]
    set -e dangerous_sessions[(contains -i $argv[2] $dangerous_sessions)]
  else
    set_color $fish_color_error[1]
    echo "Session '$argv[2]' not found. "(set_color normal)'Enter '(set_color $fish_color_command[1])'s '(set_color normal)'to show a list of all recorded sessions.'
  end
end

function __dangerous_detach_session -d 'Detach current session'
  set cmd_hist cmd_hist_nosession
  set dir_hist dir_hist_nosession
  if test -z $$dir_hist ^ /dev/null
    set $dir_hist $PWD
  end
  set dir_hist_val (count $$dir_hist)
  set -e dangerous_sessions_active_pid[$argv] ^ /dev/null
  set -e dangerous_sessions_active[$argv] ^ /dev/null
  set dangerous_session_current ''
  cd $$dir_hist[1][$dir_hist_val]
  set no_prompt_hist 'T'
end

function __dangerous_attach_session -d 'Attach session'
  set argv (echo -sn $argv\n | sed 's|[^[:alnum:]]|_|g')
  if contains $argv[1] $dangerous_sessions_active
    wmctrl -a "✻ $argv[1]"
  else
    wt "✻ $argv[1]"
    __dangerous_detach_session $argv[-1]
    set dangerous_sessions_active $dangerous_sessions_active $argv[1]
    set dangerous_sessions_active_pid $dangerous_sessions_active_pid %self
    set dangerous_session_current $argv[1]
    if not contains $argv[1] $dangerous_sessions
      __dangerous_create_new_session $argv[1]
    end
    set cmd_hist dangerous_session_cmd_hist_$argv[1]
    set dir_hist dangerous_session_dir_hist_$argv[1]
    if  test -z $$dir_hist ^ /dev/null
      set $dir_hist $PWD
    end
    set dir_hist_val (count $$dir_hist)
    cd $$dir_hist[1][$dir_hist_val] ^ /dev/null
  end
  set no_prompt_hist 'T'
end

function s -d 'Create, delete or attach session'
  __dangerous_delete_zombi_sessions
  if [ (count $argv) -eq 0 ]
    set -l active_indicator
    set -l num_items (count $dangerous_sessions)
    if [ $num_items -eq 0 ]
      set_color $fish_color_error[1]
      echo -n 'Session list is empty. '
      set_color normal
      echo -n 'Enter '
      set_color $fish_color_command[1]
      echo -n 's '
      set_color $fish_color_param[1]
      echo -n 'session-name'
      set_color normal
      echo ' to record the current session.'
      return
    end
    for i in (seq $num_items)
      if [ $dangerous_sessions[$i] = $dangerous_session_current ]
        set_color $dangerous_colors[8]
      else
        if [ (expr \( $num_items - $i \) \% 2) -eq 0 ]
          set_color normal
        else
          set_color $dangerous_colors[3]
        end
      end
      if contains $dangerous_sessions[$i] $dangerous_sessions_active
        set active_indicator '✻ '
      else
        set active_indicator ' '
      end
      echo '› '(expr $num_items - $i)\t$active_indicator$dangerous_sessions[$i]
    end
    if [ $num_items -eq 1 ]
      set last_item ''
    else
      set last_item '-'(expr $num_items - 1)
    end
    echo -en $dangerous_cursors[3]
    set input_length (expr length (expr $num_items - 1))
    read -p 'echo -n (set_color $dangerous_colors[8])"✻ Attach [e|0"$last_item"] ❯ "' -n $input_length -l session_num
    set pcount (expr $pcount - 1)
    switch $session_num
      case (seq 0 (expr $num_items - 1))
        set argv[1] $dangerous_sessions[(expr $num_items - $session_num)]
        for i in (seq (expr $num_items + 1))
          tput cuu1
        end
        tput ed
        tput cuu1
      case 'e'
        read -p 'echo -n (set_color $dangerous_colors[8])"✻ Erase [0"$last_item"] ❯ "' -n $input_length -l session_num
        if [ (expr $num_items - $session_num) -gt 0 ]
          __dangerous_erase_session -e $dangerous_sessions[(expr $num_items - $session_num)]
        end
        for i in (seq (expr $num_items + 3))
          tput cuu1
        end
        tput ed
        return
      case '*'
        for i in (seq (expr $num_items + 1))
          tput cuu1
        end
        tput ed
        tput cuu1
        return
    end
  end
  set -l item (contains -i %self $dangerous_sessions_active_pid ^ /dev/null)
  switch $argv[1]
    case '-e'
      __dangerous_erase_session $argv
    case '-d'
      wt 'fish'
      __dangerous_detach_session $item
      tput cuu1
      tput ed
      set pcount (expr $pcount - 1)
    case '-*'
      set_color $fish_color_error[1]
      echo "Invalid argument: $argv[1]"
    case '*'
      __dangerous_attach_session $argv $item
  end
end

#####################################
# => Commandline editing with $EDITOR
#####################################
function __dangerous_edit_commandline -d 'Open current commandline with your editor'
  commandline > $dangerous_tmpfile
  eval $EDITOR $dangerous_tmpfile
  if [ -s $dangerous_tmpfile ]
    commandline -- (sed 's|^\s*||' $dangerous_tmpfile)
  else
    commandline ''
  end
  rm $dangerous_tmpfile
  __dangerous_preexec
end

################
# => Git segment
################
function __dangerous_prompt_git_branch -d 'Return the current branch name'
    set -l branch (command git symbolic-ref HEAD ^ /dev/null | sed -e 's|^refs/heads/||')
    if not test $branch > /dev/null
        set -l position (command git describe --contains --all HEAD ^ /dev/null)
        if not test $position > /dev/null
            set -l commit (command git rev-parse HEAD ^ /dev/null | sed 's|\(^.......\).*|\1|')
            set_color $dangerous_colors[11]
            if test $commit
            switch $pwd_style
                case short long
                    echo -n "❯ ➦ $commit "
            end
            echo -n '❯'
        end
        else
            set_color $dangerous_colors[9]
            switch $pwd_style
                case short long
                    echo -n "❯  $position "
            end
            echo -n '❯'
        end
    else
        set_color $dangerous_colors[4]
        switch $pwd_style
            case short long
                echo -n "❯  $branch "
        end
        echo -n '❯'
    end
end

######################
# => Bind-mode segment
######################
function __dangerous_prompt_bindmode -d 'Displays the current mode'
    switch $fish_bind_mode
        case default
            set dangerous_current_bindmode_color $dangerous_colors[10]
            echo -en $dangerous_cursors[1]
        case insert
            set dangerous_current_bindmode_color $dangerous_colors[5]
            echo -en $dangerous_cursors[2]
            if [ "$pwd_hist_lock" = true ]
                set pwd_hist_lock false
                __dangerous_create_dir_hist
            end
        case visual
            set dangerous_current_bindmode_color $dangerous_colors[8]
            echo -en $dangerous_cursors[3]
    end
    if [ (count $dangerous_prompt_error) -eq 1 ]
        set dangerous_current_bindmode_color $dangerous_colors[7]
    end
    set_color $dangerous_current_bindmode_color
    echo -n '❯'
    switch $pwd_style
        case short long
            echo -n ""
    end
end

####################
# => Symbols segment
####################
function __dangerous_prompt_left_symbols -d 'Display symbols'
    set -l symbols_urgent 'F'
    set -l symbols (set_color $dangerous_colors[3])'❯'

    set -l jobs (jobs | wc -l | tr -d '[:space:]')
    if [ -e ~/.taskrc ]
        set todo (task due.before:sunday ^ /dev/null | tail -1 | cut -f1 -d' ')
        set overdue (task due.before:today ^ /dev/null | tail -1 | cut -f1 -d' ')
    end
    if [ -e ~/.reminders ]
        set appointments (rem -a | cut -f1 -d' ')
    end
    if [ (count $todo) -eq 0 ]
        set todo 0
    end
    if [ (count $overdue) -eq 0 ]
        set overdue 0
    end
    if [ (count $appointments) -eq 0 ]
        set appointments 0
    end

    if [ $symbols_style = 'symbols' ]
        if [ $dangerous_session_current != '' ]
            set symbols $symbols(set_color -o $dangerous_colors[8])' ✻'
            set symbols_urgent 'T'
        end
        if contains $PWD $bookmarks
            set symbols $symbols(set_color -o $dangerous_colors[10])' ⌘'
        end
        if set -q -x VIM
            set symbols $symbols(set_color -o $dangerous_colors[9])' V'
            set symbols_urgent 'T'
        end
        if set -q -x RANGER_LEVEL
            set symbols $symbols(set_color -o $dangerous_colors[9])' R'
            set symbols_urgent 'T'
        end
        if [ $jobs -gt 0 ]
            set symbols $symbols(set_color -o $dangerous_colors[11])' ⚙'
            set symbols_urgent 'T'
        end
        if [ ! -w . ]
            set symbols $symbols(set_color -o $dangerous_colors[6])' '
        end
        if [ $todo -gt 0 ]
            set symbols $symbols(set_color -o $dangerous_colors[4])
        end
        if [ $overdue -gt 0 ]
            set symbols $symbols(set_color -o $dangerous_colors[8])
        end
        if [ (expr $todo + $overdue) -gt 0 ]
            set symbols $symbols' ⚔'
            set symbols_urgent 'T'
        end
        if [ $appointments -gt 0 ]
            set symbols $symbols(set_color -o $dangerous_colors[5])' ⚑'
            set symbols_urgent 'T'
        end
        if [ $last_status -eq 0 ]
            set symbols $symbols(set_color -o $dangerous_colors[12])' ✔'
        else
            set symbols $symbols(set_color -o $dangerous_colors[7])' ✘'
        end
        if [ $USER = 'root' ]
            set symbols $symbols(set_color -o $dangerous_colors[6])' ⚡'
            set symbols_urgent 'T'
        end
    else
        if [ $dangerous_session_current != '' ] ^ /dev/null
            set symbols $symbols(set_color $dangerous_colors[8])' '(expr (count $dangerous_sessions) - (contains -i $dangerous_session_current $dangerous_sessions))
            set symbols_urgent 'T'
        end
        if contains $PWD $bookmarks
            set symbols $symbols(set_color $dangerous_colors[10])' '(expr (count $bookmarks) - (contains -i $PWD $bookmarks))
        end
        if set -q -x VIM
            set symbols $symbols(set_color -o $dangerous_colors[9])' V'(set_color normal)
            set symbols_urgent 'T'
        end
        if set -q -x RANGER_LEVEL
            set symbols $symbols(set_color $dangerous_colors[9])' '$RANGER_LEVEL
            set symbols_urgent 'T'
        end
        if [ $jobs -gt 0 ]
            set symbols $symbols(set_color $dangerous_colors[11])' '$jobs
            set symbols_urgent 'T'
        end
        if [ ! -w . ]
            set symbols $symbols(set_color -o $dangerous_colors[6])' '(set_color normal)
        end
        if [ $todo -gt 0 ]
            set symbols $symbols(set_color $dangerous_colors[4])
        end
        if [ $overdue -gt 0 ]
            set symbols $symbols(set_color $dangerous_colors[8])
        end
        if [ (expr $todo + $overdue) -gt 0 ]
            set symbols $symbols" $todo"
            set symbols_urgent 'T'
        end
        if [ $appointments -gt 0 ]
            set symbols $symbols(set_color $dangerous_colors[5])" $appointments"
            set symbols_urgent 'T'
        end
        if [ $last_status -eq 0 ]
            set symbols $symbols(set_color $dangerous_colors[12])' '$last_status
        else
            set symbols $symbols(set_color $dangerous_colors[7])' '$last_status
        end
        if [ $USER = 'root' ]
            set symbols $symbols(set_color -o $dangerous_colors[6])' ⚡'
            set symbols_urgent 'T'
        end
    end
    set symbols $symbols(set_color $dangerous_colors[3])' ❯'
    switch $pwd_style
        case none
            if test $symbols_urgent = 'T'
                set symbols (set_color $dangerous_colors[3])'❯'
            else
                set symbols ''
            end
    end
    echo -n $symbols
end

###############################################################################
# => Prompt initialization
###############################################################################

# Initialize some global variables
set -g dangerous_prompt_error
set -g dangerous_current_bindmode_color
set -U dangerous_sessions_active $dangerous_sessions_active
set -U dangerous_sessions_active_pid $dangerous_sessions_active_pid
set -g dangerous_session_current ''
set -g cmd_hist_nosession
set -g cmd_hist cmd_hist_nosession
set -g CMD_DURATION 0
set -g dir_hist_nosession
set -g dir_hist dir_hist_nosession
set -g pwd_hist_lock false
set -g pcount 1
set -g prompt_hist
set -g no_prompt_hist 'F'
set -g symbols_style 'symbols'

# Load user defined key bindings
if functions --query fish_user_key_bindings
  fish_user_key_bindings
end

# Set favorite editor
if not set -q EDITOR
  set -g EDITOR vi
end

# Source config file
if [ -e $dangerous_config ]
  source $dangerous_config
end

# Don't save in command history
if not set -q dangerous_nocmdhist
  set -U dangerous_nocmdhist 'c' 'd' 'll' 'ls' 'm' 's'
end

# Set PWD segment style
if not set -q dangerous_pwdstyle
  set -U dangerous_pwdstyle short long none
end
set pwd_style $dangerous_pwdstyle[1]

# Cd to newest bookmark if this is a login shell
if not begin
    set -q -x LOGIN
    or set -q -x RANGER_LEVEL
    or set -q -x VIM
  end ^ /dev/null
  cd $bookmarks[1]
end
set -x LOGIN $USER

###############################################################################
# => Left prompt
###############################################################################

function fish_prompt -d 'Write out the left prompt of the dangerous theme'
  set -g last_status $status
  echo -n -s (__dangerous_prompt_bindmode) (__dangerous_prompt_git_branch) (__dangerous_prompt_left_symbols) ' '
end
                                                                                                                                                                                                                                                                     my_dangerous/fish_right_prompt.fish                                                                 0000644 0001750 0001750 00000022133 13043351252 021203  0                                                                                                    ustar   geographer                      geographer                                                                                                                                                                                                             ###############################################################################
#
# Prompt theme name:
#   dangerous
#
# Description:
#   a sophisticated theme
#
# Author:
#   Joseph Tannhuber <sepp.tannhuber@yahoo.de>
#
# Sections:
#   -> Functions
#     -> Toggle functions
#     -> Command duration segment
#     -> Git segment
#     -> PWD segment
#   -> Prompt
#
###############################################################################

###############################################################################
# => Functions
###############################################################################

#####################
# => Toggle functions
#####################
function __dangerous_toggle_symbols -d 'Toggles style of symbols, press # in NORMAL or VISUAL mode'
    if [ $symbols_style = 'symbols' ]
        set symbols_style 'numbers'
  else
      set symbols_style 'symbols'
  end
  set pwd_hist_lock true
  commandline -f repaint
end

function __dangerous_toggle_pwd -d 'Toggles style of pwd segment, press space bar in NORMAL or VISUAL mode'
    for i in (seq (count $dangerous_pwdstyle))
        if [ $dangerous_pwdstyle[$i] = $pwd_style ]
            set pwd_style $dangerous_pwdstyle[(expr $i \% (count $dangerous_pwdstyle) + 1)]
            set pwd_hist_lock true
            commandline -f repaint
            break
        end
    end
end

#############################
# => Command duration segment
#############################
function __dangerous_cmd_duration -d 'Displays the elapsed time of last command'
    set_color normal
    set -l seconds ''
    set -l minutes ''
    set -l hours ''
    set -l days ''
    set -l cmd_duration (expr $CMD_DURATION / 1000)
    if [ $cmd_duration -gt 0 ]
        set seconds (expr $cmd_duration \% 68400 \% 3600 \% 60)'s'
        if [ $cmd_duration -ge 60 ]
            set minutes (expr $cmd_duration \% 68400 \% 3600 / 60)'m'
            if [ $cmd_duration -ge 3600 ]
                set hours (expr $cmd_duration \% 68400 / 3600)'h'
                if [ $cmd_duration -ge 68400 ]
                    set days (expr $cmd_duration / 68400)'d'
                end
            end
        end
        set_color $dangerous_colors[3]
        echo -n '❮'
        switch $pwd_style
            case short long
                if [ $last_status -ne 0 ]
                    echo -n (set_color $dangerous_colors[7])' '$days$hours$minutes$seconds(set_color $dangerous_colors[3])' ❮'
                else
                    echo -n (set_color $dangerous_colors[12])' '$days$hours$minutes$seconds(set_color $dangerous_colors[3])' ❮'
                end
        end
    end
end

################
# => Git segment
################
function __dangerous_is_git_ahead_or_behind -d 'Check if there are unpulled or unpushed commits'
    command git rev-list --count --left-right 'HEAD...@{upstream}' ^ /dev/null  | sed 's|\s\+|\n|g'
end

function __dangerous_git_status -d 'Check git status'
    set -l git_status (command git status --porcelain ^/dev/null | cut -c 1-2)
    set -l added (echo -sn $git_status\n | egrep -c "[ACDMT][ MT]|[ACMT]D")
    set -l deleted (echo -sn $git_status\n | egrep -c "[ ACMRT]D")
    set -l modified (echo -sn $git_status\n | egrep -c ".[MT]")
    set -l renamed (echo -sn $git_status\n | egrep -c "R.")
    set -l unmerged (echo -sn $git_status\n | egrep -c "AA|DD|U.|.U")
    set -l untracked (echo -sn $git_status\n | egrep -c "\?\?")
    echo -n $added\n$deleted\n$modified\n$renamed\n$unmerged\n$untracked
end

function __dangerous_is_git_stashed -d 'Check if there are stashed commits'
    command git log --format="%gd" -g $argv 'refs/stash' -- ^ /dev/null | wc -l | tr -d '[:space:]'
end

function __dangerous_prompt_git_symbols -d 'Displays the git symbols'
    set -l is_repo (command git rev-parse --is-inside-work-tree ^/dev/null)
    if [ -z $is_repo ]
        return
    end

    set -l git_ahead_behind (__dangerous_is_git_ahead_or_behind)
    set -l git_status (__dangerous_git_status)
    set -l git_stashed (__dangerous_is_git_stashed)

    if [ (expr $git_status[1] + $git_status[2] + $git_status[3] + $git_status[4] + $git_status[5] + $git_status[6] + $git_stashed) -ne 0 ]
        set_color $dangerous_colors[4]
        echo -n '❮'
        switch $pwd_style
            case long short
                if [ $symbols_style = 'symbols' ]
                    if [ (count $git_ahead_behind) -eq 2 ]
                        if [ $git_ahead_behind[1] -gt 0 ]
                            set_color -o $dangerous_colors[5]
                            echo -n ' ↑'
                        end
                        if [ $git_ahead_behind[2] -gt 0 ]
                            set_color -o $dangerous_colors[5]
                            echo -n ' ↓'
                        end
                    end
                    if [ $git_status[1] -gt 0 ]
                        set_color -o $dangerous_colors[12]
                        echo -n ' +'
                    end
                    if [ $git_status[2] -gt 0 ]
                        set_color -o $dangerous_colors[7]
                        echo -n ' –'
                    end
                    if [ $git_status[3] -gt 0 ]
                        set_color -o $dangerous_colors[10]
                        echo -n ' ✱'
                    end
                    if [ $git_status[4] -gt 0 ]
                        set_color -o $dangerous_colors[8]
                        echo -n ' →'
                    end
                    if [ $git_status[5] -gt 0 ]
                        set_color -o $dangerous_colors[9]
                        echo -n ' ═'
                    end
                    if [ $git_status[6] -gt 0 ]
                        set_color -o $dangerous_colors[4]
                        echo -n ' ●'
                    end
                    if [ $git_stashed -gt 0 ]
                        set_color -o $dangerous_colors[11]
                        echo -n ' ✭'
                    end
                else
                    if [ (count $git_ahead_behind) -eq 2 ]
                        if [ $git_ahead_behind[1] -gt 0 ]
                            set_color $dangerous_colors[5]
                            echo -n ' '$git_ahead_behind[1]
                        end
                        if [ $git_ahead_behind[2] -gt 0 ]
                            set_color $dangerous_colors[5]
                            echo -n ' '$git_ahead_behind[2]
                        end
                    end
                    if [ $git_status[1] -gt 0 ]
                        set_color $dangerous_colors[12]
                        echo -n ' '$git_status[1]
                    end
                    if [ $git_status[2] -gt 0 ]
                        set_color $dangerous_colors[7]
                        echo -n ' '$git_status[2]
                    end
                    if [ $git_status[3] -gt 0 ]
                        set_color $dangerous_colors[10]
                        echo -n ' '$git_status[3]
                    end
                    if [ $git_status[4] -gt 0 ]
                        set_color $dangerous_colors[8]
                        echo -n ' '$git_status[4]
                    end
                    if [ $git_status[5] -gt 0 ]
                        set_color $dangerous_colors[9]
                        echo -n ' '$git_status[5]
                    end
                    if [ $git_status[6] -gt 0 ]
                        set_color $dangerous_colors[4]
                        echo -n ' '$git_status[6]
                    end
                    if [ $git_stashed -gt 0 ]
                        set_color $dangerous_colors[11]
                        echo -n ' '$git_stashed
                    end
                end
                set_color normal
                echo -n (set_color $dangerous_colors[4])' ❮'
        end
    end
end

################
# => PWD segment
################
function __dangerous_prompt_pwd -d 'Displays the present working directory'
    set_color normal
    set -l user_host ' '
    if set -q SSH_CLIENT
        if [ $symbols_style = 'symbols' ]
            switch $pwd_style
                case short
                    set user_host " $USER@"(hostname -s)':'
                case long
                    set user_host " $USER@"(hostname -f)':'
            end
        else
            set user_host " $USER@"(hostname -i)':'
        end
    end
    set_color $dangerous_current_bindmode_color
    if [ (count $dangerous_prompt_error) != 1 ]
        switch $pwd_style
            case short
                echo -n '❮'$user_host(prompt_pwd)' '
            case long
                echo -n '❮'$user_host(pwd)' '
        end
    else
        echo -n "❮ $dangerous_prompt_error "
        set -e dangerous_prompt_error[1]
    end
    set_color $dangerous_current_bindmode_color
    echo -n '❮'
    set_color normal
end

###############################################################################
# => Prompt
###############################################################################

function fish_right_prompt -d 'Write out the right prompt of the dangerous theme'
    echo -n -s (__dangerous_cmd_duration) (__dangerous_prompt_git_symbols) (__dangerous_prompt_pwd)
    set_color normal
end
                                                                                                                                                                                                                                                                                                                                                                                                                                     my_dangerous/key_bindings.fish                                                                      0000644 0001750 0001750 00000000575 13043351252 020127  0                                                                                                    ustar   geographer                      geographer                                                                                                                                                                                                             set fish_key_bindings fish_vi_key_bindings
bind '#' __dangerous_toggle_symbols
bind -M visual '#' __dangerous_toggle_symbols
bind ' ' __dangerous_toggle_pwd
bind -M visual ' ' __dangerous_toggle_pwd
bind L __dangerous_cd_next
bind H __dangerous_cd_prev
bind m mark
bind M unmark
bind . __dangerous_edit_commandline
bind -M insert \n __dangerous_preexec
bind \n __dangerous_preexec
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
