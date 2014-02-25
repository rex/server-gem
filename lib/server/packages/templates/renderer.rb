require 'mustache'

module Server

  module Templates

    class Renderer

      def self.template_path
        File.expand_path('raw', __FILE__)
      end

      def self.render(opts)
        #
      end

    end

  end

end