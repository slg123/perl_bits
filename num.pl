#!/usr/bin/perl

use strict;
use warnings;

our $j; 

sub solve {
    my $n = 6; 
    for my $i ( 3 .. 10 ) {
        $j = $i * $n;
        $n += 2; 
        print "$i = $j\n";
    }
    return $j;
}

my $solution = solve();
print $solution, "\n"; 

