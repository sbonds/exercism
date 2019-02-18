package TwoFer;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(two_fer);

sub two_fer {
  my ($name) = @_;
  if (! defined($name)) {
    $name = "you";
  }
  return "One for $name, one for me.";
}

1;
