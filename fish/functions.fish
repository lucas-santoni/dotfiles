function play
  mpv --really-quiet "$argv" &
  disown
end
