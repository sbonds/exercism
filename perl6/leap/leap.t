#!/usr/bin/env perl6
use v6;
use Test;
use JSON::Fast;
use lib $?FILE.IO.dirname;
use Leap;
plan 5;

my $c-data = from-json $=pod.pop.contents;
for Date, DateTime {
  .^method_table<is-leap-year>.wrap: {
    warn 'built-in `is-leap-year` method is not allowed for this exercise.';
    Nil;
  };
}

for $c-data<cases>.values {
  given is-leap-year .<input><year> -> $result {
    subtest .<description>, {
      plan 2;
      isa-ok $result, Bool;
      is-deeply $result, .<expected>, 'Result matches expected';
    }
  }
}

=head2 Canonical Data
=begin code
{
  "exercise": "leap",
  "version": "1.4.0",
  "cases": [
    {
      "description": "year not divisible by 4: common year",
      "property": "leapYear",
      "input": {
        "year": 2015
      },
      "expected": false
    },
    {
      "description": "year divisible by 4, not divisible by 100: leap year",
      "property": "leapYear",
      "input": {
        "year": 1996
      },
      "expected": true
    },
    {
      "description": "year divisible by 100, not divisible by 400: common year",
      "property": "leapYear",
      "input": {
        "year": 2100
      },
      "expected": false
    },
    {
      "description": "year divisible by 400: leap year",
      "property": "leapYear",
      "input": {
        "year": 2000
      },
      "expected": true
    },
    {
      "description": "year divisible by 200, not divisible by 400: common year",
      "property": "leapYear",
      "input": {
        "year": 1800
      },
      "expected": false
    }
  ]
}
=end code
