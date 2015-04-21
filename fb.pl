#!/usr/bin/perl

use strict;
use warnings;
use autodie;

my @first_fields; 

my $file = "file.txt"; 
open my $fh, "<", $file;
while ( <$fh> ) {
    my ( $field1, $field2, $field3 ) = split( /\Q|/ ); 
    push @first_fields, $field1; 
}
close $fh; 

#
# make a hash of first word (key) and rest of line (value).
# load an array called "rest_of_lines" with the rest of the line data.
#
my %h; 
my @rest_of_lines; 
for ( @first_fields ) {
    my ( $k, $v ) = split( ' ', $_, 2 ); 
    $h{ $k } = $v; 
    push @rest_of_lines, $v;
}

for ( @rest_of_lines ) {
    print $_, "\n"; 
}

# do other stuff either with the hash or the arrays just created. 
