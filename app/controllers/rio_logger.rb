#rio_logger.rb
class RioLogger < Logger
  def format_message(severity, datetime, progname, msg)
    "#{severity} #{datetime} (#{progname}) #{msg}\n"
  end
end

logfile = File.open('log/rio.log', 'a')  #create log file
logfile.sync = true  #automatically flushes data to file
RIO_LOGGER = RioLogger.new(logfile)  #constant accessible anywhere

##http://ianma.wordpress.com/2009/04/08/custom-logging-in-ruby-on-rails/
# voorbeeld code     RIO_LOGGER.info "xx"
#met programmanaam     RIO_LOGGER.info("order_regels_controller") {"artikel_selectie"}
#volgen van de log: tail -f log/rio.log

