#!/usr/bin/env bash
#
# Based on a review of the tests, this script should take exactly one argument and then output
#   "Hello, <argument>"
# If no argument is provided, print a usage message and exit with status 1
# If multiple arguments are provided, exit with nonzero status

set -o errexit
set -o nounset

main() {
  greetee=${1:-}

  # If there's nobody to greet, print appropriate error
  if [ -z "$greetee" ]; then
    echo "Usage: ./error_handling <greetee>"
    exit 1
  fi

  # If there are extra arguments, print appropriate error
  if [ "$#" -ne 1 ]; then
    echo "Wrong number of arguments, should be exactly one"
    exit 1
  fi

  # Provide the output the test expects
  echo "Hello, $greetee"
}

main "$@"
