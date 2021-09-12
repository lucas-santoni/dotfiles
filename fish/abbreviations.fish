## VIM
abbr e "nvim"
abbr ee "emacsclient -n"

## VSCODE
abbr c code

## FINDER
abbr f open .

## FZF
## Usually bound to some keys
## But sometimes they are not available
abbr fr fzf-history-widget
abbr ft fzf-file-widget
abbr fh fzf-cd-widget

## PYTHON
## I mostly use poetry now
# abbr pip pipenv
# abbr pip3 pipenv

## LS/TREE/EXA
abbr ls "exa"
abbr l "exa -l"
abbr ll "exa -l"
abbr la "exa -la"
abbr tree "exa --tree"
abbr t "exa --tree"

## GIT
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

## RM
abbr rrm "rm -Rf"

## CP
abbr cp "cp -v"
abbr ccp "cp -R"

## MV
abbr mv "mv -v"

## TMUX
abbr at "tmux attach -t"
abbr tmls "tmux list-sessions"

## MAKE
abbr m "make"
abbr mr "make re"

## CHMOD
abbr cx "chmod +x"

## GDB
abbr gdb "gdb -q"

## VALGRIND
abbr va "valgrind"
abbr valeak "valgrind --leak-check=full --show-leak-kinds=all"

## DOCKER
abbr d "docker"
abbr drm "docker rm"
abbr dt "docker start"
abbr da "docker attach"
abbr ds "docker stop"
abbr di "docker images"
abbr dps "docker ps"
abbr dpsa "docker ps -a"

## DOCKER-COMPOSE
abbr dc "docker-compose"
abbr dcu "docker-compose up"
abbr dcd "docker-compose down"
abbr dcps "docker-compose ps"
abbr dcpsa "docker-compose ps -a"

## BAT
abbr cat "bat"

## XCLIP
## macOS already has pbcopy and pbpaste which are short enough
abbr copy "xclip -selection clipboard"
abbr paste "xclip -selection clipboard -out"

## YARN WORKSPACES
abbr yw "yarn workspace"

## CRYPTIO
abbr fro "yarn workspace front start"
abbr bgw "yarn workspace background-worker dev"
abbr bac "yarn workspace back start:dev"
