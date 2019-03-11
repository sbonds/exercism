package Phrase;
use strict;
use warnings;
use Data::Dumper;
use Exporter 'import';
our @EXPORT_OK = qw(new word_count);

our $string_of_words = "";

# Gets passed a string containing words. Expects case to be normalized and punctuation to be ignored.
sub new {
  my ($class, @args) = @_;
  my ($self) = {};
  bless $self, $class; # Turn this into an object
  return $self;
}

# Return a hash of words as keys and the number of times as values.
sub word_count {
  #print STDERR Data::Dumper->Dump([\@_],[qw(@_)]);
  $string_of_words = shift;
  #print STDERR Data::Dumper->Dump([\$string_of_words],[qw($string_of_words)]);
  my %count_of;
  # Make lowercase
  $string_of_words =~ tr/A-Z/a-z/;
  # Filter out non-word characters, replacing with whitespace
  $string_of_words =~ s/\W/ /g;
  
  foreach my $word (split(/\s+/,$string_of_words)) {
    $count_of{$word}++;
  }
  #print STDERR Data::Dumper->Dump([\%count_of],[qw(%count_of)]);
  return \%count_of;
}

1;