#
# Cookbook Name:: netdata
# Recipe:: netdata
#
# Copyright 2016, Sambox LLP
#
# No rights reserved - Do Redistribute
case node['platform_family']
when 'rhel', 'fedora'
  ['autoconf', 'automake', 'curl', 'gcc', 'git', 'libmnl-devel', 'libuuid-devel', 'lm_sensors', 'make', 'zlib-devel', 'pkgconfig', 'nc', 'python', 'python-psycopg2', 'PyYAML'].each {
    |item| package item do
      action :install
    end
  }
when 'ubuntu', 'debian'
  ['zlib1g-dev', 'uuid-dev', 'libmnl-dev', 'gcc', 'make', 'git', 'curl', 'jq', 'nodejs', 'autoconf', 'autoconf-archive', 'autogen', 'automake', 'pkg-config'].each {
    |item| package item do
      action :install
    end
  }
end

git '/tmp/netdata' do
  repository 'https://github.com/firehol/netdata.git'
  depth 1
  revision 'master'
  action :sync
end

execute "install script" do
  command './netdata-installer.sh --dont-wait'
  cwd '/tmp/netdata'
end
