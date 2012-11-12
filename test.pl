#!/usr/bin/env perl

use warnings;
use strict;

use Net::Google::Spreadsheets;

my %config = do '/secret/google.config';
my $key = $config{'key'};

my $service = Net::Google::Spreadsheets->new(
		username => $config{'username'},
		password => $config{'password'},
);

# find a spreadsheet by key
my $spreadsheet = $service->spreadsheet(
	{
		key => $key,
    }
);

# find a worksheet by title
my $worksheet = $spreadsheet->worksheet(
	{
		title => 'Sheet1'
	}
);


my @rows = $worksheet->rows;

my %db; #holds callsign and forum username equivalences
#key = callsign
#value = forumname

foreach my $row (@rows){

	my $callsign ="${$row->content}{'enterapilotscallsign'}";
	my $forumname ="${$row->content}{'entertheircorrespondingforumname'}";

	$db{"$callsign"}="$forumname";

}

