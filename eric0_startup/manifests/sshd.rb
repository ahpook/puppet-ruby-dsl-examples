# Puppet DSL equivalents are inline before equivalent Puppet Ruby DSL constructs

# class eric0_startup::sshd {

# the class names can be strings or symbols
hostclass 'eric0_startup::sshd' do

  # this uses the comma separated argument style

  # service {'sshd': ensure => running, enable => true }
  service "sshd",
    :ensure => :running,
    :enable => :true,
    :subscribe => File['/etc/ssh/sshd_config']

  package "openssh-server",
    :ensure => :latest,
    :notify => Service["sshd"]

  file '/etc/ssh/sshd_config',
    :ensure => :present,
    :content => template('eric0_startup/sshd_config.erb')

end
