module Helpers
  class Git
    attr_accessor :remote, :branch, :release_type, :version

    def initialize
      @remote = :origin
      @branch = current_branch?
      @release_type = :build
      @version = nil
    end

    def explain
      puts "Remote: #{@remote}"
      puts "Current branch: #{@branch}"
      puts "Version: #{@version}"
      puts "Release type: #{@release_type}"
    end

    def clean_working_dir?
      #
    end

    def current_branch?
      local_branches = `git branch`
      current_branch = /(\* )(.*)/.match(local_branches)[2]
      if current_branch
        return current_branch
      else
        raise "Not on a git branch! Something is wrong!"
      end
    end

    def deploy!
      raise "No version provided to deploy!" if !@version
      add_all
      commit!
      autotag!
      push!
    end

    def autotag!(version)
      `git tag -a v#{@version} -m '#{@release_type} release, version #{@version}'`
    end

    def add_all
      `git add -A`
    end

    def commit!
      `git commit -m '#{@release_type} release, version #{@version}'`
    end

    def push!(opts = {})
      `git push #{@remote} #{@branch}`
      `git push --tags`
    end
  end
end