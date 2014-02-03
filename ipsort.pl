#!/usr/bin/env perl

use strict;
use warnings;

use Socket 'inet_aton';
use List::MoreUtils 'apply';

my $file_name = "visiting_ips.txt";

open my $fh, "<", $file_name or die "can't open $!";
my @sorted = map { substr($_, 4) }
             sort
             map { inet_aton($_) . $_ }
             apply { chomp }
             <$fh>;

print "$_\n" foreach @sorted;
close $fh;
