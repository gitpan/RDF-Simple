# -*- perl -*-

# t/002_simple.t - run a simple document through the parser, into the serialiser, back through the parser again
use strict;
use Test::More tests => 4;
use RDF::Simple::Parser;
use RDF::Simple::Serialiser;

if (eval {require Test::Differences; 1})  {
    # we have Test::Differences, redefine is_deeply to be eq_or_diff_data
    local $^W;
    *is_deeply = \&Test::Differences::eq_or_diff_data;
}

my $ser = RDF::Simple::Serialiser->new();
my $par = RDF::Simple::Parser->new();

open(FILE,'t/simple.rdf') or die "couldnt open t/simple.rdf for testing! $!";
my $rdf = join('',<FILE>);
close FILE;

my @triples = $par->parse_rdf($rdf);
is( scalar @triples,  1, "one set of triples in the simple.rdf" );

$rdf = $ser->serialise(@triples);
ok( defined $rdf, "was able to serialise the triples" );

diag $rdf;
my @new_triples = $par->parse_rdf($rdf);

is( scalar @new_triples,  1, "one set of triples in the reparse" );

is_deeply( \@new_triples, \@triples, "triples roundtripped" );
