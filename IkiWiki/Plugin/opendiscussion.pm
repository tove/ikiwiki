#!/usr/bin/perl
package IkiWiki::Plugin::opendiscussion;

use warnings;
use strict;
use IkiWiki 3.00;

sub import {
	hook(type => "getsetup", id => "opendiscussion", call => \&getsetup);
	hook(type => "canedit", id => "opendiscussion", call => \&canedit);
}

sub getsetup () {
	return 
		plugin => {
			safe => 1,
			rebuild => 0,
		},
}

sub canedit ($$) {
	my $page=shift;
	my $cgi=shift;
	my $session=shift;

	return "" if $page=~/(\/|^)\Q$config{discussionpage}\E$/;
	return undef;
}

1
