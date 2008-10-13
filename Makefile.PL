
# $Id: Makefile.PL,v 1.9 2008/10/13 21:11:21 Martin Exp $

use inc::Module::Install;

all_from('lib/RDF/Simple.pm');
author('Martin Thurn mthurn@cpan.org');
version(0.306);
perl_version(5.005);
license('perl');

requires('LWP::UserAgent');
requires('Regexp::Common');
requires('XML::SAX' => 0.96);
test_requires('Test::Simple');

WriteAll();

__END__
