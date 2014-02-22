#!/usr/bin/env ruby

require 'highline/import'

module Workflows

  class Web

    def self.start!
      puts "Starting web workflow"

      server_nickname = ask("What is the name of this server? ")
      puts "Server nickname: #{server_nickname}"
    end

  end

end