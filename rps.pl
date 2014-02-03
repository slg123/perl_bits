#!/usr/bin/env perl

use v5.10;
use strict;
use warnings;

my @options = ( \&rock, \&paper, \&scissors );
my $confused = "I don't understand your move.";

do {

    say "Rock, Paper, Scissors! Pick one: ";
    chomp( my $user = <STDIN> );
    my $computer_match = $options[ rand @options ];
    $computer_match->( lc( $user ) ); 
} until ( eof ); 

sub rock {
    print "I chose rock. ";

    given (shift) {
        when ( /paper/ )    { say 'You win!' };
        when ( /rock/ )     { say 'We tie!' };
        when ( /scissors/ ) { say 'I win!' };
        default             { say $confused };
    }
}

sub paper {
    print "I chose paper. ";

    given (shift) {
        when ( /paper/ )    { say 'We tie!' };
        when ( /rock/ )     { say 'I win!' };
        when ( /scissors/ ) { say 'You win!' };
        default             { say $confused };
    }
}
sub scissors {
    print "I chose scissors. ";

    given (shift) {
        when ( /paper/ )    { say 'I win!' };
        when ( /rock/ )     { say 'You win!' };
        when ( /scissors/ ) { say 'We tie!' };
        default             { say $confused };
    }
}
