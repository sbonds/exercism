# Declare package 'Leap'
package Leap;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(is_leap_year);

# is_leap_year returns a boolean describing if the passed integer is a
# leap year by the following logic:
#
#	on every year that is evenly divisible by 4
#		except every year that is evenly divisible by 100
#			unless the year is also evenly divisible by 400
#
#This means a year is a leap year if:
#
#Year evenly divides by 4 AND (year is not evenly divisible by 100
#OR year is divisible by 400)
sub is_leap_year {
  my ($year) = @_;
  return (($year % 4 == 0) && (($year % 100 != 0) || ($year % 400 == 0)));
}

1;
