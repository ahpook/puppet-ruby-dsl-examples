# Puppet DSL equivalents are inline before equivalent Puppet Ruby DSL constructs

# class eric0_startup::sshd {

# the class names can be strings or symbols
hostclass 'eric0_startup::sshd' do

  # this uses the comma separated argument style
  file '/etc/ssh/sshd_config',
    :ensure => :present,
    :content => template('eric0_startup/sshd_config.erb')

  # the dependent resource needs to be a quoted string
  # otherwise it gets immediately searched and fails.
  package "openssh-server",
    :ensure => :latest,
    :notify => "Service[sshd]"

  # likewise, without quoting File, the DSL attempts
  # execute File[] ...
  service "sshd",
    :ensure => :running,
    :enable => :true,
    :subscribe => "File[/etc/ssh/sshd_config]"

  # this will actually run Kernel.exec on the master
  exec "/do/not/bin/echo 'hi there'",
    :provider => :shell

end
