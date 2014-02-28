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

    def autotag!
      if [:minor, :major].include? @release_type
        `git tag -a v#{@version} -m '#{@release_type} release, version #{@version}'`
      else
        puts "Not a minor or major release. Avoiding tag.".cyan
      end
    end

    def add_all
      `git add -A`
    end

    def commit!
      `git commit -m '#{@release_type} release, version #{@version}'`
    end

    def commit_with_message(message)
      `git commit -m '#{message}'`
    end

    def push!
      `git push #{@remote} #{@branch}`
      `git push --tags`
    end
  end
end