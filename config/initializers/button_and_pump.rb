require 'rpi_gpio'

# Setup GPIO at rails start
RPi::GPIO.reset
RPi::GPIO.set_numbering :bcm
RPi::GPIO.setup 23, :as => :input, :pull => :down
RPi::GPIO.setup 24, :as => :input, :pull => :up
RPi::GPIO.setup 21, :as => :output
RPi::GPIO.set_low 21

# Release GPIO when rails is done
END {RPi::GPIO.reset}   #and release all

# Register the thing to do when we get a transition on our input GPIO
# stolen from tenderlove


require 'epoll'

def watch( pin, on )
  # Export the pin we want to watch
  File.binwrite "/sys/class/gpio/export", pin.to_s

  # It takes time for the pin support files to appear, so retry a few times
  retries = 0
  begin
    # `on` should be "none", "rising", "falling", or "both"
    File.binwrite "/sys/class/gpio/gpio#{pin}/edge", on
  rescue
    raise if retries > 3
    sleep 0.1
    retries += 1
    retry
  end

  # Read the initial pin value and yield it to the block
  fd = File.open "/sys/class/gpio/gpio#{pin}/value", 'r'
  yield fd.read.chomp

  epoll = Epoll.create
  epoll.add fd, Epoll::PRI

  loop do
    fd.seek 0, IO::SEEK_SET
    epoll.wait # put the program to sleep until the status changes
    yield fd.read.chomp
  end
ensure
  # Unexport the pin when we're done
  File.binwrite "/sys/class/gpio/unexport", pin.to_s
end


#
# And register it
#
Thread.new {
  $button_last_time = Time.now
  watch(24, 'falling') do |new_val|
   #puts "Pre Saw #{new_val} after transition on 24"
   if (Time.now > ($button_last_time + 0.200)) && (new_val == '0')
    puts "Saw #{new_val} after transition on 24"
    system("curl http://localhost:8080/do_full_cycle > /dev/null 2> /dev/null")
  end
end
}
