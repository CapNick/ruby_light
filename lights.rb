require 'pi_piper'
include PiPiper

def decide_pin (pin, pin_value)
	if pin_value == 1
		pin.on
	else
		pin.off
	end
end

def update_time(pins_hours, pins_mins, pins_secs)

	hours = '%04b' % Time.now.strftime('%I').to_i
	mins = '%06b' % Time.now.strftime("%M").to_i
	secs = '%06b' % Time.now.strftime('%S').to_i

	(0..3).each do |n|
		decide_pin(pins_hours[n], hours[n].to_i)
	end

	(0..5).each do |n|
		decide_pin(pins_mins[n], mins[n].to_i)
		decide_pin(pins_secs[n], secs[n].to_i)
	end

end

pins_hours = Array[ Pin.new(:pin => 26, :direction => :out), Pin.new(:pin => 19, :direction => :out), Pin.new(:pin => 13, :direction => :out), Pin.new(:pin => 6, :direction => :out) ]
pins_mins = Array[ Pin.new(:pin => 21, :direction => :out), Pin.new(:pin => 20, :direction => :out), Pin.new(:pin => 16, :direction => :out), Pin.new(:pin => 12, :direction => :out), Pin.new(:pin => 24, :direction => :out), Pin.new(:pin => 23, :direction => :out) ]
pins_secs = Array[ Pin.new(:pin => 4, :direction => :out), Pin.new(:pin => 17, :direction => :out), Pin.new(:pin => 27, :direction => :out), Pin.new(:pin => 5, :direction => :out), Pin.new(:pin => 18, :direction => :out), Pin.new(:pin => 25, :direction => :out) ]

loop do
	update_time pins_hours, pins_mins, pins_secs
	sleep 1
	break if false
end
