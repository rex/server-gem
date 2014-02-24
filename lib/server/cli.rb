#!/usr/bin/env ruby

require 'thor'
require 'highline/import'
# require 'server/installed'
# require 'server/conf'
# require 'server/sys'
# require 'server/workflows/web'
# require 'server/workflows/db'
require 'server'

module Server

  class CLI < Thor

    class_option :info, :type => :boolean, :aliases => "-v", :desc => "Enable info logging"
    class_option :verbose, :type => :boolean, :aliases => "-vv", :desc => "Enable verbose logging"
    class_option :quiet, :type => :boolean, :aliases => "-q", :desc => "Silence all non-error logging"
    class_option :expanded, :type => :boolean, :aliases => "-e", :desc => "Make logging output more roomy and easy to read"

    no_commands do
      def self.explain
        $Log.info( "Server runtime path: #{Server.runtime_path}" )
        $Log.info( "Server settings: #{Server.settings}" )
      end
    end

    desc "build", "Build a general server type"
    def build
      choose do |menu|

        menu.prompt = "What type of server is this going to be?"

        menu.choice(:web) { Workflows::Web.start! }
        menu.choice(:db) { Workflows::Db.start! }

      end
    end

    desc "install", "Installs and configures packages"
    def install
      $Log.info( "Installing" )
    end

    desc "configure", "Change the configuration of an existing package"
    def configure
      $Log.info( "Configuring" )
    end

    desc "server", "Change general server/machine settings"
    def server
      $Log.info( "Server settings" )
    end

    desc "ssh", "Manage authorized SSH keys"
    def ssh
      $Log.info( "SSH keys" )
    end

    desc "stats", "View statistics for this machine"
    def stats
      $Log.info( "Machine stats" )
    end

    desc "info", "Displays information about this machine"
    def info
      $Log.info( "Nginx path: #{Conf::nginx_path}" )
      $Log.info( "PHP-FPM path: #{Conf::phpfpm_path}" )
      $Log.info( "Yum package manager available" ) if Installed::yum?
      $Log.info( "Brew package manager available" ) if Installed::brew?
      $Log.info( "PHP-FPM installed" ) if Installed::phpfpm?
      $Log.info( "Nginx installed" ) if Installed::nginx?
    end

  end

end