#!/usr/bin/env perl

use strict;
use warnings;

my @things = qw( thing1 thing2 thing3 ); 
my @others = map { $_ } @things;

print @things;
print "\n----\n"; 
print @others;
print "\n"; 


