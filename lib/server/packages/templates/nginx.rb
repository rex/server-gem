require 'mustache'

module Server

  module Templates

    class Nginx < Mustache

      self.template_file = "#{Server.template_path}/nginx.conf.template"

      def servers
        [
          {
            :ip => '192.168.0.1',
            :hostname => 'web01.prex.io',
            :nickname => 'web-01'
          },
          {
            :ip => '192.168.0.2',
            :hostname => 'web02.prex.io',
            :nickname => 'web-02'
          },
          {
            :ip => '192.168.0.3',
            :hostname => 'web03.prex.io',
            :nickname => 'web-03'
          }
        ]
      end

      def name
        "That One Guy"
      end

    end

  end

end