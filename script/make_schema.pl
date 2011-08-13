#!/usr/bin/env perl

use strict;
use warnings;
use DBI;
use FindBin;
use File::Spec;
use lib File::Spec->catdir( $FindBin::Bin, '..', 'lib' );
use lib File::Spec->catdir( $FindBin::Bin, '..', 'extlib', 'lib', 'perl5' );
use BBS;
use Teng::Schema::Dumper;

my $c = BBS->bootstrap;
my $dbh = DBI->connect( @{ $c->config->{Teng} } ) or die;
my $schema = Teng::Schema::Dumper->dump( dbh => $dbh, namespace => 'BBS::DB' );

my $dest = File::Spec->catfile( $FindBin::Bin, '..', 'lib', 'BBS', 'DB', 'Schema.pm' );
open my $fh, '>', $dest or die "cannot open file '$dest': $!";
print {$fh} $schema;
close;
