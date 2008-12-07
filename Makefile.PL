
# $Id: Makefile.PL,v 1.13 2008/12/07 03:49:40 Martin Exp $

use inc::Module::Install;

all_from('lib/RDF/Simple.pm');
author('Martin Thurn mthurn@cpan.org');
version(0.401);
perl_version(5.005);
license('perl');

requires('Class::MakeMethods');
test_requires('IO::CaptureOutput');
requires('LWP::UserAgent');
requires('Regexp::Common');
requires('XML::SAX');
recommends('XML::SAX::Expat');  # Need this for Solaris and Linux?
test_requires('Test::Simple');

WriteAll();

__END__
