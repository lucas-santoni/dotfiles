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
