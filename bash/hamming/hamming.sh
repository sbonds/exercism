#!/usr/bin/env bash
#
# This script should take exactly two argument and then output
# the number of letters that differ when the same positions are
# compared in the two arguments.
# The arguments must be the same length.

set -o errexit
set -o nounset

main() {
  strandL=${1:-}
  strandR=${2:-}
  hamming_distance=0

  # If there are extra arguments, print appropriate error (optional)
  if (( $# != 2 )); then
    echo "Usage: $0 <string1> <string2>"
    return 1
  fi

  if (( ${#strandL} != ${#strandR} )); then
    echo "left and right strands must be of equal length"
    return 1
  fi

  # Check each character using variable expansion ${var:index:length}
  for (( i=0; i<${#strandL}; i++ )); do
    if [[ "${strandL:$i:1}" != "${strandR:$i:1}" ]]; then
      # I'm not sure why this didn't work-- the final "echo" never happened
      # when this was here:
      # (( hamming_distance++ ))
      hamming_distance=$(( hamming_distance+1 ))
    fi
  done

  echo "$hamming_distance"

  return 0
}

main "$@"
