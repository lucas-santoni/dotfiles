#!/bin/bash

getGitStatus() {
  gitStatus=""

  local isInGit=$(git rev-parse --is-inside-work-tree 2>/dev/null)
  [[ $isInGit ]] || return

  local status=`git status 2>&1 | tee`
  local dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  local untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  local ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  local behind=`echo -n "${status}" 2> /dev/null | grep "Your branch is behind" &> /dev/null; echo "$?"`
  local newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  local deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  local renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`


  if [ "${renamed}" == "0" ]; then
    gitStatus="${purplef}~${reset}${gitStatus}"
  fi
  if [ "${newfile}" == "0" ]; then
    gitStatus="${greenf}+${reset}${gitStatus}"
  fi
  if [ "${untracked}" == "0" ]; then
    gitStatus="${bluef}*${reset}${gitStatus}"
  fi
  if [ "${deleted}" == "0" ]; then
    gitStatus="${redf}-${reset}${gitStatus}"
  fi
  if [ "${dirty}" == "0" ]; then
    gitStatus="${yellowf}!${reset}${gitStatus}"
  fi
  if [ "${ahead}" == "0" ]; then
    gitStatus="${redf}%${reset}${gitStatus}"
  fi
  if [ "${behind}" == "0" ]; then
    gitStatus="${redf}@${reset}${gitStatus}"
  fi
}
