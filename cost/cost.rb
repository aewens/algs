#!/usr/bin/env ruby

xs = []
ys = []

# Guess what `y` will be in respect to `x`
def hypoth x, O0, O1
    O0 + (O1 * x)
end

# Squared error
def cost xs, ys
    return unless xs.size == ys.size
    size = xs.size
    sqsum = (0..size-1).reduce(0){|ret, i| ret + (hypoth(xs[i]) - ys[i])**2}
    (1 / (2 * size)) * sqsum
end
