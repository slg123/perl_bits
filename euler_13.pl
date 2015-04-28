#!/usr/bin/perl

use strict;
use warnings;
use autodie;
use List::Util qw(reduce);

my $file = "bignums"; 
open my $fh, "<", $file; 
my @nums = (); 
while ( <$fh> ) {
    my $line = $_; 
    push @nums, $line; 
}

my $sum = substr(( reduce { $a + $b } @nums ), 0, 11 ); 
$sum =~ s/[^\d]//g; 
print $sum, "\n"; 
