#!/usr/bin/env perl

use v5.10;
use autodie;
use warnings;

sub name { 'Leonardo' }

my %address = 
(
    name() => '1123 Fib Place',
);

say $address{name()};

# Hash indexing

my %rb_teams =
(
    'Arian Foster' => 'Houston Texans',
    'Tony Dorsett' => 'Dallas Cowboys',
    'Earl Campbell' => 'Houston Oilers'
);

say $rb_teams{'Arian Foster'};
say $rb_teams{'Tony Dorsett'};
say $rb_teams{'Earl Campbell'};
    
