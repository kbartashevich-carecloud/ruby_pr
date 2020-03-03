class Parts

  attr_reader :parts

  def initialize(parts)

    @parts = parts

  end

  def spares

    parts.select { |part| part.needs_spare }

  end

end

class Part

  attr_reader :name, :description, :needs_spare

  def initialize(name:, description:, needs_spare: true)

    @name = name
    @description = description
    @needs_spare = needs_spare

  end

end

class RoadBikeParts < Parts

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


road_bike = Bicycle.new(
    size: 'M',
    parts: RoadBikeParts.new(tape_color: "red"))

puts road_bike.size
puts road_bike.spares


mountain_bike = Bicycle.new(
    size: 'L',
    parts: MountainBikeParts.new(
        front_shock: 'Manitou',
        rear_shock: "Fox"
    )
)

puts mountain_bike.size
puts mountain_bike.spares

