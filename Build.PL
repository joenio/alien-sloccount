use strict;
use lib 'inc';
use Alien::SLOCCount::ModuleBuild;
 
my $builder = Alien::SLOCCount::ModuleBuild->new(
  module_name => 'Alien::SLOCCount',
  dist_abstract => 'Build and make available the sloccount tool',
  configure_requires => {
    'Module::Build' => 0.42,
    'Alien::Base::ModuleBuild' => 0,
  },
  requires => {
    'Alien::Base' => 0,
  },
  dist_author => 'Joenio Costa <joenio@joenio.me>',
  license => 'perl',
  meta_merge => {
    resources => {
      repository => 'http://github.com/joenio/alien-sloccount'
    }
  },
);
 
$builder->create_build_script;
