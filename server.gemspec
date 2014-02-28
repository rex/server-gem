# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: server 0.0.5.2 ruby lib

Gem::Specification.new do |s|
  s.name = "server"
  s.version = "0.0.5.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Pierce Moore"]
  s.date = "2014-02-28"
  s.description = "PRE-ALPHA RELEASE! This gem is a work in progress that will soon allow for much easier management of servers and performance of various server administration tasks."
  s.email = "me@prex.io"
  s.executables = ["server"]
  s.extra_rdoc_files = [
    "LICENSE",
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".coveralls.yml",
    ".document",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "apple_logger_test.rb",
    "bin/server",
    "lib/server.rb",
    "lib/server/cli.rb",
    "lib/server/colorizer.rb",
    "lib/server/conf.rb",
    "lib/server/installed.rb",
    "lib/server/log.rb",
    "lib/server/packages/nginx.rb",
    "lib/server/packages/phpfpm.rb",
    "lib/server/packages/templates/nginx.rb",
    "lib/server/packages/templates/raw/haproxy.cfg.template",
    "lib/server/packages/templates/raw/memcached.conf.template",
    "lib/server/packages/templates/raw/nginx.conf.template",
    "lib/server/packages/templates/raw/php.ini.template",
    "lib/server/packages/templates/raw/phpfpm.conf.template",
    "lib/server/packages/templates/raw/redis.conf.template",
    "lib/server/packages/templates/renderer.rb",
    "lib/server/signals.rb",
    "lib/server/step.rb",
    "lib/server/sys.rb",
    "lib/server/workflows/db.rb",
    "lib/server/workflows/web.rb",
    "test/helper.rb",
    "test/loader.rb",
    "test/test_logger.rb",
    "test/test_server.rb",
    "test/test_templates.rb"
  ]
  s.homepage = "http://github.com/rex/server-gem"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.2.2"
  s.summary = "Manage servers in a really awesome way. Like a boss. NOTE: This doesn't do much of anything yet. In a few days I should have a much more awesome feature set live."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, [">= 0.17.1"])
      s.add_runtime_dependency(%q<highline>, [">= 1.5.1"])
      s.add_runtime_dependency(%q<mustache>, ["~> 0.99.4"])
      s.add_runtime_dependency(%q<terminal-table>, [">= 0"])
      s.add_runtime_dependency(%q<ruby-progressbar>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<shoulda>, [">= 3.0"])
      s.add_development_dependency(%q<rdoc>, [">= 4.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0.8.0"])
    else
      s.add_dependency(%q<thor>, [">= 0.17.1"])
      s.add_dependency(%q<highline>, [">= 1.5.1"])
      s.add_dependency(%q<mustache>, ["~> 0.99.4"])
      s.add_dependency(%q<terminal-table>, [">= 0"])
      s.add_dependency(%q<ruby-progressbar>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<shoulda>, [">= 3.0"])
      s.add_dependency(%q<rdoc>, [">= 4.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_dependency(%q<simplecov>, [">= 0.8.0"])
    end
  else
    s.add_dependency(%q<thor>, [">= 0.17.1"])
    s.add_dependency(%q<highline>, [">= 1.5.1"])
    s.add_dependency(%q<mustache>, ["~> 0.99.4"])
    s.add_dependency(%q<terminal-table>, [">= 0"])
    s.add_dependency(%q<ruby-progressbar>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<shoulda>, [">= 3.0"])
    s.add_dependency(%q<rdoc>, [">= 4.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    s.add_dependency(%q<simplecov>, [">= 0.8.0"])
  end
end

