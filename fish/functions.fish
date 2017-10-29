function play
  mpv --really-quiet "$argv" &
  disown
end

function macOS
  vmware-hgfsclient
  vmhgfs-fuse -o allow_other -o auto_unmount .host:/geographer /home/geographer/macOS
end
