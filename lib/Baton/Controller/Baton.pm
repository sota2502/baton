package Baton::Controller::Baton;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Baton::Controller::Baton - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

}

=head2 add

=cut

sub add :Local {
    my ( $self, $c ) = @_;

    if ( $c->form->has_error ) {
        $c->stash->{error} = $c->form;
        $c->res->body('error');
        $c->go('index');
    }

    $c->go('index');
}


=head1 AUTHOR

中森 創太

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
