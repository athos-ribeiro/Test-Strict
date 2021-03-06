use strict;
use warnings;

use ExtUtils::MakeMaker;
my %conf = (
	NAME         => "Test::Strict",
	AUTHOR       => 'Pierre Denis <pdenis@cpan.org>',
	VERSION_FROM => 'lib/Test/Strict.pm',
	ABSTRACT_FROM => 'lib/Test/Strict.pm',
	PREREQ_PM    => {
		'Test::Builder' => 0.01,
		'File::Spec'    => 0.01,
		'FindBin'       => 0.01,
		'File::Find'    => 0.01,
		'Devel::Cover'  => 0.43,
		'File::Temp'    => 0.01,
	},
);

if (eval { ExtUtils::MakeMaker->VERSION(6.3002) }) {
	$conf{LICENSE} = 'perl';
}

if (eval { ExtUtils::MakeMaker->VERSION(6.46) }) {
	$conf{META_MERGE} = {
		'meta-spec' => { version => 2 },
		resources => {
			repository => {
				type       => 'git',
				url        => 'http://github.com/szabgab/Test-Strict.git',
				web        => 'http://github.com/szabgab/Test-Strict',
				license    => 'http://dev.perl.org/licenses/',
			},
			bugtracker => {
				web => 'http://github.com/szabgab/Test-Strict',
			},
		},
		x_contributors => [
			'Gabor Szabo <szabgab@cpan.org>',
			'Peter Vereshagin <veresc@cpan.org>',
			'Graham Knop <haarg@cpan.org>',
		],
	};
}

my %configure_requires = (
	'ExtUtils::MakeMaker' => '6.64',
);
my %build_requires = ();
my %test_requires = (
	'Test::More'      => '1.00',

	'File::Temp' => '0.01',
);

###   merging data "standard code"
if (eval { ExtUtils::MakeMaker->VERSION(6.52) }) {
	$conf{CONFIGURE_REQUIRES} = \%configure_requires;
} else {
	%{ $conf{PREREQ_PM} } = (%{ $conf{PREREQ_PM} }, %configure_requires);
}

if (eval { ExtUtils::MakeMaker->VERSION(6.5503) }) {
	$conf{BUILD_REQUIRES} = \%build_requires;
} else {
	%{ $conf{PREREQ_PM} } = (%{ $conf{PREREQ_PM} }, %build_requires);
}
if (eval { ExtUtils::MakeMaker->VERSION(6.64) }) {
	$conf{TEST_REQUIRES} = \%test_requires;
} else {
	%{ $conf{PREREQ_PM} } = (%{ $conf{PREREQ_PM} }, %test_requires);
}


WriteMakefile(%conf);

