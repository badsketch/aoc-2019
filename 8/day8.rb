WIDTH = 25
HEIGHT = 6

file = File.open('input.txt')
image_encoding = file.readlines.map(&:chomp)[0]

def find_most_zeroes_layer(encoding)
    layer_size = WIDTH * HEIGHT
    layers = encoding.chars.each_slice(layer_size).to_a.map(&:join)

    min = layer_size + 1
    min_layer = 0
    for layer in layers
        zero_count = get_zero_count(layer)
        if zero_count < min
            min_layer = layer
            min = zero_count
        end
    end
    return min_layer
end


def get_zero_count(layer)
    return layer.split('').select { |pixel| pixel.eql? '0'}.length
end

def calc_ones_mult_twos(layer)
    ones = 0
    twos = 0
    for pixel in layer.split('')
        if pixel.eql? '1'
            ones += 1
        elsif pixel.eql? '2'
            twos += 1
        end
    end
    return ones * twos
end

most_zeroes_layer = find_most_zeroes_layer(image_encoding)
puts calc_ones_mult_twos(most_zeroes_layer)

