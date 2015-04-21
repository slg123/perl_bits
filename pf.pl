#!/usr/bin/perl

use strict;
use warnings;

my $bignum = 600851475143;

my $i = 1;
my $j;
my $k;

while ( $i <= $bignum ) {
    $k = 0;
    if ( $bignum % $i == 0 ) {
        $j = 1;
        while ( $j <= $i ) { 
            if ( $i % $j == 0 ) {
                $k++;
            }
            $j++;
        }
        if ( $k == 2 ) {
            print "prime factor: $i\n"; 
        }
    }
    $i++;
}


