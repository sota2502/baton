use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Baton';
use Baton::Controller::Baton;

ok( request('/baton')->is_success, 'Request should succeed' );
done_testing();
