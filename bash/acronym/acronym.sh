#!/usr/bin/env bash
# Convert a long name to an acronym.
set -o errexit
set -o nounset

main() {
  # If there are too many arguments, print appropriate error (optional)
  if (( $# != 1 )); then
    echo "Usage: $0 '<string>'"
    return 1
  fi

  return 0
}

main "$@"
