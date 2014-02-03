#!/usr/bin/perl

package Weapon;

use strict;
use warnings;
use Carp;

sub new {
    my $class = shift;
    my $self  = { @_ };
    croak "bad arguments" unless defined $self->{type} and defined $self->{weight} and defined $self->{armor_class}; 
    return bless $self, $class; 
}

sub weapon_object {
    my $self = shift;
    return "$self->{type} $self->{weight} $self->{armor_class}";
}
1;
