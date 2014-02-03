#!/usr/bin/perl

use strict;
use warnings;

my @AoA = ( [2, 3], [4, 5, 7], [0] );
print $AoA[1][2], "\n";

for ( @{$AoA[1]} ) {
    print $_, "\n";
}

