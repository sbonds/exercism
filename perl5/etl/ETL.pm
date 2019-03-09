package ETL;
use strict;
use warnings;
#use Data::Dumper;
use Exporter 'import';
our @EXPORT_OK = qw(transform);

sub transform {
  # The old hash has numbers as keys and letters as values.
  # The new hash should have letters as keys and numbers as values
  my ($old_hash_ref) = @_;
  my (%new_hash, $number, $letter);
  foreach $number (keys(%{ $old_hash_ref })) {
    #print STDERR "Processing number $number\n";
    foreach $letter (@{ $old_hash_ref->{$number} }) {
      $letter =~ tr/[A-Z]/[a-z]/;
      #print STDERR "Adding letter $letter with value $number\n";
      $new_hash{$letter} = $number;
    }
  }
  #print STDERR Data::Dumper->Dump([%new_hash],[qw(%new_hash)]);
  return \%new_hash;
}

1;