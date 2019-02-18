# Declare package 'Bob'
package Bob;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(hey);

# Make a hash of responses to each type of statement, as characterized
# by the punctuation.
my %response_to = (
  '?' => "Sure.",
  '!' => "Whoa, chill out!",
);

sub hey {
  my ($msg) = @_;
  # Whitespace at the end doesn't count so trim it all
  $msg =~ s/\s+$//;
  # Use negative offsets to count from the end rather than the beginning of a string
  my ($last_char) = substr($msg, -1);
  # https://perldoc.perl.org/5.8.9/Switch.html
  # Switch does not appear to be part of Strawberry Perl v5.28.1 even though it's listed
  # as a core module.
  # "Yelling" equals all alphabetic letters are uppercase
  # Even a single lowercase alphabetic will invalidate a 'yell' so let's look
  # for those.
  unless ($msg =~ /[[:lower:]]/) {
    # but the message still must have at least one uppercase character (e.g. not
    # just punctuation or empty)
    if ($msg =~ /[[:upper:]]/) {
      if ($last_char eq "?") {
        return "Calm down, I know what I'm doing!";
      }
      return "Whoa, chill out!";
    }
  }
  if ($last_char eq "?") {
    return "Sure.";
  }
  unless ($msg =~ /\w/) {
    # No "word" characters = not saying anything
    return "Fine. Be that way!";
  }
  return "Whatever.";
}

1;
