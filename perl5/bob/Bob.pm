# Declare package 'Bob'
package Bob;
use strict;
use warnings;
use Switch;
use Exporter 'import';
our @EXPORT_OK = qw(hey);

sub hey {
  my ($msg) = @_;
  # Use negative offsets to count from the end rather than the beginning of a string
  my ($last_char) = substr($msg, -1);
  # https://perldoc.perl.org/5.8.9/Switch.html
  # Switch does not appear to be part of Strawberry Perl v5.28.1 even though it's listed
  # as a core module.
  switch ($last_char) {
    case '?' { return "Sure."}
    case '!' { return "Whoam chill out!"}

  }
}

1;
