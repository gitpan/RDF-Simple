# -*- perl -*-

# t/002_simple.t - run a simple document through the parser, into the serialiser, back through the parser again
use lib qw(./lib);
use Test::More 'no_plan';
use RDF::Simple::Parser;
use RDF::Simple::Serialiser;

my $ser = RDF::Simple::Serialiser->new();
my $par = RDF::Simple::Parser->new();

isa_ok($ser,'RDF::Simple::Serialiser');

my $uri = 'http://zooleika.org.uk/bio/foaf.rdf';
my @triples = $par->parse_uri($uri);
$rdf = $ser->serialise(@triples);
print $rdf;
