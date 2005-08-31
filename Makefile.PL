use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'RDF::Simple',
    VERSION_FROM => 'lib/RDF/Simple.pm', # finds $VERSION
    AUTHOR       => 'Jo Walsh (jo@london.pm.org)',
    ABSTRACT     => '',
    PREREQ_PM    => {
                     'Test::Simple' => 0.44,
		     'XML::SAX' => 0.12,
		     'Template' => 2.00,
		     'Class::MethodMaker' => 1.00,
                    },
);
