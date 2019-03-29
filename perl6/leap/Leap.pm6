unit module Leap;
# A leap year is defined by the following logic:
#
#	on every year that is evenly divisible by 4
#		except every year that is evenly divisible by 100
#			unless the year is also evenly divisible by 400
#
# This means a year is a leap year if:
#
# Year evenly divides by 4 AND (year is not evenly divisible by 100
# OR year is divisible by 400)
sub is-leap-year ($year) is export {
  return $year %4 == 0 && ( $year %100 != 0 || $year % 400 == 0 )
}
