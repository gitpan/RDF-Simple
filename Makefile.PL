
# $Id: Makefile.PL,v 1.22 2009/04/09 13:42:56 Martin Exp $

use inc::Module::Install;

all_from('lib/RDF/Simple.pm');
author('Martin Thurn mthurn@cpan.org');
version(0.409);
perl_version(5.005);

requires('Class::MakeMethods');
requires('File::Slurp');
test_requires('IO::CaptureOutput');
requires('LWP::UserAgent');
requires('Regexp::Common');
test_requires('Test::File');
test_requires('Test::Simple');
requires('URI::Escape');
requires('XML::SAX');
recommends('XML::SAX::Expat');  # Need this for Solaris and Linux?

WriteAll;

__END__
