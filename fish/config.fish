if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH \
      /bin \
      /usr/bin \
      /usr/local/bin \
      /sbin \
      /usr/sbin \
      /Users/geo/.cargo/bin \
      $HOME/.local/share/nvm/$nvm_current_version/bin

## Neovim
abbr e "nvim"

## VSCode
abbr c code

## Finder
abbr f open .

## FZF
## Usually bound to some keys
## But sometimes they are not available
abbr fr fzf-history-widget
abbr ft fzf-file-widget
abbr fh fzf-cd-widget

## ls / tree / exa
abbr ls "exa"
abbr l "exa -l"
abbr ll "exa -l"
abbr la "exa -la"
abbr tree "exa --tree"
abbr t "exa --tree"

## Git
abbr g "git"
abbr gd "git diff"
abbr gl "git pull"
abbr gst "git status"
abbr ga "git add"
abbr gaa "git add --all"
abbr gc "git commit"
abbr gp "git push"
abbr gb "git branch"
abbr gm "git branch --merged"

## rm
abbr rrm "rm -Rf"

## cp
abbr cp "cp -v"
abbr ccp "cp -R"

## mv
abbr mv "mv -v"

## tmux
abbr at "tmux attach -t"
abbr tmls "tmux list-sessions"

## make
abbr m "make"
abbr mr "make re"

## chmod
abbr cx "chmod +x"

## gdb
abbr gdb "gdb -q"

## valgrind
abbr va "valgrind"
abbr valeak "valgrind --leak-check=full --show-leak-kinds=all"

## docker
abbr d "docker"
abbr drm "docker rm"
abbr dt "docker start"
abbr da "docker attach"
abbr ds "docker stop"
abbr di "docker images"
abbr dps "docker ps"
abbr dpsa "docker ps -a"

## docker-compose
abbr dc "docker-compose"
abbr dcu "docker-compose up"
abbr dcd "docker-compose down"
abbr dcps "docker-compose ps"
abbr dcpsa "docker-compose ps -a"

## cat / bat
abbr cat "bat"

## xclib
## macOS already has pbcopy and pbpaste which are short enough
abbr copy "xclip -selection clipboard"
abbr paste "xclip -selection clipboard -out"

## Yarn Workspaces
abbr yw "yarn workspace"

## Cryptio
abbr fro "yarn workspace front start"
abbr bgw "yarn workspace background-worker dev"
abbr bac "yarn workspace back start:dev"