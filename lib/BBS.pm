package BBS;
use strict;
use warnings;
use parent qw/Amon2/;
our $VERSION = '0.01';
use 5.008001;

use BBS::DB;

sub db {
    my ($self) = @_;
    if ( !defined $self->{db} ) {
        my $c = $self->config->{Teng};
        $self->{db} = BBS::DB->new( connect_info => $c );
    }
    return $self->{db};
}

1;
