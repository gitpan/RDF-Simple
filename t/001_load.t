
# $Id: 001_load.t,v 1.4 2008/12/07 16:15:10 Martin Exp $

use blib;
use IO::CaptureOutput qw( capture );
use Test::More 'no_plan';

my $sStderr;
capture { eval "use RDF::Simple::Parser" } undef, \$sStderr;
if ($sStderr =~ m/Unable to provide required feature/)
  {
  diag(q{Your XML::SAX is not installed properly.});
  diag(q{Please use cpan (or cpanp) to install XML::SAX.});
  diag(q{Or, you could try something like this:});
  diag(qq{ln -s /usr/lib/perl/XML/SAX/ParserDetails.ini /usr/local/lib/perl/site/5.10.0/XML/SAX/ParserDetails.ini});
  BAIL_OUT(q{XML::SAX is not installed properly});
  } # if

pass;

__END__
