# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "server"
  # gem.version = "0.0.4"
  gem.homepage = "http://github.com/rex/server-gem"
  gem.license = "MIT"
  gem.summary = "Manage servers in a really awesome way. Like a boss. NOTE: This doesn't do much of anything yet. In a few days I should have a much more awesome feature set live."
  gem.description = "PRE-ALPHA RELEASE! This gem is a work in progress that will soon allow for much easier management of servers and performance of various server administration tasks."
  gem.email = "me@prex.io"
  gem.authors = ["Pierce Moore"]
  gem.required_ruby_version = '>= 1.9.3'
  gem.require_paths = ["lib"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['test'].execute
end

namespace :version do
  namespace :bump do
    desc "Bumps build number, respecting major/minor/patch"
    task :build do
      raw_version = File.read("VERSION")
      version = raw_version.strip.split('.')
      puts "Version: #{version}"

      major, minor, patch, build = version[0].to_i, version[1].to_i, version[2].to_i, (version[3].to_i || 0)

      puts "Major: #{major}, minor: #{minor}, patch: #{patch}, build: #{build}"

      case ENV['TYPE']
      when 'major'
        major += 1
        minor = 0
        patch = 0
      when 'minor'
        minor += 1
        patch = 0
      when 'patch'
        patch += 1
      end

      build += 1

      ENV['MAJOR']=major.to_s
      ENV['MINOR']=minor.to_s
      ENV['PATCH']=patch.to_s
      ENV['BUILD']=build.to_s
      Rake::Task['version:write'].execute

      Rake::Task['version'].execute
    end
  end
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "server #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
