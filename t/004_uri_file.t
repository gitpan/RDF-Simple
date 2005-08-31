# -*- perl -*-

# t/002_simple.t - run a simple document through the parser, into the serialiser, back through the parser again

use Test::More tests => 2;
use RDF::Simple::Parser;
use RDF::Simple::Serialiser;

my $ser = RDF::Simple::Serialiser->new();
my $par = RDF::Simple::Parser->new();

open(FILE,'t/uri_file.rdf') or die "couldnt open t/simple.rdf for testing! $!";
my $rdf = join('',<FILE>);
close FILE;

my @triples = $par->parse_rdf($rdf);
$rdf = $ser->serialise(@triples);
warn($rdf);
@triples = $par->parse_rdf($rdf);

ok (defined $rdf);
ok (scalar(@triples) eq 1);


