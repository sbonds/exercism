package Raindrops;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(raindrop);

sub raindrop {
  my ($number) = @_;
  my $message = "";
  if ($number % 3 == 0) {
    $message .= "Pling";
  }
  if ($number %5 == 0) {
    $message .= "Plang";
  }
  if ($number %7 == 0) {
    $message .= "Plong";
  }
  if ($message =~ /\S/) {
    return $message;
  } else {
    return $number;
  }
}

1;
