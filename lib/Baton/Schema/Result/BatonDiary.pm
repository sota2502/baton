use utf8;
package Baton::Schema::Result::BatonDiary;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Baton::Schema::Result::BatonDiary

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<baton_diary>

=cut

__PACKAGE__->table("baton_diary");

=head1 ACCESSORS

=head2 baton_id

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 diary_number

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 user_id

  data_type: 'binary'
  is_nullable: 0
  size: 13

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 body

  data_type: 'text'
  is_nullable: 0

=head2 details

  data_type: 'text'
  is_nullable: 0

=head2 like_count

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 comment_count

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 created_at

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "baton_id",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 0 },
  "diary_number",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "user_id",
  { data_type => "binary", is_nullable => 0, size => 13 },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "body",
  { data_type => "text", is_nullable => 0 },
  "details",
  { data_type => "text", is_nullable => 0 },
  "like_count",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "comment_count",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "created_at",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</baton_id>

=item * L</diary_number>

=back

=cut

__PACKAGE__->set_primary_key("baton_id", "diary_number");


# Created by DBIx::Class::Schema::Loader v0.07024 @ 2013-05-17 00:40:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/ZWX1X4D7/BC4isRhMyuNw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
