/*Package diffsquares finds the difference between the square of the sum of the first
'n' natural numbers and the sum of the squares of the same numbers.

Based on the testing it looks like we need to implement all of these methods:
 SquareOfSum(n)
 SumOfSquares(n)
 Difference(n)

*/
package diffsquares

/*SquareOfSum returns the integer value of the sum of the first 'n' numbers, squared. */
func SquareOfSum(n int) int {
	/* In the spirit of red... green... refactor test-driven development, start with a naive solution */
	if n < 1 {
		/* Would be nice to raise an error here but the testing doesn't seem to support it. */
		return 0
	}
	sum := 0
	for i := 1; i <= n; i++ {
		// fmt.Printf("%d + %d = ", sum, i)
		sum += i
		// fmt.Printf("%d\n", sum)
	}
	return sum * sum
}

/*SumOfSquares returns the integer value of the sum of the squares of the first 'n' numbers. */
func SumOfSquares(n int) int {
	sum := 0
	for i := 1; i <= n; i++ {
		// fmt.Printf("%d + %d^2 = ", sum, i)
		sum += i * i
		// fmt.Printf("%d\n", sum)
	}
	return sum
}

/*Difference returns (SquareOfSum - SumOfSquares) */
func Difference(n int) int {
	return SquareOfSum(n) - SumOfSquares(n)
}

/* Naive implementation benchmark:

$ go test -v --bench . --benchmem
=== RUN   TestSquareOfSum
--- PASS: TestSquareOfSum (0.00s)
=== RUN   TestSumOfSquares
--- PASS: TestSumOfSquares (0.00s)
=== RUN   TestDifference
--- PASS: TestDifference (0.00s)
goos: windows
goarch: amd64
BenchmarkSquareOfSum-4          30000000                54.2 ns/op             0 B/op          0 allocs/op
BenchmarkSumOfSquares-4         20000000                81.0 ns/op             0 B/op          0 allocs/op
BenchmarkDifference-4           10000000               143 ns/op               0 B/op          0 allocs/op
PASS
ok      difference-of-squares     5.346s

*/
