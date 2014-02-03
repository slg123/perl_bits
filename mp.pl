#!/usr/bin/perl

use v5.10;
use strict;
use warnings;

my $a = 1;
my $b = 1; 
my $c = 0;

say "Both true" if ( $a == 1 ) && ( $b == 1 );
say "Either true" if ( $a == 1 ) || ( $c == 1 );


sub ok { say "foo" }

say "Either true!" if ok( 1, 'subexpression one' )
                   || ok( 1, 'subexpression two' );
