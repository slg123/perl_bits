#!/usr/bin/perl

# the OracleUnix alertlog KS does not use fseek. wtf? why not?
use strict;
use warnings;

our $current_number_of_lines = 436;
our $last_number_of_lines = 429;
our $iter = 2;
#our $iter = 1;  # try it out for first iteration

my %logfile_linecounts = (); 

sub get_previous_linecounts {
    #my @logfiles = qw( /var/log/messages-20140126 /var/log/messages-20140202 /var/log/messages ); 
    my @logfiles = glob( '/var/log/messages*' ); 
    my @linecounts;
    for my $logfile ( @logfiles ) {
        my @linecount = split / /, `wc -l $logfile`; 
        my $nl = $linecount[0]; 
        push @linecounts, $nl;
        print "$nl lines in $logfile\n"; 
    }
    #
    # create a hash of logfiles and linecounts
    #
    @logfile_linecounts{ @logfiles } = @linecounts;
}

get_previous_linecounts(); 
foreach my $value ( keys %logfile_linecounts ) {
    print "$value : $logfile_linecounts{$value}\n";
}

sub open_new_entries {
    my $fn = shift;
    my $new_number_of_lines = 0;
    my @current_number_of_lines = split / /, `wc -l $fn`;
    my $nl = $current_number_of_lines[0]; 
    print "DEBUG: current number of lines in $fn: $nl\n"; 
    if ( $current_number_of_lines < $last_number_of_lines ) {
        $new_number_of_lines = $last_number_of_lines; 
        $last_number_of_lines = 0;
        print "open_new_entries: The alert log has been reset.\n"; 
    } else {
        $last_number_of_lines = $current_number_of_lines, if $iter == 1; 
        $new_number_of_lines = $current_number_of_lines - $last_number_of_lines;
    }
    print "DEBUG: tail -n $new_number_of_lines $fn\n";
    open my $fh, "-|", "tail -n $new_number_of_lines $fn" or die "can't issue tail -n: $!";
    return $fh;
}

my $file = "/var/log/messages"; 
my $alert_log_filehandle = &open_new_entries( $file ); 
while ( <$alert_log_filehandle> ) {
    print;
}
