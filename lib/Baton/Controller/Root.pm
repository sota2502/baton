package Baton::Controller::Root;
use Moose;
use namespace::autoclean;

use Crypt::OpenSSL::CA;
use OAuth::Lite::ServerUtil;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

Baton::Controller::Root - Root Controller for Baton

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    # Hello World
    # $c->response->body( $c->welcome_message );
    my $params = $c->req->params;
    unless ( $params->{code} && $params->{state} ) {
        unless ( $self->is_valid_request($c) ) {
            $c->go('default');
        }
        $c->go('init');
    }

    unless ( $params->{state} eq $c->sessionid ) {
        $c->go('default');
    }

    $c->session->{code} = $params->{code};
}

sub init :Private {
    my ( $self, $c ) = @_;
    $c->session->{viewer_id} = $c->req->param('opensocial_viewer_id');
    $c->stash->{session_id} = $c->sessionid;
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head2 is_valid_request

=cut

sub is_valid_request {
    my ($self, $c) = @_;

    my $ca  = $c->config->{graph_api}->{cert};
    my $url = $c->config->{graph_api}->{url};

    my $public_key =
      Crypt::OpenSSL::CA::X509->parse($ca)->get_public_key()->to_PEM();
    my $util = OAuth::Lite::ServerUtil->new();
    $util->support_signature_method('RSA_SHA1');

    my $ret = $util->verify_signature(
        method          => $c->req->method,
        url             => $url,
        params          => $c->req->params,
        consumer_secret => $public_key,
    );

    return $ret ? 1 : 0;
}

=head1 AUTHOR

中森 創太

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
