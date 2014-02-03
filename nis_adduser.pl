#!/usr/bin/env perl

use v5.10;
use warnings;

my $num_args     = $#ARGV + 1; 
my $user_name    = $ARGV[1];
my $first_name   = $ARGV[2];
my $last_name    = $ARGV[3];
my $group        = $ARGV[4];
my $home_dir     = $ARGV[5];
my $sample_user  = $ARGV[6];
my $passwd_file  = "/var/yp/etc/passwd";
my $shadow_file  = "/var/yp/etc/shadow"; 

my $gid          = `grep $sample_user $passwd_file | awk -F: '{ print \$4 }'`;
my $high_userid  = `grep $gid $passwdfile | awk -F: '{ print \$3 }' | sort | tail -1`;
my $uid          = $high_userid + 1;

if ( $num_args != 6 ) {
    say "usage:  nis_adduser.pl <username> <firstname> <lastname> <group> <homedir> <sample user>";
    say "exmple: nis_adduser.pl scottg Scott Gillespie unix /Unix2/Unix/scottg timp"; 
    exit -1;
}

sub check_nfs {
    chomp ( my $unix2 = `df -T /Unix2 | grep nfs | awk '{ print \$2 }'` );
    if ( "$unix2" ne "nfs" ) {
        say "/Unix2 not mounted. Exiting.";
        exit -1; 
    }
}

sub check_user {
    my $u   = shift;
    my $cmd = `ypmatch $u passwd >/dev/null 2>&1`;
    my $ret = $?;
    if ( $ret == 0 ) {
        say "user $u already exists in NIS.";
        exit -1;
    } else {
        say "user $u does not exist in NIS. Adding user.";
    }
}

sub backup_passwd_and_shadow_files {
    # backup passwd file and shadow file
    system( "cp $passwd_file $passwd_file.backup" ); 
    system( "cp $shadow_file $shadow_file.backup" ); 
}

#sub add_user { 
#    system("'echo $user_name:x:$uid:$gid:$first_name $last_name:$home_dir:/bin/bash' >> $passwd_file"); 
#    system("'echo $user_name:::::::' >> $shadow_file"); 
#}

check_nfs;
check_user $user_name;
#backup_password_and_shadow_files;
#add_user;


