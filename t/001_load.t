
# $Id: 001_load.t,v 1.3 2008/12/07 03:49:56 Martin Exp $

use blib;
use IO::CaptureOutput qw( capture );
use Test::More 'no_plan';

my $sStderr;
capture { eval "use RDF::Simple::Parser" } undef, \$sStderr;
if ($sStderr =~ m/Unable to provide required feature/)
  {
  diag(qq{Your XML::SAX is not installed properly.});
  diag(qq{Please use cpan (or cpanp) to install XML::SAX.});
  diag(qq{Or, you could try something like this:});
  diag(qq{ln -s /usr/lib/perl/XML/SAX/ParserDetails.ini /usr/local/lib/perl/site/5.10.0/XML/SAX/ParserDetails.ini});
  BAIL_OUT;
  } # if

pass;

__END__
