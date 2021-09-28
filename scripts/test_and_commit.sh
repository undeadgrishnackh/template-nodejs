#!/usr/bin/env bash

run_unit_tests () { jest  --coverage --verbose; }
run_e2e_tests () { npx cucumber-js --publish-quiet --fail-fast; }
get_date() { date +"%Y%m%d.%H%M"; }
get_run() { git log --oneline | grep -c "TestRun"; }

build_git_commit_message() {
  MESSAGE="test: ["
  if [[ $1 -eq 0 ]]; then
    MESSAGE=$MESSAGE"🟢"
  else
    MESSAGE=$MESSAGE"🔴"
  fi
  MESSAGE=$MESSAGE" BDD] ["
  if [[ $2 -eq 0 ]]; then
    MESSAGE=$MESSAGE"🟢"
  else
    MESSAGE=$MESSAGE"🔴"
  fi
  MESSAGE=$MESSAGE" TDD] ⏰ $(get_date) 🆔 $(get_run)"

  echo "$MESSAGE"
}

git_commit() {
  git add --all
  git commit -m "$1"
}

echo "🔌 E2E tests - BDD loop"
run_e2e_tests
E2E_TEST_RESULT=$?
echo
echo "🔬 UNIT tests - TDD loop"
run_unit_tests
UNIT_TEST_RESULT=$?
echo
MESSAGE=$(build_git_commit_message $E2E_TEST_RESULT $UNIT_TEST_RESULT)
git_commit "$MESSAGE"
