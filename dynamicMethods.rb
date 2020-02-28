# class Dog
#   def bark
#     puts "Woof, woof!"
#   end
#   def greet(greeting)
#     puts greeting
#   end
# end
#
# dog = Dog.new
# dog.bark
# dog.send("bark")
# dog.send(:bark)
# method_name = :bark
# dog.send method_name
#
# dog.send(:greet, "hello")
#

# class Whatever
#   define_method :make_it_up do
#     puts "Whatever..."
#   end
# end
#
# whatever = Whatever.new
# whatever.make_it_up
#

class Mystery
  # no methods defined
  def method_missing (method, *args)
    puts "Looking for..."
    puts "\"#{method}\" with params (#{args.join(',')}) ?"
    puts "Sorry... He is on vacation..."
    yield "Ended up in method_missing" if block_given?
  end
end

m = Mystery.new
m.solve_mystery("abc", 123123) do |answer|
  puts "And the answer is: #{answer}"
end