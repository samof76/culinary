
default['jenkins'].tap do |jenkins|
  jenkins['java'] = if node['java'] && node['java']['java_home']
                      File.join(node['java']['java_home'], 'bin', 'java')
                    elsif node['java'] && node['java']['home']
                      File.join(node['java']['home'], 'bin', 'java')
                    elsif ENV['JAVA_HOME']
                      File.join(ENV['JAVA_HOME'], 'bin', 'java')
                    else
                      'java'
                    end
end

default['jenkins']['master'].tap do |master|
  master['user'] = 'jenkins'
  master['group'] = 'jenkins'
  master['host'] = 'localhost'
  master['port'] = '8080'
  master['home'] = '/var/lib/jenkins'
  master['log_directory'] = '/var/log/jenkins'
  master['jvm_options'] = nil
  master['jenkins_args'] = nil
end
