#!/usr/bin/env bash

jest_test () { jest  --coverage --verbose; }
get_date() { date +"%Y%m%d.%H%M"; }
get_run() { git log --oneline | grep -c "TestRun"; }

build_git_commit_message() {
  MESSAGE=""
  if [[ $1 -eq 0 ]]; then
    MESSAGE="test: ✅ GREEN TestRun ⏰ $(get_date) 🆔 $(get_run)"
  else
    MESSAGE="test: ❌ RED TestRun ⏰ $(get_date) 🆔 $(get_run)"
  fi

  echo "$MESSAGE"
}

git_commit() {
  git add --all
  git commit -m "$1"
}

jest_test
MESSAGE=$(build_git_commit_message $?)
git_commit "$MESSAGE"
