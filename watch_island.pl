#!/usr/bin/perl 

use strict;
use warnings;

my %total_bytes;

open my $fh, '<', 'coconet.dat' or die 'cannot open: $!';
while (<$fh>) {
    my ( $source, $destination, $bytes ) = split;
    $total_bytes{$source}{$destination} += $bytes;
}

for my $source ( sort keys %total_bytes ) {
    for my $destination ( sort keys %{ $total_bytes{$source} }) {
        #print "$source => $destination: $total_bytes{$source}{$destination} bytes\n"; 
        printf "%25s => %-30s %-25s\n", $source, $destination, $total_bytes{$source}{$destination};
    }
    print "\n";
}


