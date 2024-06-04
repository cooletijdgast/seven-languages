i = 0
increment = 4
b = []
array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16].each do |a| 
  b.push(a)
  i = i +1
  if(i % 4 == 0)
    puts "Current numbers are #{b}"
    b = []
  end
end
