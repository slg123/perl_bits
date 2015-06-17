#!/usr/bin/perl

package Agent::Files;

use strict;
use warnings;

sub new {
    my ($class) = @_;
    bless {
        _etchosts  => $_[1],
        _etcgroup  => $_[2],
        _etcpasswd => $_[3],
    }, $class;
}

sub etchosts  { $_[0]->{_etchosts}  }
sub etcgroup  { $_[0]->{_etcgroup}  }
sub etcpasswd { $_[0]->{_etcpasswd} }

1; 
