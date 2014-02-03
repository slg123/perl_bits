#!/usr/bin/perl 

use strict;
use warnings;
my $threshhold = 5;
my $user_count = 0; 
my $all_sessions = "Active User Sessions:\n\n"; 
my @activeuser_array = (); 
my %activeuser_hash = (); 

open my $who_output, '-|', "who -u", or die 'cannot open $!'; 
while ( <$who_output> ) {
    my $line = $_; 
    @activeuser_array = split / /;
    $user_count++; 
    $all_sessions .= $line; 
    if ( ! $activeuser_hash{$activeuser_array[0]} ) {
        $activeuser_hash{$activeuser_array[0]} .= $line;
        print "$activeuser_hash{$activeuser_array[0]}\n"; 
    }
}
close $who_output; 

print $all_sessions, "\n"; 
print $user_count, "\n"; 

if ( $user_count > $threshhold ) {
    print "omg, threshhold exceeded, send an alert.\n"; 
} 
