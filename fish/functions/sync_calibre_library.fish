function sync_calibre_library
  /opt/homebrew/bin/rsync -av --delete --info=progress2 "/Volumes/appdata/calibre/Calibre Library/" "/Users/geo/Documents/Calibre Library/"
end
