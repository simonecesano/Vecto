use strict;
use warnings;

use FindBin;
use Plack::Builder;
use Plack::App::File;
use Plack::App::Proxy;

use Mojo::Server::PSGI;

builder {
    mount "/im" => builder {
	enable 'Session', store => 'File';
    	my $server = Mojo::Server::PSGI->new;
    	$server->load_app('./im.pl');
    	$server->to_psgi_app;
    };
    mount "/gs" => builder {
	enable 'Session', store => 'File';
    	my $server = Mojo::Server::PSGI->new;
    	$server->load_app('./gs.pl');
    	$server->to_psgi_app;
    };
    mount '/' => builder {
	sub {
	    return [
		    '200',
		    [ 'Content-Type' => 'text/html' ],
		    [ 42 ],
		   ];
	};
    };
};

