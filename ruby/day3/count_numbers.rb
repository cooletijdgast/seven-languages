class String
  def self.method_missing name, *args
      number = name.to_s
      number.gsub!("one", "I") 
      number.gsub!("two", "II")
      number.gsub!("three", "III")
      number.gsub!("four", "IIII")
      number.gsub!("five", "V")
      number.gsub!("six", "VI")
      number.gsub!("seven", "VII")
      number.gsub!("eight", "VIII")
      number.gsub!("nine", "VIIII")
      number.gsub!("ten", "X")
        
      (number.count("I") +
       number.count("V") * 5 +
       number.count("X") * 10)
    end
end

puts String.two
puts String.ten

animals = ["lions", "tigers"].each do |row| 
  row.to_s
  puts row.one
end
