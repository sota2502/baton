use strict;
use warnings;

use Baton;

my $app = Baton->apply_default_middlewares(Baton->psgi_app);
$app;

