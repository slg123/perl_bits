#!/usr/bin/env perl
#
use strict;
use warnings;

my $ref;

{
    my @skipper = qw( blue_shirt hat jacket preserver sunscreen );
    $ref = \@skipper;

    print "$ref->[2]\n"; 
}

pop @$ref;

sub print_them {
    for ( @$ref ) {
        print $_, "\n";
    }
}

sub foo {
    sub ref_stuff {
        print $ref->[2], "\n"; 
        print "\n\nfirst pass:\n\n";
        print_them;

        push @$ref, 'sextant';

        print $ref->[-1], "\n";
        print "\n\nsecond pass:\n\n";
        print_them;

        $ref = undef;

        print "\n\nthird pass:\n\n";
        print_them;
    }
    ref_stuff;
}

foo;
