## VIM
alias e "nvim"

## LS/TREE/EXA
alias ls "exa"
alias l "exa -l"
alias la "exa -la"
alias tree "exa --tree"
alias t "exa --tree"

## GIT
alias g "git"
alias gd "git diff"
alias gl "git pull"
alias gst "git status"
alias ga "git add"
alias gaa "git add --all"
alias gc "git commit"
alias gp "git push"
alias gb "git branch"
alias gm "git branch --merged"

## RM
alias rrm "rm -Rf"

## CP
alias cp "cp -v"
alias ccp "cp -R"

## MV
alias mv "mv -v"

## TMUX
alias tmux "tmux -2"
alias tm "tmux -2"
alias at "tmux attach -t"
alias tmls "tmux list-sessions"

## MAKE
alias m "make"
alias mr "make re"

## PYTHON
alias python "python3"
alias p "python3"
alias ip "ipython3"

## CHMOD
alias cx "chmod +x"

## GDB
alias gdb "gdb -q"

## VALGRIND
alias va "valgrind"
alias valeak "valgrind --leak-check=full --show-leak-kinds=all"

## DOCKER
alias d "docker"
alias drm "docker rm"
alias dt "docker start"
alias da "docker attach"
alias ds "docker stop"
alias di "docker images"
alias dps "docker ps"
alias dpsa "docker ps -a"

## DOCKER-COMPOSE
alias dc "docker-compose"
alias dcu "docker-compose up"
alias dcd "docker-compose down"
alias dcps "docker-compose ps"
alias dcpsa "docker-compose ps -a"

## EPITECH
alias b "blih"
alias norme "checkpatch.pl
  --ignore BLOCK_COMMENT_STYLE \
  --ignore MULTILINE_DEREFERENCE \
  --ignore CONST_STRUCT \
  --ignore SPLIT_STRING \
  --ignore TRAILING_STATEMENTS \
  --no-tree --file (find . -name '*.c')"
alias fnorme "checkpatch.pl --no-tree --file (find . -name '*.c' -o -name '*.h')"

## BAT
alias cat "bat --style=numbers,changes"
