#!/usr/bin/env perl

package MyClass;

use strict;
use warnings;

sub print_me {
    my $self = @_;
    print "ID: $self->{_id}\n"; 
    print "$self->{_descr}\n"; 
    print "(Note: problem is fatal)\n" 
        if $self->{type} eq "fatal";
}
