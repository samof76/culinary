# Download hbase binary
remote_file '/tmp/hbase-1.2.4-bin.tar.gz' do
  source 'http://www.apache.org/dist/hbase/1.2.4/hbase-1.2.4-bin.tar.gz'
  owner 'root'
  group 'root'
  checksum '012d506796e28537cdf6e7cf512dc3b6b3c562e2863ca0ec5d48722bffdd265e'
end

# Untar the tarball
execute 'Untar the HBase' do
  command 'tar -xvzf hbase-1.2.4-bin.tar.gz -C /opt/hbase-1.2.4'
  cwd '/tmp'
  action :run
end

template '/opt/hbase-1.2.4/conf/hbase-env.sh' do
  source 'hbase-env.sh.erb'
  owner 'root'
  group 'root'
  mode 00744
end

template '/opt/hbase-1.2.4/conf/hbase-site.xml' do
  source 'hbase-site.xml.erb'
  owner 'root'
  group 'root'
  mode 00744
end

# Start HBase and services
execute 'Start HBase and services' do
  command './bin/start-hbase.sh'
  cwd '/opt/hbase-1.2.4'
  action :run
end
