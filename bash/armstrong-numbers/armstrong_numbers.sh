#!/usr/bin/env bash
# Return "true" if the sum of each digit in a number raised to the
# power of the total number of digits equals the original number.
# Return "false" otherwise.
# Examples:
# 9 is true: 9^1 = 9
# 153 is true: 1^3 + 5^3 + 3^3 = 153
# 154 is false 1^3 + 5^3 + 4^3 = 190 != 154

set -o errexit
set -o nounset

main() {
  number=${1:-}

  # If there are extra arguments, print appropriate error (optional)
  if (( $# != 1 )); then
    echo "Usage: $0 <number>"
    return 1
  fi

    total=0
    for (( i=0; i<${#number}; i++ )); do
      digit=${number:$i:1}
      total=$((total + digit**${#number}))
    done

  if (( total == number)); then
    echo "true"
  else
    echo "false"
  fi

  return 0
}

main "$@"
