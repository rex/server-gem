#!/usr/bin/env ruby

require 'thor'
require 'highline/import'
require_relative 'classes/installed'
require_relative 'classes/conf'
require_relative 'classes/sys'
require_relative 'workflows/web'
require_relative 'workflows/db'

class Server < Thor
  include Workflows

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
    puts "Installing"
  end

  desc "configure", "Change the configuration of an existing package"
  def configure
    puts "Configuring"
  end

  desc "server", "Change general server/machine settings"
  def server
    puts "Server settings"
  end

  desc "ssh", "Manage authorized SSH keys"
  def ssh
    puts "SSH keys"
  end

  desc "stats", "View statistics for this machine"
  def stats
    puts "Machine stats"
  end

  desc "info", "Displays information about this machine"
  def info
    puts "Nginx path: #{Conf::nginx_path}"
    puts "PHP-FPM path: #{Conf::phpfpm_path}"
    puts "Yum package manager available" if Installed::yum?
    puts "Brew package manager available" if Installed::brew?
    puts "PHP-FPM installed" if Installed::phpfpm?
    puts "Nginx installed" if Installed::nginx?
  end

end

Server.start(ARGV)