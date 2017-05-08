package 'epel-release' do
    action :install
end

['git','python-devel','python-pip','python-setuptools','openssl-devel','gcc','autoconf','automake','make','python34-devel','python34-setuptools','python34-pip', 'openssl','libffi-devel', 'ca-certificates'].each do |p|
    package p do
        action :install
    end
end

execute 'create symlink for ca-certificates' do
  command ' ln -s /etc/pki/tls/certs/ca-bundle.crt /etc/ssl/certs/ca-certificates.crt'
  not_if { ::File.exist?('/etc/ssl/certs/ca-certificates.crt') }
  action :run
end


execute 'install errbot' do
  command 'pip3 install errbot'
  action :run
end

execute 'pip install dependencis' do
  command 'pip3 install sleekxmpp pyasn1 pyasn1-modules hypchat'
  action :run
end


execute 'install supervisord' do
  command 'pip install supervisor'
  action :run
end

user 'errbot' do
  comment 'errbot system user'
  system true
  shell '/bin/false'
end

directory '/opt/errbot' do
  owner 'errbot'
  group 'errbot'
  mode '0755'
  recursive true
  action :create
end

directory '/opt/errbot/plugins' do
  owner 'errbot'
  group 'errbot'
  mode '0755'
  recursive true
  action :create
end

directory '/opt/errbot/data' do
  owner 'errbot'
  group 'errbot'
  mode '0755'
  action :create
end

template '/opt/errbot/config.py' do
  source 'config.py.erb'
  owner 'errbot'
  group 'errbot'
  mode '0644'
  action :create
end

template '/etc/supervisord.conf' do
  source 'supervisord.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  notifies :run, 'execute[run supervisord]', :immediately
end

execute 'run supervisord' do
  not_if 'pgrep supervisord'
  command 'supervisord -c /etc/supervisord.conf'
  action :run
end
