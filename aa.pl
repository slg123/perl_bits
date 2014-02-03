#!/usr/bin/env perl

use v5.10;
use autodie;
use strict;
use warnings;

my @ints = 1..10;
my @squares = map { $_ * $_ } @ints;

for ( my $i = 0; $i <= $#ints; $i++ ) {
    printf("%d\t%d\n", $ints[$i], $squares[$i]); 
}

# use v5.10
for ( @squares ) {
    say $_;
}
