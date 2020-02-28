arr = [5, 4, 1]
cur_number = 10
arr.each do |cur_number|
  some_var = 10
  print cur_number.to_s + " "
end
puts
puts cur_number

adjustment = 5
arr.each do |cur_number; adjustment|
  adjustment = 10
  print "#{cur_number + adjustment} "
end
puts
puts adjustment