#!/usr/bin/perl

use strict;
use warnings;
package main;
use Agent::Node; 

my $node = Agent::Node->new( 
    "om.houqe.lab", 
    "CentOS 8",
    "intel x86_64",
    "4GB",
    "10.45.10.9",
    "fe80::21e:4fff:fee6:8126"
); 

my @attrs = qw( hostname os cpu_type memory_size ipv4_address ipv6_address ); 
for my $attr (@attrs) {
    print $node->$attr, "\n"; 
}
