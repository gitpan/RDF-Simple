
# $Id: Makefile.PL,v 1.7 2008/10/07 00:24:33 Martin Exp $

use inc::Module::Install;

all_from('lib/RDF/Simple.pm');
author('Martin Thurn mthurn@cpan.org');
version(0.305);
perl_version(5.005);
license('perl');

requires('LWP::UserAgent');
requires('Regexp::Common');
requires('XML::SAX' => 0.12);
test_requires('Test::Simple');

WriteAll();

__END__
