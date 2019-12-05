file = File.open('input.txt')
file_data = file.readlines
intcode = file_data[0].split(',').map(&:to_i)
intcode[1] = 12
intcode[2] = 2
op_pos = 0
while intcode[op_pos] != 99
    instruction = intcode.slice(op_pos, 4)
    op_code = instruction[0]
    input1 = instruction[1]
    input2 = instruction[2]
    dest = instruction[3]

    if op_code == 1 then
        intcode[dest] = intcode[input1] + intcode[input2]
    elsif op_code == 2 then
        intcode[dest] = intcode[input1] * intcode[input2]
    else
        puts 'you entered something wrong...'
    end

    op_pos += 4
end

puts intcode[0]

