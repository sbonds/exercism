/*Package grains determines the number of grains of wheat on a given chess square if doubled each time.*/
package grains

import (
	"errors"
	"math"
)

/*Based on the testing it looks like we need to implement a method called Square which returns the
number of grains of wheat on the given square. We also need a Total method which returns the total
number of grains for all 64 squares.*/

/*Square returns the total number of grains of wheat on a given square*/
func Square(squareNumber int) (uint64, error) {
	_, error := squareValid(squareNumber)
	if error != nil {
		return 0, error
	}
	grains := uint64(math.Pow(2, float64(squareNumber-1)))
	return grains, nil
}

/*Total returns the total number of grains of wheat on all 64 squares.*/
func Total() uint64 {
	/* Since there's no input this would be a great candidate for a hardcoded value. The original
	"naive" (hostile?) implementation used a for loop calling Square()*/
	return uint64(18446744073709551615)
}

func squareValid(squareNumber int) (bool, error) {
	if squareNumber > 0 && squareNumber < 65 {
		return true, nil
	}
	return false, errors.New("not a valid square. Must be between 1 and 64, inclusive")
}

/* Naive (perhaps even hostile) benchmark info:

$ go test -v --bench . --benchmem
=== RUN   TestSquare
--- PASS: TestSquare (0.00s)
    grains_test.go:25: PASS: 1
    grains_test.go:25: PASS: 2
    grains_test.go:25: PASS: 3
    grains_test.go:25: PASS: 4
    grains_test.go:25: PASS: 16
    grains_test.go:25: PASS: 32
    grains_test.go:25: PASS: 64
    grains_test.go:25: PASS: square 0 returns an error
    grains_test.go:25: PASS: negative square returns an error
    grains_test.go:25: PASS: square greater than 64 returns an error
=== RUN   TestTotal
--- PASS: TestTotal (0.00s)
goos: windows
goarch: amd64
BenchmarkSquare-4        5000000               323 ns/op              48 B/op         3 allocs/op
BenchmarkTotal-4          500000              2571 ns/op               0 B/op         0 allocs/op
PASS
ok      _/C_/Users/sbonds/Exercism/go/grains    3.675s

Hardcoded total:

$ go test -v --bench . --benchmem
=== RUN   TestSquare
--- PASS: TestSquare (0.00s)
    grains_test.go:25: PASS: 1
    grains_test.go:25: PASS: 2
    grains_test.go:25: PASS: 3
    grains_test.go:25: PASS: 4
    grains_test.go:25: PASS: 16
    grains_test.go:25: PASS: 32
    grains_test.go:25: PASS: 64
    grains_test.go:25: PASS: square 0 returns an error
    grains_test.go:25: PASS: negative square returns an error
    grains_test.go:25: PASS: square greater than 64 returns an error
=== RUN   TestTotal
--- PASS: TestTotal (0.00s)
goos: windows
goarch: amd64
BenchmarkSquare-4        5000000               317 ns/op              48 B/op         3 allocs/op
BenchmarkTotal-4        2000000000               0.66 ns/op            0 B/op         0 allocs/op
PASS
ok      _/C_/Users/sbonds/Exercism/go/grains    3.657s


*/
