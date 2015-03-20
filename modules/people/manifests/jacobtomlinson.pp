class people::jacobtomlinson {

  # Software
  include chrome::dev
  include firefox
  include atom
  include iterm2::stable
  include iterm2::colors::piperita

  # My Dotfiles
  $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"

  repository { $dotfiles_dir:
    source => "jacobtomlinson/dotfiles"
  }

  exec { "install dotfiles":
    cwd      => $dotfiles_dir,
    command  => "./install.sh",
    provider => shell,
    creates  => "${home}/.bashrc",
    require  => Repository[$dotfiles_dir],
  }

  # Git Completion
  package { 'bash-completion': ensure => present, }

}
