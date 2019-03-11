/*Package diffsquares finds the difference between the square of the sum of the first
'n' natural numbers and the sum of the squares of the same numbers.*/
package diffsquares

/*Based on the testing it looks like we need to implement all of these methods:
SquareOfSum(n)
SumOfSquares(n)
Difference(n)
*/

/*SquareOfSum returns the integer value of the sum of the first 'n' numbers, squared. */
func SquareOfSum(n int) int {
	/* In the spirit of red... green... refactor test-driven development, start with a naive solution
	   and then refactor into something that performs better. (See comments about performance at the end.) */
	if n < 1 {
		/* Would be nice to raise an error here but the testing doesn't seem to support it. */
		return 0
	}
	// https://www.geeksforgeeks.org/sum-of-squares-of-first-n-natural-numbers/
	sum := n * (n + 1) / 2
	return sum * sum
}

/*SumOfSquares returns the integer value of the sum of the squares of the first 'n' numbers. */
func SumOfSquares(n int) int {
	if n < 1 {
		return 0
	}
	return n * (n + 1) * (2*n + 1) / 6
}

/*Difference returns (SquareOfSum - SumOfSquares) */
func Difference(n int) int {
	if n < 1 {
		return 0
	}
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

Now that I have my baseline... time for some research.

https://en.wikipedia.org/wiki/Sum-of-squares_optimization

	Here "SOS" represents the class of sum-of-squares (SOS) polynomials. The vector
		{\displaystyle c\in \mathbb {R} ^{n}} c\in \mathbb{R} ^{n} and polynomials
		{\displaystyle \{a_{k,j}\}} \{a_{{k,j}}\} are given as part of the data for
		the optimization problem. The quantities
		{\displaystyle u\in \mathbb {R} ^{n}} u\in \mathbb{R} ^{n} are the decision variables.
		SOS programs can be converted to semidefinite programs (SDPs) using the duality
		of the SOS polynomial program and a relaxation for constrained polynomial optimization
		using positive-semidefinite matrices...

Is that even English? What... the... *ahem*...

https://www.geeksforgeeks.org/sum-of-squares-of-first-n-natural-numbers/

English! With code examples! Yay!

		1 + 2 + ... + n = n(n+1) / 2
		1^2 + 2^2 + ... + n^2 = n(n+1)(2n+1) / 6

$ go test -v --bench . --benchmem
=== RUN   TestSquareOfSum
--- PASS: TestSquareOfSum (0.00s)
=== RUN   TestSumOfSquares
--- PASS: TestSumOfSquares (0.00s)
=== RUN   TestDifference
--- PASS: TestDifference (0.00s)
goos: windows
goarch: amd64
BenchmarkSquareOfSum-4          2000000000               0.36 ns/op            0 B/op          0 allocs/op
BenchmarkSumOfSquares-4         2000000000               0.71 ns/op            0 B/op          0 allocs/op
BenchmarkDifference-4           2000000000               0.36 ns/op            0 B/op          0 allocs/op
PASS
ok      difference-of-squares     3.409s

It's interesting that the difference benchmarks faster than the SumOfSquares alone, when it makes a call to SumOfSquares.
I wonder if Go's optimizer found a convenient algebraic subtraction method. If so, that's pretty impressive.

In any case, running at 1/400 the speed of the original is a pretty significant improvement over the naive solution.

*/
