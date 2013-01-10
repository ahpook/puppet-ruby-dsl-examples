# Puppet DSL equivalents are inline before equivalent Puppet Ruby DSL constructs

# class eric0_startup::motd {
hostclass :'eric0_startup::motd' do

  workdir = "/etc"

  # file { "/tmp/${workdir}": ensure => directory }
  file "/tmp/#{workdir}" do |f|
    f.ensure = :directory
  end

  # file { [ "${workdir}/motd", "/tmp/${workdir}/motd_copy" ] :
  file "#{workdir}/motd", "/tmp/#{workdir}/motd_copy" do |f|
    # ensure => present, content => "...", [ .. ]
    f.ensure  = :present
    f.content = "Welcome to Puppet, via the Puppet Ruby DSL!\n"
  end
end
