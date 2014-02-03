#!/usr/bin/perl

use Weapon;

package main;

my $aircraft1 = Weapon->new( type => "Mitsubishi A6M Zero", weight =>  5200, armor_class => 10 );
my $aircraft2 = Weapon->new( type => "Focke-Wulfe 190",     weight =>  8000, armor_class => 13 );
my $aircraft3 = Weapon->new( type => "Grumman F6F Hellcat", weight => 10000, armor_class =>  4 );

sub get_lowest_armor_class {
    my @armor_classes; 
    for ( $aircraft1, $aircraft2, $aircraft3 ) { 
        push @armor_classes, $_->{ armor_class };
    }
    my @sorted = sort { $a <=> $b } @armor_classes;
    return $sorted[0];  
}

sub find_aircraft_with_lowest_armor_class {
    my @aircraft;
    for ( $aircraft1, $aircraft2, $aircraft3 ) {
        if ( $_->{ armor_class } == get_lowest_armor_class() ) {
            return $_->{ type };
        }
    }
}

my $winning_aircraft_type = find_aircraft_with_lowest_armor_class(); 
sub get_winning_aircraft_weight {
    for ( $aircraft1, $aircraft2, $aircraft3 ) {
        if ( $_->{ type } eq $winning_aircraft_type ) {
            return $_->{ weight };
        }
    }
}

print $aircraft1->weapon_object,  "\n";
print $aircraft2->weapon_object,  "\n";
print $aircraft3->weapon_object,  "\n";
my $winning_aircraft = find_aircraft_with_lowest_armor_class(); 
my $winning_aircraft_weight = get_winning_aircraft_weight(); 
print "winning aircraft is: $winning_aircraft\n"; 
print "winning aircraft weight is: $winning_aircraft_weight\n"; 
