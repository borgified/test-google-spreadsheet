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


# get a cell
my $cell = $worksheet->cell({col => 1, row => 1});


foreach my $key (keys %$cell){
	print "$key $$cell{$key}\n";
}
