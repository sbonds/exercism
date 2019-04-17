#!/usr/bin/env bash
#
# This script should take exactly two argument and then output
# the number of letters that differ when the same positions are
# compared in the two arguments.
# The arguments must be the same length.

set -o errexit
set -o nounset

main() {
  strand1=${1:-}
  strand2=${2:-}

  # If there are extra arguments, print appropriate error (optional)
  if (( $# != 2 )); then
    echo "Usage: ./$0 <strand 1> <strand 2>"
    return 1
  fi

  return 0
}

main "$@"
