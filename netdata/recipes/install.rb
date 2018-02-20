#
# Cookbook Name:: netdata
# Recipe:: netdata
#
# Copyright 2016, Sambox LLP
#
# No rights reserved - Do Redistribute
# zlib1g-dev uuid-dev libmnl-dev gcc make git autoconf autoconf-archive autogen automake pkg-config curl
# autoconf automake curl gcc git libmnl-devel libuuid-devel lm-sensors make MySQL-python nc pkgconfig python python-psycopg2 PyYAML zlib-devel 
case node['platform_family']
when 'rhel', 'fedora'
  ['autoconf', 'automake', 'curl', 'gcc', 'git', 'libmnl-devel', 'libuuid-devel', 'make', 'MySQL-python', 'zlib-devel', 'pkgconfig', 'nc', 'python', 'python-psycopg2', 'PyYAML'].each {
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

bash 'install netdata' do
  code <<-EOH
  wget https://my-netdata.io/kickstart.sh
  bash kickstart.sh all --dont-wait
  EOH
  cwd '/tmp'
  action :run
end
