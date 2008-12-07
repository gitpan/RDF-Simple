
# $Id: Attribs.pm,v 1.2 2008/12/07 03:36:55 Martin Exp $

package RDF::Simple::Parser::Attribs;

use Carp;
use Data::Dumper;

# Use a hash to implement objects of this type:
use Class::MakeMethods::Standard::Hash (
                                        scalar => [ qw( qnames x ) ],
                                       );

sub new {
    my ($class, $attrs) = @_;

    my $self = bless {}, ref $class || $class;
    while (my ($k,$v) = each %{$attrs}) {

        my ($p,$n) = ($v->{NamespaceURI},$v->{LocalName});
        $self->{$p.$n} = $v->{Value};
    }
    return $self;
}

1;
