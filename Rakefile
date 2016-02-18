require "bundler/gem_tasks"
require "rake/extensiontask"

task :build => :compile

Rake::ExtensionTask.new("segv_silencer") do |ext|
  ext.lib_dir = "lib/segv_silencer"
end

task :default => [:clobber, :compile, :spec]
