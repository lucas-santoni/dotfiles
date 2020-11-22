function __setup_dir -d "Create and enter a directory"
  mkdir -p $argv[1]
  cd $argv[1]
end

function __setup_node -d "Install node and npm"
  nvm install node --latest-npm
end

function __setup_git -d "Setup Git and make a first commit"
  echo -e $argv[1] > .gitignore

  git init
  git add .
  git commit -m "Setup finished"
end

function bjs -d "Bootstrap a new JavaScript project"
  __setup_dir $argv[1]
  __setup_node

  npm init -y
  npm install standard

  touch main.js

  __setup_git "node_modules"
end

function bts -d "Bootstram a new TypeScript project"
  __setup_dir $argv[1]
  __setup_node

  npm init -y
  npm install --save-dev ts-standard typescript @types/node
  npx tsc --init

  touch main.ts

  __setup_git "node_modules\nbuild"
end
