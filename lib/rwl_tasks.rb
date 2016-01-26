class RWLTask

  COMMAND_WHITELIST = %w(start pause unpause stop)
  HELP_MESSAGE      = <<-EOT
    Usage: rwl COMMAND
    The avalible commands are:
    start     Start logging
    stop      Stop logging
    pause     Pause logging
    unpause   Unpause logging
  EOT

  def initialize
    command = process_command
    if COMMAND_WHITELIST.include?(command)
      send(command)
    else
      send('help')
    end
  end

  def start
    log_to_file('Start')
    puts 'Get it on!'
  end

  def stop
    log_to_file('Stop')
    puts 'Feierabend!'
  end

  def pause
    log_to_file('Pause')
    puts 'Have a nice break!'
  end

  def unpause
    log_to_file('Unpause')
    puts 'Get back to work!'
  end

  def help
    puts HELP_MESSAGE
  end

  def log_to_file(message)
    open(File.dirname(__FILE__) + '/../work.log', 'a') do |f|
      @timestamp = Time.now.getutc.to_s
      f.puts "#{@timestamp} #{message}"
    end
  end

  def process_command
    return 'help' if ARGV.empty? || ARGV.count > 1
    command = ARGV.first
  end
end
