def has_double(digits)
    idx = 1
    while idx < digits.length 
        if digits[idx-1] == digits[idx]
            return true
        end
        idx += 1
    end
    return false
end

def is_nondescending(digits)
    idx = 1
    while idx < digits.length 
        if digits[idx-1] > digits[idx]
            return false
        end
        idx += 1
    end
    return true
end

count = 0
for num in 357253..892942 do
    digits = num.to_s.split('').map(&:to_i)
    if has_double(digits) and is_nondescending(digits)
        count += 1
    end
end

puts count