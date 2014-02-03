#!/usr/bin/env perl

use strict;
use warnings;

sub check_required_items {
    my $who = shift;
    my %whos_items = map { $_, 1 } @_; # the rest are the person's items

    my @required = qw( preserver sunscreen water_bottle jacket );

    for my $item ( @required ) {
        unless( $whos_items{$item} ) {
            print "$who is missing $item\n";
        }
    }
    print "\n";
}

my @gilligan = qw( red_shirt hat lucky socks water_bottle ); 
my @professor = qw( sunscreen water_bottle slide_rule batteries radio ); 
check_required_items( 'gilligan', @gilligan ); 
check_required_items( 'professor', @professor ); 


