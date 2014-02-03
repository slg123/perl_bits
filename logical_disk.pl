#!/usr/bin/env perl

use strict;
use warnings;

# get filesystem to device number mapping (i.e. vg_om-lv_home is dm-2)
my @dm_devices;
print "dmsetup missing. exiting.\n" and die if ( ! -f '/sbin/dmsetup' );
open my $cmd, "-|", "/sbin/dmsetup ls" or die "can't find dmsetup: $!"; 
while ( <$cmd> ) {
    my @lines = split /\,|\:/;
    $lines[1] =~ s/\D//g; 
    push @dm_devices, $lines[1]; 
}

for ( @dm_devices ) {
    print $_, "\n";
}
