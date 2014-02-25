require 'pathname'
require 'fileutils'
require 'json'
require 'terminal-table'

module Server

  class Conf
    attr_reader :okay
    attr_accessor :config

    def initialize(opts)
      configure! if ARGV.include?('--delete-config') || !paths[:config].exist?

      # Check whether we're able to properly interact with the config
      @okay = true
      @okay = false if !paths[:sys_dir].writable?
      @okay = false if !paths[:app_dir].writable?
      @okay = false if !paths[:config].writable?

      @okay ? $Log.info("Environment ready to configure") : $Log.error("Unable to configure environment")

      check_permissions

      # Now create necessary files
      create! if !paths[:config].exist?
    end

    def paths
      {
        :config => Pathname.new(Server.config_path),
        :sys_dir => Pathname.new(Server.sys_dir),
        :app_dir => Pathname.new(Server.app_dir)
      }
    end

    def check_permissions
      $Log.debug("Checking permissions for config module")
      rows = []
      paths.each do |name, path|
        path.exist? ? exists = '✓'.green : exists = '✖'.red
        path.readable? ? readable = '✓'.green : readable = '✖'.red
        path.writable? ? writable = '✓'.green : writable = '✖'.red

        rows << [name, path, exists, readable, writable]

        # msg = "#{name} (#{path}): "
        # path.exist? ? msg = "#{msg}#{'exists ✓'.green}" : msg = "#{msg}#{'exists ✖'.red}"
        # path.readable? ? msg = "#{msg}#{', readable ✓'.green}" : msg = "#{msg}#{', readable ✖'.red}"
        # path.writable? ? msg = "#{msg}#{', writable ✓'.green}" : msg = "#{msg}#{', writable ✖'.red}"
        # $Log.info(msg)
      end

      table = Terminal::Table.new :title => "File Permissions", :headings => ['name', 'path', 'exists?', 'readable?', 'writable?'], :alignment => :center, :rows => rows
      puts table
    end

    def configure!
      delete! if ARGV.include?('--delete-config')

      $Log.info("Configuring file/folder paths")

      Step.start("Making sys_dir writable")
      FileUtils.chmod("u=wrx,go=rx", paths[:sys_dir]) if !paths[:sys_dir].exist?
      Step.complete()

      Step.start("Creating app_dir")
      FileUtils.mkdir(paths[:app_dir], :mode => 0755) if !paths[:app_dir].exist?
      Step.complete()

      Step.start("Making app_dir writable")
      FileUtils.chmod("u=wrx,go=rx", paths[:app_dir]) if !paths[:app_dir].writable?
      Step.complete()

      # Now let's see if the config file is blank. If so, it's the first
      # run and we need to create and store it.
      $Log.debug("Creating base JSON config if need be")
      create! if !read

      # $Log.debug("Config file: #{read}")
      # $Log.debug("Raw config file: #{File.read(paths[:config])}")

      return true
    end

    def read

      $Log.debug("Parsing config file: #{paths[:config]}")
      config = begin
        if paths[:config].exist? && File.size?(paths[:config])
          Logger.debug("File exists and has size: #{File.size?(paths[:config])}")
          json = File.read(paths[:config])
          JSON.parse(json) if json != ""
        else
          $Log.fatal("Can't read config.json... Did you break something?")
          return false
        end
      rescue JSON::ParserError, TypeError => e
        $Log.error("Could not parse config file: #{e.message}")
        $Log.error(e.backtrace)
      end
    end

    def write!(config)
      # $Log.debug("Writing config: #{config}")
      if !config.respond_to?("to_json")
        $Log.error("Unable to convert configuration to JSON. Is the gem installed?")
        return false
      else
        File.open(paths[:config], "w") do |f|
          f.write(config.to_json)
        end
      end
    end

    def get(item)
      #
    end

    def update(opts)
      #
    end

    def create!
      $Log.info("Creating server-gem config file")
      config = {}

      [:packages, :sys, :installed, :conf, :history, :info, :log, :signals, :vim, :ssh, :cron, :build].each do |key|
        config[key] = {}
      end

      write!(config)
    end

    def delete!
      Step.start("Deleting existing config: #{paths[:config]}")
      FileUtils.rm(paths[:config]) if paths[:config].exist?

      paths[:config].exist? ? Step.fail("Failed to delete config file") : Step.complete
    end

  end

end