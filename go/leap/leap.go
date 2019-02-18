/*Package leap determines if a given Gregorian year number is a leap year */
package leap

/*IsLeapYear returns a boolean describing if the passed integer is a
leap year by the following logic:

	on every year that is evenly divisible by 4
		except every year that is evenly divisible by 100
			unless the year is also evenly divisible by 400

This means a year is a leap year if:

Year evenly divides by 4 AND (year is not evenly divisible by 100
OR year is divisible by 400)
*/
func IsLeapYear(year int) bool {
	return ((year%4 == 0) && ((year%100 != 0) || (year%400 == 0)))
}
