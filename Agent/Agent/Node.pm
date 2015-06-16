#!/usr/bin/perl

package Agent::Node;

use strict;
use warnings;

sub new {
    my ($class) = @_;
    bless {
        _hostname      => $_[1],
        _os            => $_[2],
        _cpu_type      => $_[3],
        _memory_size   => $_[4],
        _ipv4_address  => $_[5],
        _ipv6_address  => $_[6],
    }, $class;
}

sub hostname     { $_[0]->{_hostname}     }
sub os           { $_[0]->{_os}           }
sub cpu_type     { $_[0]->{_cpu_type}     }
sub memory_size  { $_[0]->{_memory_size}  }
sub ipv4_address { $_[0]->{_ipv4_address} }
sub ipv6_address { $_[0]->{_ipv6_address} }

1; 
