#!/usr/bin/env perl

use strict;
use warnings;
use Carp;
use File::Spec;
use File::Find;

sub trace {
    my $self = shift;

    if (defined($self->{util})) {
        my @temp = @_;

        $self->assert(($#temp == 1) ||
                      $self->assert_log(
                          "BaseMO::trace requires 2 parameters"));

        $self->{util}->trace(@temp);
    }
}


sub findFile {

    #my $self = shift;
    #$self->trace("foo");

    my @temp = @_;

    my $searchPath = $temp[0];
    our $filename  = $temp[1];
    print "DEBUG: searchPath -> $searchPath filename -> $filename\n";

    my $follow = 0;
    my $followSkip = 0;

    if ( defined( $temp[2] )) {
        if ( $temp[2] == 1 ) {
            $follow = 1;
            $followSkip = 2;
        }
    }

    our @locs = ();

    sub checkForMatch {
        my $fn = $_;
        if ( index( $fn, $filename ) != -1 ) {
            my @fileparts = split( /\//, $fn );
            if ( $fileparts[$#fileparts] eq $filename ) {
                push @locs, $fn;
            }
        }
    }
    
    @locs = ();
    while ( $#locs > -1 ) {
        pop( @locs );
    }

    find({ 
            wanted      => \&checkForMatch,
            no_chdir    => 1,
            follow      => $follow,
            follow_skip => $followSkip 
         }, $searchPath ); 

    return @locs;
}

sub assert {
    my $self = shift;

    if (defined($self->{util})) {
        my @temp = @_;
        if ($#temp != 0) {
            $self->assert($self->assert_log(
                          "BaseMO::assert takes 1 parameter"));
        }

        $self->{util}->assert(@temp);

        if ($@) {
            $self->{assertFired} = 1;
            $self->{assertMessage} = "Internal error:\n$@\n";
            $self->AbortTheScript($self->{assertMessage});
        }
    }
}

my $findPath = "/Unix2/Unix/scottg/src/perl/foo/bar";
print "DEBUG: findFile( $findPath, \"weblogic.jar\" )\n"; 

my @location = findFile($findPath, "weblogic.jar"); 
my $numRegistryFilesFound += scalar(@location); 
print "$numRegistryFilesFound <-- this should be 1\n";
