#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

use Socket 'inet_aton';
use List::MoreUtils 'apply';

my $cmd = "/bin/netstat -na";
my $visitors = "visiting_ips.txt";
open my $ofh, ">", $visitors;
open my $fh, "-|", $cmd;
while ( <$fh> ) {
    if ( /ESTABLISHED/ ) {
        my ( $proto, $recv_q, $send_q, $local_addr, $foreign_addr, $state ) = split ' ';
        my ( $addr, $port ) = split ':', $foreign_addr;
        print $ofh "$addr\n";
    }
}
close $fh;
close $ofh;

open my $ifh, "<", $visitors or die "can't open $!";
my @sorted = map { substr($_, 4) }
             sort
             map { inet_aton($_) . $_ }
             apply { chomp }
             <$ifh>;

close $ifh;
my %seen = ();
for my $ip ( @sorted ) {
    $seen{ $ip }++;
}
my @unique_ips = keys %seen;
for ( @unique_ips ) {
    print $_, "\n"; 
}
