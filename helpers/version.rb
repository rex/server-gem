module Helpers
  class Version
    attr_reader :version, :version_string, :file_path
    attr_accessor :major, :minor, :patch, :build

    def initialize
      @file_path = File.expand_path("../../VERSION", __FILE__)
      init_version
    end

    def explain
      puts "Version file path is #{@file_path}"
      puts @version
    end

    def major
      @version[:major]
    end

    def minor
      @version[:minor]
    end

    def patch
      @version[:patch]
    end

    def build
      @version[:build]
    end

    def to_s
      [major, minor, patch, build].compact.join('.')
    end

    def init_version
      if File.exists?(@file_path)
        set_version File.read(@file_path)
      else
        raise "No VERSION file found"
      end
    end

    def bump(type)
      case type
      when :major
        @version[:major] += 1
        @version[:minor] = 0
        @version[:patch] = 0
      when :minor
        @version[:minor] += 1
        @version[:patch] = 0
      when :patch
        @version[:patch] += 1
      end
      @version[:build] += 1
      puts "Version bumped to #{to_s} (#{type})"
      save!
    end

    def set_version(version_string)
      version = version_string.strip.split('.')
      @version = {
        :major => version[0].to_i,
        :minor => version[1].to_i,
        :patch => version[2].to_i,
        :build => (version[3].to_i || 0)
      }
    end

    def save!
      File.open(@file_path, 'w') do |f|
        f.write to_s
      end
      puts "Updated version file"
    end
  end
end