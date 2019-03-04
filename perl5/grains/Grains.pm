package Grains;
use strict;
use warnings;
use bignum; # resolve problems with large integers being imprecise
use Exporter 'import';
our @EXPORT_OK = qw(grains_on_square total_grains);

# 2 times itself 'n' times is 2^n. We start with one grain on the first
# square and 2^0 = 1, so the number of grains on the nth square is 2^(n-1).
# first square: 1 = 2^(1-1) = 2^0 = 1
# second square: 2 = 2^(2-1) = 2^1 = 2
# third square: 4 = 2^(3-1) = 2^2 = 4
sub grains_on_square {
  my ($square) = @_;
  # Only 64 squares on a board
  if ($square < 1 || $square > 64) { die "$square not in range 1-64" ; }
  return 2**($square - 1);
}

sub total_grains {
  # The request appears to be for this to be the total on a 64 square chessboard.
  # First attempt-- a relatively readable summation using the existing logic above
  my $total = 0;
  for my $square (1..64) {
    $total += grains_on_square($square);
  }
  return $total;
}

1;
