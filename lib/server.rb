require 'server/sys'
require 'server/conf'

module Server

  class << self

    attr_accessor :settings, :config_path
    attr_reader :runtime_path, :dir_sys, :dir_app

    def init
      @settings = { :setting_one => "foo", :setting_two => "bar" }
      @runtime_path = File.expand_path('..', File.dirname( __FILE__ ) )

      Server::Sys.init
      Server::Conf.init
    end

    def dir_sys
      "/usr/local/etc"
    end

    def dir_app
      "#{self.dir_sys}/server-gem"
    end

    def config_path
      "#{self.dir_app}/config.yaml"
    end

  end

end