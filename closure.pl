#!/usr/bin/perl 

use strict;
use warnings;

sub make_iterator
{
    my @items = @_;
    my $count = 0;

    return sub
    {
        return if $count == @items;
        return $items[ $count++ ];
    }
}

my $gi_joes = make_iterator( qw( destro cobra_commander gung_ho leatherneck flint ) );
print $gi_joes->(), "\n" for 1 .. 5;

