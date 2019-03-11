#!/usr/bin/env perl
use strict;
use warnings;
use open ':std', ':encoding(utf8)';
use utf8;

use Test::More;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";
use Data::Dumper;

my $module = 'Phrase';

my @cases = (
    # input                                       expected output                  title
    ['word',                                      {word =>  1},                    'one word'],
    ['one of each',                               {one => 1, of => 1, each => 1},  'one of each'],
    ['one fish two fish red fish blue fish',
            {one => 1, fish => 4, two => 1, red => 1, blue => 1},
                 'multiple occurences'],
    ['car : carpet as java : javascript!!&@$%^&',
            {car => 1, carpet => 1, as => 1, java => 1, javascript => 1},
                'ignore punctuation'],
    ['testing, 1, 2 testing',                     {testing => 2, 1 => 1, 2 => 1}, 'include numbers'],
    ['go Go GO',                                  {go => 3},                       'normalize case'],
);


plan tests => 3 + @cases;

ok -e "$Bin/$module.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a module called $module.pm with a function called word_count() that gets one parameter: the text in which to count the words.");

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ?");

can_ok($module, 'word_count') or BAIL_OUT("Missing package Phrase; or missing sub word_count()");

my $sub = $module . '::word_count';

foreach my $c (@cases) {
    no strict 'refs';
    #print STDERR "Expecting: " . Data::Dumper->Dump([\$c->[1]],[qw($c->[1])]);
    #my $arg_passed = $c->[0];
    #print STDERR "Arg passed: '$arg_passed'\n";
    #my $phrase = new Phrase;
    #my $result = $phrase->word_count($arg_passed);
    #print STDERR "Result: $result\n";
    #print STDERR "Got: " . Data::Dumper->Dump([\Phrase::word_count->($c->[0])],["word_count($c->[0])"]);
    #print STDERR "Got: " . Data::Dumper->Dump([\$result],[qw($result)]);
    #rint STDERR "Running is_deeply $sub->($c->[0]), $c->[1], $c->[2]\n";
    #print STDERR Data::Dumper->Dump([\$c->[1]],[qw($c->[1])]);
    #
    # https://stackoverflow.com/questions/30258888/converting-datatypes-for-failing-test-function-in-perl
    # Suggests the anonymous array workaround for "is_deeply() takes two or three args, you gave 8." (number varies)
    # 
    is_deeply [$sub->($c->[0])], [$c->[1]], [$c->[2]];
}


