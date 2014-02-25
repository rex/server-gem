require 'server/sys'
require 'server/conf'
require 'pathname'

module Server

  class << self

    attr_accessor :settings, :config_path, :config
    attr_reader :runtime_path, :sys_dir, :app_dir, :template_path, :pkg_path

    def init
      @settings = { :setting_one => "foo", :setting_two => "bar" }
      @runtime_path = File.expand_path('..', File.dirname( __FILE__ ) )
      @sys_dir = Pathname.new("/usr/local/etc")
      @app_dir = Pathname.new("#{@sys_dir}/server-gem")
      @config_path = Pathname.new("#{@app_dir}/config.json")
      @template_path = File.expand_path('./server/packages/templates/raw', File.dirname(__FILE__) )
      @pkg_path = File.expand_path('../pkg', File.dirname(__FILE__))

      @config = Server::Conf.new({
        :sys_dir => @sys_dir,
        :app_dir => @app_dir,
        :config_path => @config_path,
        :settings => @settings,
        :template_path => @template_path
      })

      Server::Sys.init
    end

  end

end