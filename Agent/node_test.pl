#!/usr/bin/perl

use strict;
use warnings;
package main;
use Agent::Node; 
use Agent::Files;

my $node = Agent::Node->new( 
    "om.houqe.lab", 
    "CentOS 8",
    "intel x86_64",
    "4GB",
    "10.45.10.9",
    "fe80::21e:4fff:fee6:8126"
); 

my $files = Agent::Files->new(
    "/etc/hosts",
    "/etc/group",
    "/etc/passwd",
);

my @node_attributes = qw( hostname os cpu_type memory_size ipv4_address ipv6_address ); 
for my $i (@node_attributes) {
    print $node->$i, "\n"; 
}

my @file_listing = qw( etchosts etcgroup etcpasswd ); 
for my $i (@file_listing) {
    print $files->$i, "\n"; 
}
