require 'server/sys'
require 'server/conf'

module Server

  class << self

    attr_accessor :settings, :config_path, :config
    attr_reader :runtime_path, :sys_dir, :app_dir

    def init
      @settings = { :setting_one => "foo", :setting_two => "bar" }
      @runtime_path = File.expand_path('..', File.dirname( __FILE__ ) )
      @sys_dir = "/usr/local/etc"
      @app_dir = "#{@sys_dir}/server-gem"
      @config_path = "#{@app_dir}/config.json"

      @config = Server::Conf.new({
        :sys_dir => @sys_dir,
        :app_dir => @app_dir,
        :config_path => @config_path,
        :settings => @settings
      })

      Server::Sys.init
    end

  end

end