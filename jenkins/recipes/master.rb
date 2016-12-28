# yum_repository 'jenkins-ci' do
#   baseurl 'http://pkg.jenkins-ci.org/redhat'
#   gpgkey  'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key'
# end

cookbook_file '/etc/yum.repos.d/jenkins-ci.repo' do
  source 'jenkins-ci.repo'
  owner 'root'
  group 'root'
  mode 00644
end

execute 'Update yum' do
  command 'yum update -y'
  action :run
end

package 'jenkins' do
  action :install
end

template '/etc/sysconfig/jenkins' do
  source   'jenkins-config-rhel.erb'
  mode     '0644'
  notifies :restart, 'service[jenkins]', :immediately
end
#end

service 'jenkins' do
  supports :status => true, :restart => true, :reload => true
  action  [:enable, :start]
end
