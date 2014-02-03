#!/usr/bin/perl

use strict;
use warnings;

my @command_result = {};
our @SWAP;
our $swap_name_index      = 0;
our $swap_total_index     = 1;
our $swap_available_index = 2;

open my $fh, '-|', '/usr/sbin/lsps -a' or die 'cannot run command $!';
while ( <$fh> ) {
    @command_result = split /[\r\n]+/, $_; 
}

for ( @command_result ) {
    my $i = 0; 
    my $line = $_;

    if ( $line =~ /(\S+)+\s+\S+\s+\S+\s+(\S+)+\s+(\d+)/) {
        $SWAP[$i][$swap_name_index]      = $1;
        $SWAP[$i][$swap_total_index]     = $2;
        $SWAP[$i][$swap_available_index] = 100 - $3; 
        $SWAP[$i][$swap_total_index]     = s/[a-zA-Z]//g;
     
        $SWAP[$i][$swap_available_index] = ( $SWAP[$i][$swap_available_index] * $SWAP[$i][$swap_total_index] / 100 );
    }

    print "$SWAP[$i][$swap_name_index]\n";
    print "$SWAP[$i][$swap_total_index]\n";
    print "$SWAP[$i][$swap_available_index]\n";

    $i++; 
}
