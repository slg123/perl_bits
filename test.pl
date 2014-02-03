#!/usr/bin/perl

use autodie;
use strict;
use warnings;

my @all;
open my $fh, "<", "all_database.out";
while ( <$fh> ) { push @all, $1."\n" if $_ =~ /(db[0-9]+[a-z]+)/ }
my %seen;
my @unique = sort(grep { ! $seen{$_}++ } @all); 
for ( @unique ) { print }
