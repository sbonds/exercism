package Word;
use strict;
use warnings;
use Data::Dumper;
use Exporter 'import';
our @EXPORT_OK = qw(new score);

sub new {
  #print STDERR Data::Dumper->Dump([\@_],[qw(new::@_)]);
  # Gets passed an array with the following at each index:
  # 0: The literal 'Word' (name of our Object class)
  # 1: The actual word to be used for scoring later
  my ($class, @args) = @_;
  my ($self) = {};
  bless $self, $class; # Turn this into an object
  $self->{'word'} = $args[0]; # Store the word to be scored later
  return $self;
}

sub score {
  print STDERR Data::Dumper->Dump([\@_],[qw(score::@_)]);
  # $score::@_ = [
  #               bless( {
  #                       'word' => ''
  #                    }, 'Word' )
  #              ];
  # The object named Word with a hash reference pointing to the word '' in this case
  # Most complex case:
  #   Failed test 'score for triple-triple 'quirky''
  #   at scrabble.t line 47.
  #          got: '0'
  #     expected: '198'
  # $score::@_ = [
  #              bless( {
  #                      'word' => 'quirky'
  #                    }, 'Word' ),
  #             'double',
  #             1,
  #             'triple',
  #             1
  #           ];
  # "quirky" = 22 points normal, 12 points without 'q'
  # 
  my ($arg1) = @_;
  return 0;
}

1;