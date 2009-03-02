
# $Id: Makefile.PL,v 1.17 2009/03/02 00:35:45 Martin Exp $

use inc::Module::Install;

all_from('lib/RDF/Simple.pm');
author('Martin Thurn mthurn@cpan.org');
version(0.405);
perl_version(5.005);

requires('Class::MakeMethods');
test_requires('IO::CaptureOutput');
requires('LWP::UserAgent');
requires('Regexp::Common');
requires('XML::SAX');
recommends('XML::SAX::Expat');  # Need this for Solaris and Linux?
test_requires('Test::File');
test_requires('Test::Simple');

WriteAll;

__END__
