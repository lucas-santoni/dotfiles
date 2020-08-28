function blih_create
  blih repository create $argv[1]
  blih_set $argv[1] ramassage-tek r
  blih_get $argv[1]
end

function blih_delete
  blih repository delete $argv[1]
end

function blih_get
  blih repository getacl $argv[1]
end

function blih_set
  blih repository setacl $argv[1] $argv[2] $argv[3]
end

function blih_list
  blih repository list
end
