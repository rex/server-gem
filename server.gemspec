Gem::Specification.new do |gem|
  gem.name = "server"
  gem.version = "0.0.4"
  gem.date = "2014-02-22"
  gem.summary = "Manage servers in a really awesome way. Like a boss. NOTE: This doesn't do much of anything yet. In a few days I should have a much more awesome feature set live."
  gem.description = "This gem is a work in progress that will soon allow for much easier management of servers and performance of various server administration tasks."
  gem.authors = ["Pierce Moore"]
  gem.email = "me@prex.io"
  gem.files = Dir.glob("lib/**/*") + %w{LICENSE README.md}
  gem.homepage = "http://rubygems.org/gems/server"
  gem.metadata = { "github" => "https://github.com/rex/server-gem" }
  gem.license = "MIT"
  gem.executables = ['server']
  gem.required_ruby_version = '>= 1.9.3'
end