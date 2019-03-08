package Hamming;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(hamming_distance);

sub hamming_distance {
  my ($strand1, $strand2) = @_;
  unless ( length($strand1) == length($strand2) ) { die "The two strands must have equal length"}
  my $hamming_distance = 0;
  for (my $i = 0; $i < length($strand1); $i++) {
    if (substr($strand1,$i,1) ne substr($strand2,$i,1)) { 
      $hamming_distance++
    }
  }
  return $hamming_distance;
}

1;
