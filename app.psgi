use strict;
use warnings;

use FindBin;
use Plack::Builder;
use Plack::App::File;
use Plack::App::Proxy;

use lib './lib';

my $app = sub {
    return [
	    '200',
	    [ 'Content-Type' => 'text/html' ],
	    [ 42 ],
	   ];
};

builder {
    $app;
};

# use Vecto;

# my $app = Vecto->apply_default_middlewares(Vecto->psgi_app);
# $app;
