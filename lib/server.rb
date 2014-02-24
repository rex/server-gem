module Server

  class << self

    attr_accessor :settings
    attr_reader :runtime_path

    autoload :CLI,            'server/cli'
    autoload :Conf,           'server/conf'
    autoload :Installed,      'server/installed'
    autoload :Sys,            'server/sys'

    def init
      @settings = { :setting_one => "foo", :setting_two => "bar" }
      @runtime_path = File.expand_path('..', File.dirname( __FILE__ ) )
    end

  end

end