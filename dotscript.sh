usage()
{
  echo "Usage : $0 [-a file_to_add] [-l file_to_link]"
}

linkExistingFile()
{
  ln -s $fileToLink ~/$fileToLink
}

addNewFile()
{
  cp ~/$fileToAdd .
  mv ~/$fileToAdd ~/$fileToAdd.bak
  fileToLink=$fileToAdd
  linkExistingFile
}

while [ "$1" != "" ]; do
  case $1 in
    -a | --add )    shift
                    fileToAdd=$1
                    addNewFile
                    ;;
    -l | --link )   shift
                    fileToLink=$1
                    linkExistingFile
                    ;;
    -h | --help )   usage
                    exit
                    ;;
    * )             usage
                    exit
  esac
  shift
done
