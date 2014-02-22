Gem::Specification.new do |s|
  s.name = "server"
  s.version = "0.0.2"
  s.date = "2014-02-22"
  s.summary = "Manage servers in a really awesome way. Like a boss."
  s.authors = ["Pierce Moore"]
  s.email = "me@prex.io"
  s.files = Dir.glob("lib/**/*") + %w{LICENSE README.md}
  s.homepage = "http://rubygems.org/gems/server"
  s.metadata = { "github" => "https://github.com/rex/server-gem" }
  s.license = "MIT"
  s.executables = ['server']
end