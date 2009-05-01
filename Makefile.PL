
# $Id: Makefile.PL,v 1.24 2009/05/01 03:30:26 Martin Exp $

use inc::Module::Install;

all_from('lib/RDF/Simple.pm');
author('Martin Thurn mthurn@cpan.org');
version(0.412);
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

sub MY::postamble
  {
  my $ret = '';
  $ret .= <<'PART0';
coverage :
	- mkdir cover_db
	- cover -delete
	- $(MAKE) HARNESS_PERL_SWITCHES=-MDevel::Cover test
	cover
	firefox cover_db/coverage.html
PART0
  return $ret;
  } # MY::postamble

__END__
