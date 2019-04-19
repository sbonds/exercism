#!/usr/bin/env bash
# Convert a series of words to an initialism.
# Which method to use? So far I can think of:
# + shell out to sed/awk (avoid that, this is a bash exercise!)
# + split using read and an array
# + split using regexp and BASH_REMATCH
set -o errexit
set -o nounset

main() {
  # If there are too many arguments, print appropriate error (optional)
  if (( $# != 1 )); then
    echo "Usage: $0 '<string>'"
    return 1
  fi
  initialism=""

  # Using read + array seems the best balance between simple,
  # backwards compatible, and efficient.
  read -a words <<< "$1" 

  for word in "${words[@]}"; do
    initialism="${initialism}${word:0:1}"
  done

  echo "$initialism"

  return 0
}

main "$@"
