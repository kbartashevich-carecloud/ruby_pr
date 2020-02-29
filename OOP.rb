# class Gear
#   private
#   attr_reader :chainring, :cog
#
#   public
#   def initialize(chainring, cog)
#     @chainring = chainring
#     @cog = cog
#   end
#
#   def ratio
#     chainring / cog.to_f
#   end
#
#   def gear_inches
#     ratio * (rim + (tire * 2))
#   end
#
# end
#
# class Blinkered
#   def cog(gear)
#     gear.cog
#   end
# end
#
# puts Blinkered.new.cog(Gear.new(54, 11))
#

# class ObscuringReferences
#   attr_reader :data
#   def initialize(data)
#     @data = data
#   end
#
#   def diameters
#     # 0 is rim, 1 is tire
#     data.collect do |cell|
#       cell[0] + (cell[1] * 2)
#     end
#   end
# end
#
# class RevealingReferences
#   attr_reader :wheels
#   def initialize(data)
#     @wheels = wheelify(data)
#   end
#
#   def diameters
#     wheels.collect {|wheel| diameter(wheel)}
#   end
#
#   def diameter(wheel)
#     wheel.rim + (wheel.tire * 2)
#   end
#
#   Wheel = Struct.new(:rim, :tire)
#
#   def wheelify(data)
#     data.collect do |cell|
#       Wheel.new(cell[0], cell[1])
#     end
#   end
# end


# class Gear
#   attr_reader :chainring, :cog, :wheel
#
#   def initialize(chainring, cog, wheel=nil)
#     @chainring = chainring
#     @cog = cog
#     @wheel = wheel
#   end
#
#   def ration
#     chainring / cog.to_f
#   end
#
#   def gear_inches
#     ration * wheel.diameter
#   end
# end
#
# class Wheel
#
#   attr_reader :rim, :tire
#
#   def initialize(rim, tire)
#     @rim = rim
#     @tire = tire
#   end
#
#   def diameter
#     rim + (tire * 2)
#   end
#
#   def circumference
#     diameter * Math::PI
#   end
# end
#
# @wheel = Wheel.new(26, 1.5)
# puts @wheel.circumference
#
# puts Gear.new(52, 11, @wheel).gear_inches
# puts Gear.new(52, 11).ratio
#

class Gear
  attr_reader :chainring, :cog

  def initialize(chainring:, cog:)
    @chainring = chainring
    @cog = cog
  end

  def gear_inches(diameter)
    ratio * diameter
  end

  def ratio
    chainring / cog.to_f
  end
end

class Wheel
  attr_reader :rim, :tire, :gear

  def initialize(rim:, tire:, chainring:, cog:)
    @rim = rim
    @tire = tire
    @gear = Gear.new(chainring: chainring, cog: cog)
  end

  def diameter
    rim + (tire * 2)
  end

  def gear_inches
    gear.gear_inches(diameter)
  end
end



# module SomeFramework
#
#   class Gear
#     attr_reader :chainring, :cog, :wheel
#
#     def initialize(chainring, cog, wheel)
#       @chainring = chainring
#       @cog = cog
#       @wheel = wheel
#     end
#   end
#
# end
#
# module GearWrapper
#
#   def self.gear(chainring:, cog:, wheel:)
#
#     SomeFramework::Gear.new(chainring, cog, wheel)
#
#   end
#
# end
#
# puts GearWrapper.gear(
#     chainring: 52,
#     cog: 11,
#     wheel: Wheel.new(26, 1.5)
# ).gear_inches
#
#

puts Wheel.new(
    rim: 26,
    tire: 1.5,
    chainring: 52,
    cog: 11
).gear_inches