#!/usr/bin/perl
# vim: set ft=perl:
#

use Test::More 'no_plan'; # tests => 6;
use SQL::Translator;
use SQL::Translator::Parser::Excel 'parse';
use SQL::Translator::Schema::Constants;

my $tr     = SQL::Translator->new(parser => "Excel");
my $t      = $tr->translate(filename => "t/data/Excel/t.xls");
my $schema = $tr->schema;

#use Data::Dumper;
#print Dumper($schema), "\n";

#ok(scalar $tr->translate(producer => "MySQL"));

my @tables = $schema->get_tables;
is( scalar @tables, 1, 'Parsed 1 table' );

my $table = shift @tables;
is( $table->name, 'Sheet1', 'Table name is "Sheet1"' );

my @fields = $table->get_fields;
is( scalar @fields, 7, 'Table has 7 fields' );

my $f1 = shift @fields;
is( $f1->name, 'ID', 'First field name is "ID"' );
is( $f1->data_type, 'VARCHAR', 'Data type is "VARCHAR"' );
is( $f1->size, 255, 'Size is "255"' );
is( $f1->is_primary_key, 1, 'Field is PK' );

my $f2 = shift @fields;
is( $f2->name, 'text', 'Second field name is "text"' );
is( $f2->data_type, 'VARCHAR', 'Data type is "VARCHAR"' );
is( $f2->size, 255, 'Size is "255"' );
is( $f2->is_primary_key, 0, 'Field is not PK' );

my $f3 = shift @fields;
is( $f3->name, 'number', 'Third field name is "number"' );
is( $f3->data_type, 'VARCHAR', 'Data type is "VARCHAR"' );
is( $f3->size, 255, 'Size is "255"' );
is( $f3->is_primary_key, 0, 'Field is not PK' );

my $f4 = shift @fields;
is( $f4->name, 'math', 'Fourth field name is "math"' );
is( $f4->data_type, 'VARCHAR', 'Data type is "VARCHAR"' );
is( $f4->size, 255, 'Size is "255"' );
is( $f4->is_primary_key, 0, 'Field is not PK' );

my $f5 = shift @fields;
is( $f5->name, 'bitmap', 'Fifth field name is "bitmap"' );
is( $f5->data_type, 'VARCHAR', 'Data type is "VARCHAR"' );
is( $f5->size, 255, 'Size is "255"' );
is( $f5->is_primary_key, 0, 'Field is not PK' );

my $f6 = shift @fields;
is( $f6->name, 'today', 'Sixth field name is "today"' );
is( $f6->data_type, 'VARCHAR', 'Data type is "VARCHAR"' );
is( $f6->size, 255, 'Size is "255"' );
is( $f6->is_primary_key, 0, 'Field is not PK' );

my $f7 = shift @fields;
is( $f7->name, 'silly_field_with_random_characters', 
    'Seventh field name is "silly_field_with_random_characters"' );
is( $f7->data_type, 'VARCHAR', 'Data type is "VARCHAR"' );
is( $f7->size, 255, 'Size is "255"' );
is( $f7->is_primary_key, 0, 'Field is not PK' );
