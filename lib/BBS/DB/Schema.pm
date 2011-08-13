package BBS::DB::Schema;
use Teng::Schema::Declare;
table {
    name 'entry';
    pk 'entry_id';
    columns (
        'entry_id',
        'body',
    );
};

1;
