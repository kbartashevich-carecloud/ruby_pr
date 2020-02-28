class Car
  def initialize(speed, comfort)
    @rating = speed * comfort
  end

  def rating
    @rating
  end
end

puts Car.new(4, 5).rating

class MyAlgorithm
  private
    def test1
      "Private"
    end
  protected
    def test2
      "Protected"
    end
  public
  def public_again
    "Public"
  end
end

class Another
  def test1
    "Private, as declared later on"
  end
  private :test1
end