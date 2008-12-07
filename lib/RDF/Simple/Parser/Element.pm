
# $Id: Element.pm,v 1.2 2008/12/07 03:36:56 Martin Exp $

package RDF::Simple::Parser::Element;

use Data::Dumper;

# Use a hash to implement objects of this type:
use Class::MakeMethods::Standard::Hash (
                                        scalar => [ qw( base subject language URI qname attrs parent children xtext text )],
                                       );

sub new {
    my ($class,$ns,$prefix,$name,$parent,$attrs,%p) = @_;
    my $self = bless {}, ref $class || $class;
    my $base = $attrs->{base};
    $base ||= $parent->{base};
    $base ||= $p{base};
    $self->base($base);
    $self->URI($ns.$name);
    $self->qname($ns.':'.$name);
    $self->attrs($attrs);
    $self->parent($parent) if $parent;
    $self->xtext([]);
    return $self;
}

1;
