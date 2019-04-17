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
  sounds_made=""

  # If there are extra arguments, print appropriate error (optional)
  if (( $# != 1 )); then
    echo "Usage: ./$0 <number>"
    return 1
  fi

  # Make our sounds and note that at least one sound was made
  # so we can determine if we instead need to just print the number
  if (( $number % 3 == 0 )); then
    sounds_made="Pling"
  fi

  if (( $number % 5 == 0 )); then
    sounds_made="${sounds_made}Plang"
  fi

  if (( $number % 7 == 0 )); then
    sounds_made="${sounds_made}Plong"
  fi

  if [[ -z "$sounds_made" ]]; then
    echo $number
  else
    echo $sounds_made
  fi

  return 0
}

main "$@"
