#!/usr/bin/perl

use strict;
use warnings;
use Cwd;

my $cwd = &Cwd::cwd(); 

my $keep_playing = 1;
while ( $keep_playing == 1 ) {
    print "tank or aircraft combat? ";
    chomp( my $choice = <STDIN> ); 
    if ( $choice eq "tank" ) {
        system( "$cwd/tank_combat.pl" ); 
        print "play again? ( y/n ): "; 
        chomp( my $play_again = <STDIN> );
        if ( $play_again eq "y" || $play_again eq "Y" ) {
            $keep_playing = 1;
        } else {
            $keep_playing = 0; 
        }
    } elsif ( $choice eq "aircraft" ) {
        system( "$cwd/aircraft_combat.pl" ); 
        print "play again? ( y/n ): "; 
        chomp( my $play_again = <STDIN> );
        if ( $play_again eq "y" || $play_again eq "Y" ) {
            $keep_playing = 1;
        } else {
            $keep_playing = 0; 
        }
    } else {
        print "I don't understand that selection.\n";
        $keep_playing = 1; 
    }
}
