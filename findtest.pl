#!/usr/bin/perl

($#ARGV == 0) or die "usage: $0 [directory]\n";

use strict;
use warnings;
use File::Find;

my %size = (); 
find( sub {$size{$File::Find::name} = -s if -f; }, @ARGV );
my @sorted = sort {$size{$b} <=> $size{$a}} keys %size;

splice @sorted, 20 if @sorted > 20;

for ( @sorted ) {
    printf "%10d %s\n", $size{$_}, $_;
}
       
