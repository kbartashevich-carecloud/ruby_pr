class Parts

  attr_reader :chain, :tire_size

  def initialize(**opts)

    @chain = opts[:chain] || default_chain
    @tire_size = opts[:tire_size] || default_tire_size

    post_initialize(opts)

  end

  def spares

    { chain: chain,
      tire_size: tire_size }.merge(local_spares)

  end

  def default_tire_size

    raise NotImplementedError

  end

  def post_initialize(opts)

    nil

  end

  def local_spares

    {}

  end

  def default_chain

    "l1-speed"

  end

end

class RoadBike_parts < Parts

  attr_reader :tape_color

  def post_initialize(**opts)

    @tape_color = opts[:tape_color]

  end

  def local_spares

    { tape_color: tape_color }

  end

  def default_tire_size

    "23"

  end

end

class MountainBikeParts < Parts

  attr_reader :front_shock, :rear_shock

  def post_initialize(**opts)

    @front_shock = opts[:front_shock]
    @rear_shock = opts[:rear_shock]

  end

  def local_spares

    { front_shock: front_shock }

  end

  def default_tire_size

    "2.1"

  end

end

class Bicycle

  attr_reader :size, :parts


  def initialize(size:, parts:)

    @size = size
    @parts = parts

  end

  def spares

    parts.spares

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

end


road_bike = RoadBike.new(
    size: 'M',
    tape_color: 'red')

puts road_bike.tire_size
puts road_bike.chain
puts road_bike.spares


mountain_bike = MountainBike.new(
    size: 'S',
    front_shock: 'Manitou',
    rear_shock: 'Fox'
)

puts mountain_bike.tire_size
puts mountain_bike.chain
puts mountain_bike.spares

