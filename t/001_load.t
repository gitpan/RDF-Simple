# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 4;


BEGIN { 
use_ok( 'RDF::Simple::Parser' );
use_ok( 'RDF::Simple::Serialiser' );
}


my $ser = RDF::Simple::Serialiser->new ();
my $par = RDF::Simple::Parser->new ();
isa_ok ($ser, 'RDF::Simple::Serialiser');
isa_ok ($par, 'RDF::Simple::Parser');


