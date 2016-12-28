# Setup Hbase Tables
execute 'Setup table on hbase' do
  command 'env COMPRESSION=NONE HBASE_HOME=/opt/hbase-1.2.4 ./src/create_table.sh'
  cwd '/tmp/opentsdb-git'
  action :run
end

template '/etc/opentsdb/opentsdb.conf' do
  source 'opentsdb.conf.erb'
  owner 'root'
  group 'root'
  mode 00744
  notifies :restart, 'service[opentsdb]', :immediately
end

service 'opentsdb' do
  supports :status => :true, :restart => :true, :reload => :true
  action [ :enable, :start ]
end
