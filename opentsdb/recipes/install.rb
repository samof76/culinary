# Git clone the repo
git '/tmp/opentsdb-git' do
  repository 'https://github.com/OpenTSDB/opentsdb.git'
  reference 'master'
  action :sync
end

# Build the rpm

execute 'Build the rpm' do
  command 'sh build.sh rpm'
  cwd '/tmp/opentsdb-git'
  action :run
end

# Run setup

execute 'Run the yum install opentsdb' do
  command 'yum install -y opentsdb*.rpm'
  cwd '/tmp/opentsdb-git/build'
  action :run
end
