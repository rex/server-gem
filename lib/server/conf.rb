require 'pathname'
require 'fileutils'
require 'yaml'

module Server

  class Conf
    attr_reader :okay

    def self.init
      self.check_permissions

      # Check whether we're able to properly interact with the config
      @okay = true
      @okay = false if !self.configure!
      @okay = false if !self.paths[:sys_dir].writable?
      @okay = false if !self.paths[:app_dir].writable?
      @okay = false if !self.paths[:config].writable?

      @okay ? $Log.info("Environment ready to configure") : $Log.error("Unable to configure environment")

      # Now create necessary files
      self.create! if !self.paths[:config].exist?
    end

    def self.paths
      {
        :config => Pathname.new(Server.config_path),
        :sys_dir => Pathname.new(Server.dir_sys),
        :app_dir => Pathname.new(Server.dir_app)
      }
    end

    def self.check_permissions
      $Log.debug("Checking permissions for config module")
      self.paths.each do |name, path|
        path.exist? ? $Log.info("#{name} (#{path}) exists") : $Log.warn("#{name} (#{path}) does not exist")
        path.readable? ? $Log.info("#{name} (#{path}) is readable") : $Log.warn("#{name} (#{path}) is not readable")
        path.writable? ? $Log.info("#{name} (#{path}) is writable") : $Log.warn("#{name} (#{path}) is not writable")
      end
    end

    def self.configure!
      self.delete! if ARGV.include?('--delete-config')

      $Log.info("Configuring file/folder paths")
      $Log.debug("Making sys_dir writable")
      FileUtils.chmod("u=wrx,go=rx", self.paths[:sys_dir]) if !self.paths[:sys_dir].exist?
      $Log.debug("Creating app_dir")
      FileUtils.mkdir(self.paths[:app_dir], :mode => 0755) if !self.paths[:app_dir].exist?
      $Log.debug("Making app_dir writable")
      FileUtils.chmod("u=wrx,go=rx", self.paths[:app_dir]) if !self.paths[:app_dir].writable?
      $Log.debug("Creating config file")
      FileUtils.touch(self.paths[:config]) if !self.paths[:config].exist?

      # Now let's see if the config file is blank. If so, it's the first
      # run and we need to create and store it.
      $Log.debug("Creating base YAML config if need be")
      puts("Config file: #{self.read}")
      self.create! if self.read == false

      $Log.debug("Config file: #{self.read}")
      $Log.debug("Raw config file: #{File.read(self.paths[:config])}")

      return true
    end

    def self.read
      config = begin
        YAML.load( File.open(self.paths[:config]) ) if self.paths[:config].exist?
      rescue ArgumentError => e
        $Log.error("Could not parse config file: #{e.message}")
      end
    end

    def self.write!(config)
      $Log.debug("Writing config: #{config}")
      if !config.respond_to?("to_yaml")
        $Log.error("Unable to convert configuration to YAML. Is the gem installed?")
        return false
      else
        File.open(self.paths[:config], "w") do |f|
          f.write(config.to_yaml)
        end
      end
    end

    def self.get(item)
      #
    end

    def self.create!
      $Log.info("Creating server-gem config file")
      self.write!({ :package => "server", :name => "Pierce", :thingy => "Other thingy!" })
    end

    def self.delete!
      # $Log.info("Removing #{self.paths[:app_dir]}")
      # FileUtils.remove_dir(self.paths[:app_dir]) if self.paths[:app_dir].exist?
      $Log.info("Deleting existing config: #{self.paths[:config]}")
      FileUtils.rm(self.paths[:config]) if self.paths[:config].exist?

      $Log.debug("New config: #{self.read}")
    end

  end

end