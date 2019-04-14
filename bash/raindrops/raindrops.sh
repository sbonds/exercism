#!/usr/bin/env bash
#
# This script should take exactly one argument and then output
# based on whether the number is divisible by 3, 5, or 7.
# If divisible by 3: output "Pling"
# If divisible by 5: output "Plang"
# If divisible by 7: output "Plong"
# If divisible by none of these, output the number provided.
# If divisible by multiple, output in the order above without newlines

set -o errexit
set -o nounset

main() {
  number=${1:-}
  made_sound=0

  # If there are extra arguments, print appropriate error (optional)
  if [ "$#" -ne 1 ]; then
    echo "Usage: ./$0 <number>"
    exit 1
  fi

  # Make our sounds and note that at least one sound was made
  # so we can determine if we instead need to just print the number
  if [ $(($number % 3)) -eq 0 ]; then
    echo -n "Pling"
    made_sound=1
  fi

  if [ $(($number % 5)) -eq 0 ]; then
    echo -n "Plang"
    made_sound=1
  fi

  if [ $(($number % 7)) -eq 0 ]; then
    echo -n "Plong"
    made_sound=1
  fi

  if [ "$made_sound" -eq 0 ]; then
    echo -n $number
  fi

  # Print one trailing newline since none of the above had one
  echo

  exit 0
}

main "$@"
