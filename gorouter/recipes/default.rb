case node['platform_family']
when 'rhel', 'fedora'
  package 'epel-release' do
    action :install
  end
  ['python-pip', 'python-devel', 'libffi-devel'].each {
    |item| package item do
      action :install
    end
  }
  execute 'Install build-essentials' do
    command 'yum groupinstall -y "Development Tools"'
    action :run
  end
when 'ubuntu', 'debian'
  ['python-pip', 'python-dev', 'libffi-dev', 'build-essential'].each {
    |item| package item do
      action :install
    end
  }
end

execute 'Pip install dependencies' do
  command 'pip install supervisor'
  action :run
end

directory '/srv/gorouter' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/srv/gorouter/etc' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/srv/gorouter/bin' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/var/log/gorouter' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

include_recipe "gorouter::gnatsd"
include_recipe "gorouter::setup"