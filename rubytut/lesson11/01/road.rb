require './bridge'

bridge = Bridge.new

bridge.open unless bridge.open?

another_bridge = Bridge.new

puts another_bridge.open?
