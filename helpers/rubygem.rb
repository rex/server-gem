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

    def curl_enabled?
      `which curl`.strip != ""
    end

    def build!
      #
    end

    def deploy!
      raise "CURL needs to be enabled to push built gems!" if !curl_enabled?
      `curl --data-binary @#{pkg_path} -H 'Authorization:#{@api_key}' https://rubygems.org/api/v1/gems`
    end
  end
end