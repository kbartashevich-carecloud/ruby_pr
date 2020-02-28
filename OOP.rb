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

class ObscuringReferences
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def diameters
    # 0 is rim, 1 is tire
    data.collect do |cell|
      cell[0] + (cell[1] * 2)
    end
  end
end

class RevealingReferences
  attr_reader :wheels
  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.collect do |wheel|
      wheel.rim + (wheel.tire * 2)
    end
  end

  Wheel = Struct.new(:rim, :tire)

  def wheelify(data)
    data.collect do |cell|
      Wheel.new(cell[0], cell[1])
    end
  end
end