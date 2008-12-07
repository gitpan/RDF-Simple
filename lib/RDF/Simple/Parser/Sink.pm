
# $Id: Sink.pm,v 1.2 2008/12/07 03:36:56 Martin Exp $

package RDF::Simple::Parser::Sink;

# Use a hash to implement objects of this type:
use Class::MakeMethods::Standard::Hash (
                                        new => 'new',
                                        scalar => [ qw( result )],
                                       );

sub write
  {
  my $self = shift;
  print $self->result;
  } # write

1;
