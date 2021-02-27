#!/usr/bin/env zsh

local a="main" b="pingo/main"
local base=$( git merge-base $a $b )
local aref=$( git rev-parse  $a )
local bref=$( git rev-parse  $b )

if [[ $(git diff --stat) != '' ]]; then
  echo 'dotfiles: dirty'
  exit
fi

if [[ $aref == "$bref" ]]; then
  echo ''
elif [[ $aref == "$base" ]]; then
  echo 'dotfiles: needs a pull'
elif [[ $bref == "$base" ]]; then
  echo 'dotfiles: needs a push'
else
  echo 'dotfiles diverged'
fi
