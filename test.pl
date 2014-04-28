#!/usr/bin/perl

use strict;
use warnings;

open my $fh, "<", "/var/log/messages" or die "can't open $!";
my $size = -s $fh;
my ( $current_position, $new_data, $buffer ); 

$current_position = tell $fh;
print "size: $size current position: $current_position\n"; 

seek ( $fh, -1024, 2 ); 
$current_position = tell $fh;
print "size: $size current position: $current_position\n";

$new_data = read( $fh, $buffer, 1024 );

print $new_data;
#print $buffer;
