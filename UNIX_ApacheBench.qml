<StringDef></StringDef>

<KSID>
  <Type>Regular</Type>
  <Name>UNIX_ApacheBench</Name>
  <Desc>Run Apache Bench, simulate 500 access requests to a URL run concurrently, collect results.</Desc>
  <Version>
    <AppManID>6.5</AppManID>
    <KSVerID>1.1</KSVerID>
  </Version>
  <NeedPWD>0</NeedPWD>
  <AdminOnly>0</AdminOnly>
  <UnixOnly>1</UnixOnly>
  <DataSrcID>0</DataSrcID>
  <Platform>-1</Platform>
  <OptionExplicit>0</OptionExplicit>
  <OriginKSName></OriginKSName>
</KSID>

<ObjType fullpath="0" dropfolderlist="0" styleversion="3">
  <Type name="UNIX_CPUFolder"></Type>
  <Type name="UNIX_CPUObj"></Type>
</ObjType>

<Schedule>
  <Default type="interval" runmode="sched">
    <Interval>
      <Hour>0</Hour>
      <Minute>5</Minute>
      <Second>0</Second>
    </Interval>
  </Default>
  <Allowed>
    <RunOnce>1</RunOnce>
    <IntervalIter>1</IntervalIter>
    <Daily>1</Daily>
    <Weekly>1</Weekly>
    <Monthly>1</Monthly>
  </Allowed>
</Schedule>

<DataSrc></DataSrc>

<Parameter>
  <Desc>Supported on:  [LINUX]
Apache Bench command ( ab -n 500 -c 100 https://someurl.out.there ).</Desc>
  <Param name="$Url">
    <Desc>URL of webserver</Desc>
    <Type>String</Type>
    <Size>1000</Size>
    <Value>https://somurl.somecompany.com/</Value>
    <ReqInput>1</ReqInput>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$GeneralSettings">
    <Desc>General Settings</Desc>
    <ReqInput>0</ReqInput>
    <Folder>2</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Severity">
    <Desc>Event severity level</Desc>
    <Type>Integer</Type>
    <Min>1</Min>
    <Max>40</Max>
    <Value>5</Value>
    <Unit>Severity</Unit>
    <ReqInput>1</ReqInput>
    <Parent>$GeneralSettings</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Akpid">
    <Desc>Action taken</Desc>
    <Value>AKP_NULL</Value>
    <ReqInput>0</ReqInput>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Data_Options">
    <Desc>Data Collection Options </Desc>
    <ReqInput>0</ReqInput>
    <Folder>1</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Do_data_time_per_request">
    <Desc>Collect data for time in ms  spent processing 500 http or https requests?</Desc>
    <Value>n</Value>
    <ReqInput>1</ReqInput>
    <I_Type>I_CHECKBOX(Yes,y,n)</I_Type>
    <Parent>$Data_Options</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Folder_Thresholds">
    <Desc>Thresholds and Eventing - app admins or sysadmins should set these threshholds. Default is 500.</Desc>
    <ReqInput>0</ReqInput>
    <Folder>2</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$TH_time_per_request">
    <Desc>Threshold -- average Time per http or https request. -1 disables.</Desc>
    <Type>Integer</Type>
    <Min>-1</Min>
    <Max>10000</Max>
    <Value>500</Value>
    <Unit>ms</Unit>
    <ReqInput>0</ReqInput>
    <Parent>$Folder_Thresholds</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$debug">
    <Desc>Enable debugging?</Desc>
    <Value>n</Value>
    <ReqInput>1</ReqInput>
    <I_Type>I_CHECKBOX(Yes,y,n)</I_Type>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
</Parameter>

<ActionDef></ActionDef>

<AdvanceConfig>
  <EventOp>
    <SupprTime uselast="1">1200</SupprTime>
    <OccurCnt nCount="1" nInterval="1">0</OccurCnt>
  </EventOp>
  <DataOp>
    <CollectIter>1</CollectIter>
    <CollectUponEvt pauseonevtstop="0">0</CollectUponEvt>
    <CollectDetail>1</CollectDetail>
    <NoArchiveDetail>0</NoArchiveDetail>
    <ReportArchive>0</ReportArchive>
  </DataOp>
</AdvanceConfig>

<ScriptDef>
  <Script language="perl">
<![CDATA[###
### Please do not remove the following comments.
### Version string added by setQMLVersion.exe during build process.
### Copyright (c) 2014 NetIQ Corporation. All rights reserved.
### VERSION: 7.4.61.0
### Copyright (c) 2006-2014 NetIQ Corp. All rights reserved.
###
### Filename:  UNIX_ApacheBench
### Branch:    main
### $Id$
### $Revision$
###
### Synopsis: Run the "ab" ( ApacheBench ) tool, collect the  time per request
###           for 500 http or https requests. 
###
### -------------------------------------------------------------------------

use strict;
use NetIQ::Nqext;

our $Sev_fail    = 10;
our $iterCount   = 0;
our $useNQACUtil = 1;

my  $JobID       = NetIQ::Nqext::GetJobID();
my  $url         = $Url; 
my  $RunTime     = localtime();
my  $KsVersion   = '$Revision: #11 $ $DateTime: 2014/5/22 17:48:53 $';

eval 'require "NetIQ/NQACUtil.pm"';
if($@) 
{
    $useNQACUtil = 0;
    &printd ("useNQACUtil = 0\n");
}

sub printd {
    if ($debug eq 'y') {
        open(DEBUG, ">>$ENV{NQMAGT_HOME}/log/UNIX_ApacheBench${JobID}");
        print "@_";
        print DEBUG "@_";
        close(DEBUG);  
    }
}

our ($sysname, $nodename, $release, $version, $machine);

NetIQ::Nqext::Uname($sysname, $nodename, $release, $version, $machine);

printd("ApacheBench ($KsVersion): Run at $RunTime, JobID=$JobID\n");

printd("ApacheBench: Uname returned sysname=$sysname, nodename=$nodename, version=$version, 
                                    release=$release, machine=$machine\n");

printd("UNIX_CPUFolder=$UNIX_CPUFolder UNIX_CPUObj=$UNIX_CPUObj TH_time_per_request=$TH_time_per_request\n"); 

our $resmsg = "UNIX_CPUFolder = $UNIX_CPUFolder";

my $detail_msg;
our $agentOwner = NetIQ::Nqext::GetAgentOwner();

my $agentVersion = ( split (/\./, NetIQ::Nqext::GetVersion()))[0];


sub get_apache_bench_results {

    my $time_per_request; 
    my $cmd = "ab -n 500 -c 100 $url 2>/dev/null"; 
    open my $fh, "-|", $cmd;
    while ( <$fh> ) {
        if ( $_ =~ m/\[ms\] \(mean\)/ ) {
            my @f = split /\s+/, $_;
            $time_per_request = $f[3]; 
        }
    }
    close $fh;

    printd( "DEBUG: $time_per_request" ); 

    if ( $TH_time_per_request ) {
        if ( $time_per_request > $TH_time_per_request ) {
            my $detail_msg = "Threshhold for time spent per request exceeded. Threshhold: $TH_time_per_request";
            NetIQ::Nqext::CreateEvent( 
                $Severity, 
                "", 
                $Akpid, 
                "", 
                0, 
                $detail_msg, 
                0, 
                0, 
                0 
            ); 
        }
    }

    #
    # Create data points for chart console. 
    # 
    if ( $Do_data_time_per_request eq "y" ) {
        our $msg = "time_per_request\n";
        my $dynamicLegend = "";
        if ( $useNQACUtil == 1 ) {
            my $ref_dynamicLegend = NetIQ::NQACUtil::NQDynamicLegend->new();
            $ref_dynamicLegend->Initialize( 
                " time_per_request ", 
                "", 
                "UNIX_ApacheBench", 
                "UNIX", 
                $resmsg, 
                "", 
                "", 
                "" 
            );

            $dynamicLegend = $ref_dynamicLegend->AsXML();
            NetIQ::Nqext::CreateData(
                "Apache/time_per_request", 
                "time_per_request", 
                $dynamicLegend, 
                $resmsg, 
                $time_per_request, 
                "", 
                0 
           ); 
        }
    }
}

get_apache_bench_results(); 

]]>
</Script>
</ScriptDef>

