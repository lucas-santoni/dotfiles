#!/bin/bash

# Get repo ACL
grepo() {
  blih repository getacl $1
}

# Delete repo
drepo() {
  blih repository delete $1
}

# Change repo ACL
srepo() {
  blih repository setacl $1 $2 $3
}

# Create new repo
crepo() {
  blih repository create $1
  srepo $1 ramassage-tek r
  grepo $1
}
