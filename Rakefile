require "rake/clean"
require "rspec/core/rake_task"
require "puppet-lint/tasks/puppet-lint"

CLOBBER.include %w(.yardoc doc pkg)
task :default => :spec

desc "Build Puppet module"
task :build do
  sh "puppet module build ."
end

RSpec::Core::RakeTask.new :spec do |t|
  t.pattern = "spec/**/*_spec.rb"
end

task :default => :spec
