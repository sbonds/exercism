/*Package triangle implements a function KindFromSides that returns an appropriate
Kind type describing the triangle whos side lengths were passed in.
*/
package triangle

import (
	"math"
)

/*Kind the type of triangle the three sides suggest */
type Kind int

/*Values behind the triangle types */
const (
	NaT = 1 // not a triangle
	Equ = 2 // equilateral
	Iso = 3 // isosceles
	Sca = 4 // scalene
)

/*KindFromSides takes three float64 arguments for the triangle side lengths.
It will classify the triangle into one of four Kinds based on the side lengths:
	NaT: Not a triangle (any side length < 0 or sum of two sides larger than the third)
	Equ: Equilateral -> Lengths of all sides equal
	Iso: Isosceles -> Lengths of two sides equal
	Sca: Scalene -> Three sides of different lengths
*/
func KindFromSides(a, b, c float64) Kind {
	if math.IsInf(a, 0) || math.IsInf(b, 0) || math.IsInf(c, 0) || math.IsNaN(a) || math.IsNaN(b) || math.IsNaN(c) {
		// Sides of nonnumeric length would be odd
		return NaT
	}
	if !(a > 0 && b > 0 && c > 0) {
		// Sides of zero or negative length would be odd
		return NaT
	}
	if (a+b) < c || (a+c) < b || (b+c) < a {
		// The sum of two sides must be greater than or equal to
		// the length of the third side or this isn't a triangle.
		return NaT
	}
	if a == b && b == c {
		// a == b == c so all sides equal length
		return Equ
	}
	if a == b || b == c || a == c {
		// any two sides are equal length
		return Iso
	}
	return Sca
}
