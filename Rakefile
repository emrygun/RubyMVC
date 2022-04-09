# frozen_string_literal: true

require "bundler/gem_tasks"
task default: %i[]
task :run_dev_server, :port do
  sh "bundle exec rerun -- rackup -p #{:port}"
end
