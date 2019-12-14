## BLIH

function crepo
  blih repository create $argv[1]
  blih repository setacl $argv[1] ramassage-tek r
  echo (blih repository getacl $argv[1])
end

function drepo
  blih repository delete $argv[1]
end

function grepo
  blih repository getacl $argv[1]
end

function srepo
  blih repository setacl $argv[1] $argv[2] $argv[3]
end

function lrepo
  blih repository list
end

function sync_cdn
  rsync -avh --progress --delete /Users/geographer/Documents/cdn/ vps:/home/geographer/cdn/
end

function enable_razer
  sudo chmod +x "/Library/Application Support/Razer/RzUpdater.app/Contents/MacOS/RzUpdater"
  sudo chmod +x "/Library/Application Support/Razer/RzDeviceEngine.app/Contents/MacOS/RzDeviceEngine"
  open -a /Library/Application\ Support/Razer/RzUpdater.app/Contents/MacOS/RzUpdater
end

function disable_razer
  sudo chmod -x "/Library/Application Support/Razer/RzUpdater.app/Contents/MacOS/RzUpdater"
  sudo chmod -x "/Library/Application Support/Razer/RzDeviceEngine.app/Contents/MacOS/RzDeviceEngine"
  pkill RzDeviceEngine
  pkill RzUpdater
end

## PANDOC

function cnotes
  set name "notes"
  count $argv > /dev/null; and set name $argv[1]

  pandoc --from=markdown+raw_html+markdown_in_html_blocks \
    -V fontsize=10pt \
    --variable urlcolor=blue \
    $name.md \
    -o $name.pdf
end
