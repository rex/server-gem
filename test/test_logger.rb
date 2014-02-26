require 'helper'
require 'server/log'

class TestLogger < Test::Unit::TestCase

  context "Logger" do
    setup do
      @logger = Server::Log.new(StringIO.new)
    end

    should "log a debug message" do
      @logger.debug("This is a debug message")
    end

    should "log an info message" do
      @logger.info("This is an info message")
    end

    should "log a warning message" do
      @logger.warn("This is a warning message")
    end

    should "log an error message" do
      @logger.error("This is an error message")
    end

    should "log a fatal message" do
      @logger.fatal("This is a fatal message")
    end

    should "log a message with an unknown severity" do
      @logger.add(5, "This message has an unknown severity")
    end

  end

end