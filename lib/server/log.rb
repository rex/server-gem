require 'logger'

$Log = Logger.new(STDOUT)
$Log.datetime_format = '%Y-%m-%d %H:%M:%S'
$Log.formatter = proc do |severity, datetime, progname, msg|
  # "#{datetime.strftime("%m/%d %H:%M")}: #{msg} [#{severity}] \n"
  case severity.downcase
    when "debug"
      prompt = "☰ ".blue
    when "info"
      prompt = "i ".green
    when "warn"
      prompt = "⚑ ".magenta
    when "error"
      prompt = "⁢⁢⁢⁢⁢⁢✖ ".red
    when "fatal"
      prompt = ":( ".red
    else
      prompt = "✓ ".blue
  end

  if ARGV.include? "-e"
    "#{prompt} #{datetime.strftime("%Y/%m/%d %H:%M:%S")} \n » #{msg.strip} \n\n"
  else
    "#{prompt} #{msg.strip} \n"
  end
end

# $Log.debug("This is a debug message")
# $Log.info("This is an info message")
# $Log.warn("This is a warning message")
# $Log.error("This is an error message")
# $Log.fatal("This is a fatal message")
# $Log.error("Some error here")