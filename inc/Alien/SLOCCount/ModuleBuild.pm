package Alien::SLOCCount::ModuleBuild;
 
use parent 'Alien::Base::ModuleBuild';
use IPC::Open3;

sub alien_name {
  'sloccount';
}
 
sub alien_check_installed_version {
  if (`which sloccount`) {
    my $pid = open3(\*CHLD_IN, \*CHLD_OUT, \*CHLD_ERR, "sloccount", "--version");
    my $version = <CHLD_ERR>;
    return $version;
  }
  else {
    return undef;
  }
}

sub alien_bin_requires {
  {
    'Alien::Autotools' => 0,
    'Alien::flex' => 0,
  }
}

sub alien_build_commands {
  [ 'make' ];
}

sub alien_install_commands {
  [ 'mkdir -p %s/bin', 'make install PREFIX=%s' ];
}

sub alien_repository {
  {
    protocol => 'http',
    host     => 'www.dwheeler.com',
    location => '/sloccount',
    pattern  => qr/^sloccount[_-]([\d\.-]+)\.tar\.gz$/,
  };
}

1;
