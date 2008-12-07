
# $Id: Parser.pm,v 1.6 2008/12/07 03:37:28 Martin Exp $

package RDF::Simple::Parser;

use strict;

=head1 NAME

RDF::Simple::Parser - convert RDF string to bucket of triples

=head1 DESCRIPTION

A simple RDF/XML parser -
reads a string containing RDF in XML
returns a 'bucket-o-triples' (array of arrays)

=head1 SYNOPSIS

  my $uri = 'http://www.zooleika.org.uk/bio/foaf.rdf';
  my $rdf = LWP::Simple::get($uri);
  my $parser = RDF::Simple::Parser->new(base => $uri)
  my @triples = $parser->parse_rdf($rdf);
  # Returns an array of array references which are triples

=head1 METHODS

=over

=cut

use LWP::UserAgent;
use RDF::Simple::Parser::Handler;
use RDF::Simple::Parser::Sink;
use XML::SAX qw(Namespaces Validation);

our
$VERSION = do { my @r = (q$Revision: 1.6 $ =~ /\d+/g); sprintf "%d."."%03d" x $#r, @r };

# Use a hash to implement objects of this type:
use Class::MakeMethods::Standard::Hash (
                                        new => 'new',
                                        scalar => [ qw( base http_proxy )],
                                       );

=item new( [ base => 'http://example.com/foo.rdf' ])

Create a new RDF::Simple::Parser object.

'base' supplies a base URI for relative URIs found in the document

'http_proxy' optionally supplies the address of an http proxy server.
If this is not given, it will try to use the default environment settings.

=cut

=item parse_rdf($rdf)

Accepts a string which is an RDF/XML document
(complete XML, with headers)

Returns an array of array references which are RDF triples.

=cut

sub parse_rdf
  {
  my ($self,$rdf) = @_;
  my $sink = RDF::Simple::Parser::Sink->new;
  my $factory = XML::SAX::ParserFactory->new();
  $factory->require_feature(Namespaces);
  my $handler = RDF::Simple::Parser::Handler->new($sink, qnames => 1, base => $self->base );
  my $parser = $factory->parser(Handler=>$handler);
  $parser->parse_string($rdf);
  return @{ $handler->result };
  } # parse_rdf


=item parse_uri($uri)

Accepts a string which is a fully qualified http:// uri
at which some valid RDF lives.
Fetches the remote file and returns the same thing as parse_rdf().

=cut

sub parse_uri
  {
  my ($self,$uri) = @_;
  my $rdf;
  eval {
    $rdf = $self->ua->get($uri)->content;
    };
  warn ($@) if $@;
  if ($rdf) {
    $self->base($uri);
    return $self->parse_rdf($rdf);
    }
  return undef;
  } # parse_uri

sub ua
  {
  my $self = shift;
  unless ($self->{_ua}) {
    $self->{_ua} = LWP::UserAgent->new(timeout => 30);
    if ($self->http_proxy) {
      $self->{_ua}->proxy('http',$self->http_proxy);
      } else {
        $self->{_ua}->env_proxy;
        }
    }
  return $self->{_ua};
  } # ua

=back

=head1 BUGS

Please report bugs via the RT web site L<http://rt.cpan.org/Ticket/Create.html?Queue=RDF-Simple>

=head1 AUTHOR

Jo Walsh <jo@london.pm.org>
Currently maintained by Martin Thurn <mthurn@cpan.org>

=head1 LICENSE

This module is available under the same terms as perl itself

=cut

1;

__END__
