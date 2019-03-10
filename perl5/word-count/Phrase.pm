package Phrase;
use strict;
use warnings;
use Data::Dumper;
use Exporter 'import';
our @EXPORT_OK = qw(new score);

sub new {
  my ($class, @args) = @_;
  my ($self) = {};
  bless $self, $class; # Turn this into an object
  return $self;
}

sub word_count {
  return undef;
}