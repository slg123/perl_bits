#!/usr/bin/perl

use strict;
use warnings;

my %greets = (
    Skipper => sub {
        my $person = shift;
        print "Skipper: Hey there, $person!\n";
    },
    Gilligan => sub {
        my $person = shift;
        if ( $person eq 'Skipper' ) {
            print "Gilligan: Sir, yes sir, $person!\n"; 
        } else {
            print "Gilligan: Hi $person!\n";
        }
    },
    Professor => sub {
        my $person = shift;
        print "Professor: By my calculations, you must be $person!\n";
    },
    Ginger => sub {
        my $person = shift;
        print "Ginger: (in a sultry voice) Well hello, $person!\n"; 
    },
);

my @room;
for my $person ( qw( Gilligan Skipper Professor Ginger ) ) {
    print "\n";
    print "$person walks into the room.\n";
    for my $room_person( @room ) {
        $greets{$person}->($room_person);
        $greets{$room_person}->($person);
    }
    push @room, $person;
}

my $maryann = sub {
    my $person = shift;
    print "Maryann: Good afternoon, $person...\n"; 
};
$maryann->('Skipper'); 


