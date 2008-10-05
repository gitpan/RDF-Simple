
# $Id: Simple.pm,v 1.3 2008/10/05 19:02:28 Martin Exp $

package RDF::Simple;
use strict;

our
$VERSION = do { my @r = (q$Revision: 1.3 $ =~ /\d+/g); sprintf "%d."."%03d" x $#r, @r };

sub new
  {
  my ($class, %parameters) = @_;
  my $self = bless ({}, ref ($class) || $class);
  return ($self);
  } # new

1;

=head1 NAME

RDF::Simple - read and write RDF without complication

=head1 DESCRIPTION

This package is for very simple manipulations
of RDF/XML serialisations of RDF graphs. 
It consists of:

    RDF::Simple::Parser
    RDF::Simple::Serialiser

Please consult the individual pod for these packages.
The parser requires XML::SAX

Also provided is RDF::Simple::NS,
a utility class for XML namespaces in RDF

The aim here is to keep things Simple: 
e.g., the parser doesn't differentiate between
literal and resource values in the model
All you get back is a bucket-o-triples
(array of arrays)

Use the parser to read RDF that you recieve.

The serialiser does its best to do DWYM. Use the
serialiser to build RDF to send to others.

If you want a more complex and involved RDF API,
I'd suggest looking at RDF::Core
or at the redland RDF application toolkit
at http://www.redland.opensource.ac.uk

This is an early alpha release, and likely contains bugs.
Please report them!

=head1 AUTHOR

Original author = Jo Walsh <jo@london.pm.org>
Current maintainer = Martin Thurn <mthurn@cpan.org>

=head1 THANKS

Sean Palmer, Paul Mison, Matt Biddulph

=head1 LICENSE

This package and its contents are available under the same terms as perl itself

=cut

__END__

