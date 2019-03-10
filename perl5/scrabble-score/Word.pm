package Word;
use strict;
use warnings;
use Data::Dumper;
use Exporter 'import';
our @EXPORT_OK = qw(new score);

our $word = "";

sub new {
  #print STDERR Data::Dumper->Dump([\@_],[qw(new::@_)]);
  # Gets passed an array with the following at each index:
  # 0: The literal 'Word' (name of our Object class)
  # 1: The actual word to be used for scoring later
  my ($class, @args) = @_;
  my ($self) = {};
  bless $self, $class; # Turn this into an object
  $word = $args[0]; # Store the word to be scored later
  $word =~ s/[^A-Za-z]//g; # Strip out odd junk
  $word =~ tr/[A-Z]/[a-z]/; # normalize to lowercase
  return $self;
}

our %points_for_letter = (
	a => 1,
	b => 3,
	c => 3,
	d => 2,
	e => 1,
	f => 4,
	g => 2,
	h => 4,
	i => 1,
	j => 8,
	k => 5,
	l => 1,
	m => 3,
	n => 1,
	o => 1,
	p => 3,
	q => 10,
	r => 1,
	s => 1,
	t => 1,
	u => 1,
	v => 4,
	w => 4,
	x => 8,
	y => 4,
	z => 10,
);

sub score {
  #print STDERR Data::Dumper->Dump([\@_],[qw(score::@_)]);
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
  # 
  # Thankfully it looks like the multipliers are ONLY for total word score. I was concerned that the values
  # might have been positions of the letter to be multiplied, but no-- they're the number of times to apply
  # the given multiplier
  my ($self, @args) = @_;
  my ($multiplier) = 1;
  my ($score) = 0;
  my ($times, $char);
  #print STDERR Data::Dumper->Dump([\@args],[qw(score::@args)]);
  # Figure out the word score total multiple
  while ($_ = shift(@args)) {
    if ($_ eq "double") {
      $times = shift @args;
      $multiplier *= 2 ** $times;
    } elsif ($_ eq "triple") {
      $times = shift @args;
      $multiplier *= 3 ** $times;
    } else {
      die "Unknown word multiplier: $_";
    }
  }
  #print STDERR "Word multiplier: $multiplier\n";
  #print STDERR "Word: $word\n";
  foreach $char ( split('',$word)) {
    #print STDERR "\tchar: $char worth $points_for_letter{$char} points\n";
    $score += $points_for_letter{$char};
  }
  return $score * $multiplier;
}

1;