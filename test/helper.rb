require 'simplecov'
require 'coveralls'
require 'rubygems'
require 'bundler'

Coveralls.wear!

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'test/unit'
require 'shoulda'

module SimpleCov::Configuration
  def clean_filters
    @filters = []
  end
end

SimpleCov.configure do
  clean_filters
  load_profile 'test_frameworks'
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

ENV["COVERAGE"] && SimpleCov.start do
  add_filter "/.rvm/"
  add_filter "/.rbenv/"
end


$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'server'

# Load all our application files to ensure that code coverage is accurate
require 'loader'

class Test::Unit::TestCase
end
