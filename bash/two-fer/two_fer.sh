#!/usr/bin/env bash
set -o errexit
set -o nounset

main() {
  # If $1 is missing or empty, use 'you' instead
  # https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion
  name=${1:-you}

  echo "One for $name, one for me."
}

main "$@"
