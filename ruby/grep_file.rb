puts "First type what word should be searched, then in which file"
word_to_search = gets.chomp
file_name = gets.chomp

file = File.open(file_name)
file_data = file.readlines.map(&:chomp)
line_number = 0
file_data.each do |line|
  if line.match(word_to_search)
    puts line
    puts "On line number " + line_number.to_s
  end
  line_number = line_number + 1
end 
