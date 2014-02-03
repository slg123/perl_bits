#!/usr/bin/perl

use strict;
use warnings;

my @cards = qw( K Q J 10 9 8 7 6 5 4 3 2 A );
my $cards_ref = \@cards;

my $card_count = @$cards_ref;
print "there are $card_count cards\n"; 

my $first_card = $cards_ref->[0];
my $last_card  = $cards_ref->[-1]; 

print "first: $first_card   last: $last_card\n";

my @high_cards = @{ $cards_ref }[ 0 .. 2, -1 ]; 

print "high cards: @high_cards\n"; 

my $suits_ref = [qw( Monkeys Robots Dinos Cheese )]; 
print $suits_ref->[0]; 

my %colors = (
    blue   => 'azul',
    red    => 'rojo',
    gold   => 'dorado',
    purple => 'morado',
);
my $colors_ref = \%colors;

my @english_colors = keys   %$colors_ref;
my @spanish_colors = values %$colors_ref;

for ( @english_colors ) {
    print $_, "\n";
}

for ( @spanish_colors ) {
    print $_, "\n"; 
}

sub translate_to_spanish {
    my $color = shift;
    return $colors_ref->{$color};
}

my $spanish_blue = translate_to_spanish( 'blue' ); 
print "blue in spanish is: $spanish_blue\n";

my @colors = qw( blue red );
my @colores = @{ $colors_ref }{@colors};
for ( @colores ) {
    print $_, "\n";
}
