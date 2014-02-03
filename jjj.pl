#!/usr/bin/perl

use v5.10;
use strict;
use warnings;

my @meals = qw( pizza burger tofu tacos ); 

sub show_meals {
    for ( @meals ) {
        say $_;
    }
}

show_meals;
say "_____shifted____\n";
shift @meals;
show_meals;
say "_____shifted_again____\n";
shift @meals;
show_meals;
