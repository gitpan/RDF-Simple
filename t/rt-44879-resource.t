
# This is a test for RT#44879, rdf:resource attribute comes out as empty-string

use strict;
use warnings;

use Data::Dumper;
use Test::More 'no_plan';

use blib;
my $PM;
BEGIN
  {
  $PM = q{RDF::Simple::Parser};
  use_ok($PM);
  } # BEGIN

my $sNS = q{http://foo.com/foo.owl};
my $sNSrdf = q{http://www.w3.org/1999/02/22-rdf-syntax-ns};
my $sRDF = <<"ENDRDF";
<rdf:RDF
xmlns:foo="$sNS#"
xmlns:rdf="$sNSrdf#"
>
<foo:Baz rdf:about="#baz_id" />
<foo:Bar rdf:about="#bar_id">
   <foo:bazProp rdf:resource="#baz_id" />
</foo:Bar>
</rdf:RDF>
ENDRDF
my $par = new $PM;
isa_ok($par, $PM);
my $node1 = qq{#bar_id};
my $node2 = qq{#baz_id};
my @aExpected = (
                 [$node2, qq{$sNSrdf#type}, qq{$sNS#Baz}],
                 [$node1, qq{$sNSrdf#type}, qq{$sNS#Bar}],
                 [$node1, qq{$sNS#bazProp}, $node2],
                );
my @aGot = $par->parse_rdf($sRDF);
# print STDERR Dumper(\@aGot);
# @aExpected = sort @aExpected;
# @aGot = sort @aGot;
is_deeply(\@aGot, \@aExpected);

__END__
