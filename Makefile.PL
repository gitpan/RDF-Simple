
# $Id: Makefile.PL,v 1.20 2009/04/08 20:55:07 Martin Exp $

use inc::Module::Install;

all_from('lib/RDF/Simple.pm');
author('Martin Thurn mthurn@cpan.org');
version(0.408);
perl_version(5.005);

requires('Class::MakeMethods');
test_requires('IO::CaptureOutput');
requires('LWP::UserAgent');
requires('Regexp::Common');
requires('URI::Escape');
requires('XML::SAX');
recommends('XML::SAX::Expat');  # Need this for Solaris and Linux?
test_requires('Test::File');
test_requires('Test::Simple');

WriteAll;

__END__
