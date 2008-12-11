
# $Id: Makefile.PL,v 1.15 2008/12/11 11:29:39 Martin Exp $

use inc::Module::Install;

all_from('lib/RDF/Simple.pm');
author('Martin Thurn mthurn@cpan.org');
version(0.403);
perl_version(5.005);
license('perl');

requires('Class::MakeMethods');
test_requires('IO::CaptureOutput');
requires('LWP::UserAgent');
requires('Regexp::Common');
requires('XML::SAX');
recommends('XML::SAX::Expat');  # Need this for Solaris and Linux?
test_requires('Test::File');
test_requires('Test::Simple');

WriteAll();

__END__
