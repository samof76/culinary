
# Install Java 7
package 'java-1.7.0-openjdk' do
  action :install
end

# Install Java 7 development tools
package 'java-1.7.0-openjdk-devel' do
  action :install
end

# Install Development Tools
execute 'Install Development Tools' do
  command 'yum groupinstall -y Development Tools'
  action :run
end

# Install rpm-build do
package 'rpm-build' do
  action :install
end
