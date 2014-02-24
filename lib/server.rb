require 'server/sys'

module Server

  class << self

    attr_accessor :settings
    attr_reader :runtime_path, :dir_sys, :dir_base

    def init
      @settings = { :setting_one => "foo", :setting_two => "bar" }
      @runtime_path = File.expand_path('..', File.dirname( __FILE__ ) )

      Server::Sys.init
    end

    def dir_sys
      "/usr/local/etc"
    end

    def dir_base
      "#{self.dir_sys}/server-gem"
    end

  end

end