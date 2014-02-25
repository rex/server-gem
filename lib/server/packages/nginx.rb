require 'mustache'
require 'server/packages/templates/nginx'

module Server

  module Packages

    class Nginx

      attr_accessor :template

      def self.init
        @template = Server::Templates::Nginx.new
      end

      def self.install!(opts = {})
        self.init

        $Log.info("Installing Nginx!")
        self.render_config
        self.write_config!
      end

      def self.uninstall!(opts)
        self.init
        #
      end

      def self.configure(opts)
        self.init
        #
      end

      def self.render_config
        Step.start("Rendering config")
        @content = @template.render
        Step.complete
      end

      def self.write_config!
        return $Log.warn("Compiled template was empty") if @content == ""

        Step.start("Writing nginx template to #{Server.pkg_path}/nginx.conf")
        File.open("#{Server.pkg_path}/nginx.conf", "w") do |f|
          f.write(@content)
        end
        Step.complete
      end

    end

  end

end