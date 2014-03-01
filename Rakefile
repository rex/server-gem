# encoding: utf-8
# ..

require_relative 'lib/server/colorizer'
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

require_relative 'helpers/version'
require_relative 'helpers/git'
require_relative 'helpers/rubygem'

Version = Helpers::Version.new
GitHelper = Helpers::Git.new
RubyGem = Helpers::RubyGem.new

task :commit, [:message] do |t, args|
  # puts "Commit message: #{args[:message]}"
  Version.bump(:build)
  GitHelper.add_all
  GitHelper.commit_with_message args[:message]
  GitHelper.push!
end

namespace :deploy do
  desc "Git stuff"
  task :git do
    puts "Current branch is '#{GitHelper.current_branch?}'"
    puts "Curl enabled? #{RubyGem.curl_enabled?}"
    GitHelper.release_type = :patch
    GitHelper.version = Version.to_s
    RubyGem.version = Version.to_s
    Version.explain
    GitHelper.explain
    RubyGem.explain
  end

  desc "Bump build number"
  task :build => ['simplecov'] do
    Version.bump(:build)
  end

  desc "Release an patch version"
  task :patch => ['simplecov'] do
    Version.bump(:patch)
    GitHelper.release_type = :patch
    Rake::Task['deploy:go'].execute
  end

  desc "Release a minor version"
  task :minor => ['simplecov'] do
    Version.bump(:minor)
    GitHelper.release_type = :minor
    Rake::Task['deploy:go'].execute
  end

  desc "Release a major version"
  task :major => ['simplecov'] do
    Version.bump(:major)
    GitHelper.release_type = :major
    Rake::Task['deploy:go'].execute
  end

  task :go do
    Rake::Task['build'].execute
    RubyGem.version = Version.to_s
    RubyGem.deploy!
    GitHelper.version = Version.to_s
    GitHelper.deploy!
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