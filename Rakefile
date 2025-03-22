# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'minitest/test_task'

Minitest::TestTask.create

task default: %i[test cucumber]

desc 'run cucumber features'
task :cucumber do
  sh 'bundle exec cucumber'
end
