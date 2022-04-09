# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.name = "test"
  t.libs << "test"
  t.test_files = Dir['test/*test*.rb', 'test/haml_test/*test*.rb']
  t.verbose = true
end

task default: %i[]
task :run_dev_server, :port do
  sh "bundle exec rerun -- rackup -p #{:port}"
end
