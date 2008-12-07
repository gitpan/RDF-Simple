
# $Id: from_file.t,v 1.2 2008/12/07 03:40:30 Martin Exp $

use strict;
use warnings;

use blib;
use Test::More 'no_plan';
use Test::File;
BEGIN
  {
  use_ok('RDF::Simple::Parser');
  use_ok('RDF::Simple::Serialiser');
  } # end of BEGIN block

my $ser = RDF::Simple::Serialiser->new();
isa_ok($ser, q{RDF::Simple::Serialiser});
my $par = RDF::Simple::Parser->new();

test_rdf_file(q{t/simple.rdf}, 1);
test_rdf_file(q{t/uri_file.rdf}, 1);

sub test_rdf_file
  {
  my $sFname = shift or fail;
  my $iCount = shift or fail;
  file_not_empty_ok($sFname);
  ok(open(FILE, $sFname), q{opened file});
  my $rdf = join('', <FILE>);
  ok(defined $rdf, q{got file contents});
  ok(close FILE, q{closed file});
  my @triples = $par->parse_rdf($rdf);
  is(scalar(@triples), 1, q{got exactly one triple});
  $rdf = $ser->serialise(@triples);
  # warn($rdf);
  @triples = $par->parse_rdf($rdf);
  is(scalar(@triples), 1, q{got exactly one triple round-tripped});
  } # test_rdf_file

__END__


