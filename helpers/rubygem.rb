module Helpers
  class RubyGem
    attr_accessor :version
    attr_reader :pkg_root

    def initialize
      raise "No RubyGems API key found in environment!" if !ENV['RUBYGEMS_API_KEY']
      @api_key = ENV['RUBYGEMS_API_KEY']
      @pkg_prefix = "server-"
      @pkg_root = File.expand_path('../../pkg/', __FILE__)
      @version = nil
    end

    def explain
      puts "Built gems being stored in #{@pkg_root}"
      puts "v0.0.5.2 built gem path is #{pkg_path}"
      puts "RubyGems API key: #{@api_key}"
    end

    def pkg_path
      File.join(@pkg_root, pkg_name)
    end

    def pkg_name
      raise "No version set!" if !@version
      "#{@pkg_prefix}#{@version}.gem"
    end

    def logged_in?
      File.exists?(File.expand_path('~/.gem/credentials'))
    end

    def build!
      #
    end

    def deploy!
      if logged_in?
        puts "Uploading gem v#{@version} [#{pkg_path}]".green
        `gem push #{@pkg_path}`
      else
        puts "Not logged into RubyGems.org, skipping deploy!"
    end
  end
end