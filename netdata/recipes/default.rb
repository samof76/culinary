#
# Cookbook Name:: netdata
# Recipe:: default
#
# Copyright 2016, Sambox LLP
#
# No rights reserved - Do Redistribute

case node['platform_family']
when 'rhel', 'fedora'
  package 'epel-release' do
    action :install
  end
  execute 'repo update' do
    command 'yum update -y'
    action :run
  end
when 'ubuntu', 'debian'
  execute "update" do
    command "apt-get update"
    action :run
  end
end

include_recipe "netdata::install"
include_recipe "netdata::service"
