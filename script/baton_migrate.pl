#!/usr/bin/perl
use strict;
use warnings;

use FindBin::libs;

use DBIx::Migration;

my $m = DBIx::Migration->new({
    dsn => 'dbi:mysql:baton',
    dir => './schema/',
    username => 'root',
    password => '',
});
$m->migrate();
