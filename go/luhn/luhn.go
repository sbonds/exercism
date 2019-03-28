/*Package luhn determines if a given sequence of numbers matches the Luhn checksum .*/
package luhn

import (
	"strings"
	"unicode"
)

/*Based on the testing it looks like we need to implement a method called Valid(string)
which returns a boolean based on whether the string contains a valid series of numbers
matching the Luhn checksum.
*/

/*Note to self for debugging next time-- build a Go file in a new directory with all the library
code below copy/pasted in under simple test code like:
	package main
	func main() {
		fmt.Println("Valid(055 444 285) = ", Valid("055 444 285"))
		fmt.Println("Valid(055 444 286) = ", Valid("055 444 286"))
	}

Perhaps there's an easier way to set up debugging? The main issue seems to be the lack of any main()
method in the library-based Go exercises.
*/

/*Valid returns true if the digits in the input make a valid Luhn checksum, false otherwise. */
func Valid(sequenceOfNumbers string) bool {
	spaceFreeSequenceOfNumbers := RemoveSpaces(sequenceOfNumbers)
	if len(spaceFreeSequenceOfNumbers) <= 1 {
		return false
	}

	/* Strings containing things other than digits (or spaces, which are already removed) are invalid */
	/* Iterating as runes from https://blog.golang.org/strings */
	for _, runeValue := range spaceFreeSequenceOfNumbers {
		if !unicode.IsDigit(runeValue) {
			return false
		}
	}

	numbers := make([]int, len(spaceFreeSequenceOfNumbers))
	for i, runeValue := range spaceFreeSequenceOfNumbers {
		numbers[i] = int(runeValue - '0')
	}

	/* Now that we've tossed out the junk we need to actually do some work. :-) */
	return ChecksumTotal(numbers)%10 == 0
}

/*RemoveSpaces is used internally to remove any spaces from the string passed in.
It could also have been 'unexported' based on golint, but that seemed to be surprisingly
unusual and/or difficult to do. */
func RemoveSpaces(stringWithSpaces string) string {
	// Split on spaces and join on nothing. It's simple to read, but may not benchmark well.
	return strings.Join(strings.Fields(stringWithSpaces), "")
}

/*ChecksumTotal is used internally to calculate the Luhn checksum of the given series of
digits. */
func ChecksumTotal(numbers []int) int {
	total := 0
	for i, offsetFromEnd := len(numbers)-1, 0; i >= 0; i, offsetFromEnd = i-1, offsetFromEnd+1 {
		if offsetFromEnd%2 == 1 {
			total = total + DoubleWithOverflow(numbers[i])
		} else {
			total = total + numbers[i]
		}
	}
	return total
}

/*DoubleWithOverflow doubles the number given and if it's above 9, subtracts 9 from it to keep
it to a single digit.*/
func DoubleWithOverflow(number int) int {
	if number*2 > 9 {
		return (number * 2) - 9
	} else {
		return number * 2
	}
}

/* Naive implementation benchmark:

$ go test -v --bench . --benchmem
=== RUN   TestValid
--- PASS: TestValid (0.00s)
goos: windows
goarch: amd64
BenchmarkValid-4         2000000               518 ns/op             224 B/op         4 allocs/op
PASS
ok      _/C_/Users/sbonds/Exercism/go/luhn      2.156s

*/
