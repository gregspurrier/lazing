require 'rubygems'
require 'rspec'
require 'rspec/core/rake_task'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "lazing"
    gemspec.summary = "Making Enumerable a little lazy"
    gemspec.description = "Lazy equivalents for many of the methods in Enumerable"
    gemspec.email = "greg@rujubu.com"
    gemspec.homepage = "http://github.com/gregspurrier/lazing"
    gemspec.author = "Greg Spurrier"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

desc "Run all specs"
RSpec::Core::RakeTask.new('spec')
