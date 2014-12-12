#!/usr/bin/env ruby

# Squared Euclidean Distance
def distance i, j
    return unless i.size == j.size
    j[:dist] = (0..i.size-1).reduce(0) do |ret, k| 
        ret + ((i[:xy][k] - j[:xy][k])**2)
    end
    j
end

# Do distance a bunch
def distances i, js
    js.map{|j| distance(i,j)}
end

# Find the nearest distances
def near xs, k
    xs.sort_by{|k|k[:dist]}.take(k).map{|j| j[:type]}
end

# Guess what the type of `i` is
def guess xs
    xs.group_by{|x| x}.values.max_by(&:size)[0]
end

# Shortcut to using all the other functions
def knn i, js, k
    guess(near(distances(i, js), k))
end

# Test data
i = {:type=>nil, :xy=>[1,2]}
js = [
    {:type=>0, :xy=>[3,2]},
    {:type=>1, :xy=>[4,3]},
    {:type=>1, :xy=>[2,3]},
    {:type=>0, :xy=>[1,4]},
    {:type=>0, :xy=>[3,1]},
    {:type=>1, :xy=>[2,2]}
]

# If `knn` is given: 
#   an unknown point
#   a list of known points
#   and how many to refer to
# It can guess the type of the unknown
i[:type] = knn i, js, 2
p i #=> Should be type 1
