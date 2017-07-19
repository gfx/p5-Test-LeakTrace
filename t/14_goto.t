#!perl

use strict;
use warnings;
use Test::More 'no_plan'; # I don't know the number of 'ok'

use Test::LeakTrace;

ok defined &leaktrace;

leaktrace {
    goto \&test;
} sub {
	my ($ref, $file, $line) = @_;
	fail "goto false positive. $ref / $file / $line";
};

sub test {}
