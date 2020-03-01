# class Bicycle
#
#   attr_reader :style, :size,
#               :tape_color,
#               :front_shock, :rear_shock
#
#
#
#   def initialize(**opts)
#     @style = opts[:style]
#     @size = opts[:size]
#     @tape_color = opts[:tape_color]
#     @front_shock = opts[:front_shock]
#     @rear_shock = opts[:rear_shock]
#   end
#
#   def spares
#
#     if style == :road
#
#       { chain: "li-speed",
#         tire_size: "23",
#         tape_color: tape_color }
#     else
#
#       { chain: "li-speed",
#         tire_size: "2.1",
#         front_shock: front_shock }
#       end
#   end
#
# end
#
#
# bike = Bicycle.new(
#     style: :mountain,
#     size: 'S',
#     front_shock: 'Manitou',
#     rear_shock: 'Fox'
# )
#
#
# puts bike.spares
#
#
#
# class MountainBike < Bicycle
#
#   attr_reader :front_shock, :rear_shock
#
#   def initialize(**opts)
#
#     @front_shock = opts[:front_shock]
#     @rear_shock = opts[:rear_shock]
#
#     super
#
#   end
#
#   def spares
#
#     super.merge(front_shock: front_shock)
#
#   end
#
# end
#
#

module Schedulable

  attr_writer :schedule

  def schedule

    @schedule ||= Schedule.new

  end

  def schedulable?(starting, ending)

    !scheduled?(starting - lead_days, ending)

  end

  def scheduled?(starting, ending)

    schedule.scheduled?(self, starting, ending)

  end

  def lead_days

    0

  end

end

class Schedule

  def scheduled?(schedulable, starting, ending)

    puts "This #{schedulable.class} is " +
             "available #{starting} - #{ending}"

    false

  end

  def add(target, starting, ending)
    # ...
  end

  def remove(target, atrting, ending)
    # ...
  end

end

class Bicycle

  include Schedulable

  attr_reader :size, :chain, :tire_size, :schedule

  def initialize(**opts)
    @size = opts[:size]
    @chain = opts[:chain] || default_chain
    @tire_size = opts[:tire_size] || default_tire_size
    @schedule = opts[:schedule] || Schedule.new

    post_initialize(opts)
  end

  def lead_days
    1

  end

  def post_initialize(opts)

  end

  def default_chain

    "l1-speed"

  end

  def default_tire_size

    123

  end

  def spares

    { tire_size: tire_size,
      chain: chain }.merge(local_spares)

  end

  def local_spares

    {}

  end

end


class RoadBike < Bicycle

  attr_reader :tape_color

  def post_initialize(opts)

    @tape_color = opts[:tape_color]

  end

  def local_spares

    { tape_color: tape_color }

  end

  def default_tire_size

    "23"

  end

end

class MountainBike < Bicycle

  attr_reader :front_shock, :rear_shock

  def post_initialize(opts)

    @front_shock = opts[:front_shock]
    @rear_shock = opts[:rear_shock]

  end

  def local_spares

    { front_shock: front_shock }

  end

  def default_tire_size

    "2.1"

  end

  def spares

    super.merge(front_shock: front_shock)

  end

end

# road_bike = RoadBike.new(
#     size: 'M',
#     tape_color: 'red'
# )
#
# puts road_bike.tire_size
# puts road_bike.chain
#
# mountain_bike = MountainBike.new(
#     size: "S",
#     front_shock: "Manitou",
#     rear_shock: "Fox"
# )
#
# puts mountain_bike.tire_size
# puts mountain_bike.chain
#

# road_bike = RoadBike.new(
#     size: 'M',
#     tape_color: 'red'
# )
#
# puts road_bike.tire_size
# puts road_bike.chain
# puts road_bike.spares
#
#
# mountain_bike = MountainBike.new(
#     size: 'S',
#     front_shock: 'Manitou',
#     rear_shock: 'Fox'
# )
#
# puts mountain_bike.tire_size
# puts mountain_bike.chain
# puts mountain_bike.spares


class RecumbentBike < Bicycle

  attr_reader :flag

  def post_initialize(opts)

    @flag = opts[:flag]

  end

  def local_spares

    { flag: flag }

  end

  def default_chain

    '10-speed'

  end

  def default_tire_size

    '28'

  end

end

# bent = RecumbentBike.new(
#     size: 'M',
#     flag: 'tall and orange'
# )
#
# puts bent.spares



require 'date'
starting = Date.parse("2019/09/04")
ending = Date.parse("2019/09/10")

b = Bicycle.new

puts b.schedulable?(starting, ending)
