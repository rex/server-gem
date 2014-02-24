require 'rbconfig'
require 'pathname'

module Server

  class Sys

    def self.init
      self.running_on_windows?
      self.running_as_sudo?
      self.sysdir_writable?
    end

    def self.running_on_windows?
      if RbConfig::CONFIG['host_os'] =~ /mswin|windows|cygwin/i
        $Log.fatal("This gem and its tools are currently useless for Windows users. Maybe someday...")
        abort()
      end
    end

    def self.running_as_sudo?
      if( Process.euid == 0 )
        $Log.fatal("Cowardly avoiding sudo. Re-run without sudo.")
        abort()
      end
    end

    def self.sysdir_writable?
      sysdir = Pathname.new(Server.dir_sys)

      $Log.info("#{sysdir} is writable") if sysdir.writable?
      $Log.fatal("#{sysdir} is not writable!") if !sysdir.writable?
      abort() if !sysdir.writable?

      sysdir.writable?
    end

  end

end