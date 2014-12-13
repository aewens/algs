#!/usr/bin/env ruby

xs = [0,1,2,3,4,5]
ys = [3,2,4,1,5,0]

# Guess what `y` will be in respect to `x`
def hypoth x, o0, o1
    o0 + (o1 * x)
end

# Squared error
def cost xs, ys, o0, o1
    return unless xs.size == ys.size
    size = xs.size
    sqsum = (0..size-1).reduce(0) do |ret, i|
        ret + (hypoth(xs[i],o0,o1) - ys[i])**2
    end
    (1.0 / (2 * size)) * sqsum
end

o0 = 0
o1 = 0

p cost xs, ys, o0, o1
