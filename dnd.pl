#!/usr/bin/perl

use strict;
use warnings;

my @races   = qw( Human Half-Elf Orc Dwarf Elf );
my @classes = qw( Mage Fighter Thief Ranger ); 

my $race;
my $class;

sub get_character_race {
    my $success = 0;
    while ( $success == 0 ) {
        print "Which race do you wish to be?\n"; 
        print "available races: \n"; 
        for ( @races ) { print $_, " " }
        print "choice: "; 
        chomp( $race = <STDIN> );
        if (!grep( /$race/, @races )) { # see if race is in @races array. if not, print a message. if so, end loop.
            print "That race is not available. Please select a listed race.\n"; 
        } else {
            $success = 1;
        }
    }
    return $race;
}
get_character_race(); 
    
sub get_character_class {    
    my $success = 0;
    while ( $success == 0 ) {
        print "\nWhich class do you wish to be?\n"; 
        print "available classes: \n"; 
        for ( @classes ) { print $_, " " }
        print "choice: ";
        chomp( $class = <STDIN> ); 
        if (!grep( /$class/, @classes )) {  
            print "That class is not available. Please select a listed class.\n"; 
        } else {
            $success = 1;
        }
    }
    return $class;
}
get_character_class();

print "Enter a character name: "; 
chomp ( my $charname = <STDIN> ); 
print "Character name: $charname\n";

sub show_character_attributes {
    my %character_attributes = (); 
    my @attribute_names = qw( Wisdom Strength Intelligence Dexterity Constitution Charisma ); 
    my @attribute_values = (); 

    for ( @attribute_names ) {
        my $val = int(rand(20)); 
        if ( $val < 8 ) {
            $val += 5;            # if attr value is too low increase by 5
            push @attribute_values, $val;
        } else {
            push @attribute_values, $val;
        }
    }

    for ( my $i = 0; $i <= $#attribute_names; $i++ ) {
        $character_attributes{$attribute_names[$i]} = $attribute_values[$i];
    }

    while ( my ( $key, $value ) = each %character_attributes ) {
        print "$key $value\n"; 
    }

}
print "Attributes for $race, $class, $charname:\n"; 
show_character_attributes(); 

