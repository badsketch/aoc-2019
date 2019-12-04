def div_3_sub_2(num)
    return num / 3 - 2
end

file = File.open("input.txt")
file_data = file.readlines.map(&:chomp)
puts file_data.reduce(0) { |sum, num| sum + div_3_sub_2(num.to_i)}

