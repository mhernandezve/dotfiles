require 'rake'

def section(title, _description = '')
  seperator_count = (80 - title.length) / 2
  puts ("\n" + '=' * seperator_count) + title.upcase + ('=' * seperator_count)
  puts '~> Performing as dry run' if ENV['DRY_RUN']
  puts '~> Performing as super user' if ENV['SUDO']
  puts '~> Performing as test env user' if ENV['TEST_ENV']
end

def testing?
  ENV['TEST_ENV']
end

def run(cmd)
  puts "~>#{cmd}"
  sh cmd unless ENV['DRY_RUN']
end

def directory_exists?(directory)
  File.directory?(directory)
end
