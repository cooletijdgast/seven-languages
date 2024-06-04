i = 0
increment = 4
array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16].each_slice(4) do |a| 
  puts "Current numbers are #{a}"
end
