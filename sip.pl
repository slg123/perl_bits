#!/usr/bin/env perl

use strict;
use warnings;

my @unsorted;
my @sorted;

my $file_name = "visiting_ips.txt";

open my $fh, "<", $file_name or die "can't open $!";
while ( <$fh> ) {
    push @unsorted, $_; 
}

@sorted = sort {
    my @a = $a =~ /(\d+)\.(\d+)\.(\d+)\.(\d+)/;
    my @b = $b =~ /(\d+)\.(\d+)\.(\d+)\.(\d+)/;

    $a[0] <=> $b[0] || 
    $a[1] <=> $b[1] ||
    $a[2] <=> $b[2] ||
    $a[3] <=> $b[3]

} @unsorted;

print "unsorted:\n"; 
print @unsorted;
print "sorted:\n"; 
print @sorted;

