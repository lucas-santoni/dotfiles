#!/bin/bash

osascript -e \
'on run argv
    tell application "System Events"
        set old_frontmost to item 1 of (get name of processes whose frontmost is true)
    end tell
    tell application "iTerm2"
        set myterm to (create window with default profile)
        tell myterm
          select
        end
        tell current session of myterm
            write text "cd " & quoted form of (item 2 of argv)
            write text (item 1 of argv) & " ; exit"
        end tell
        repeat while (exists myterm)
            delay 0.1
        end repeat
    end tell
    tell application old_frontmost
        activate
    end tell
end run' "$1" "$PWD"
