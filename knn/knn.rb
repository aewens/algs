#!/usr/bin/env ruby

# Squared Euclidean Distance
def distance i, j
    return unless i.size == j.size
    j[:dist] = (0..i.size-1).reduce(0) do |ret, k| 
        ret + ((i[:xy][k] - j[:xy][k])**2)
    end
    j
end

def distances i, js
    js.map{|j| distance(i,j)}
end

def near xs, k
    xs.sort_by{|k|k[:dist]}.take(k).map{|j| j[:type]}
end

def guess xs
    xs.group_by{|x| x}.values.max_by(&:size)[0]
end

def knn i, js, k
    guess(near(distances(i, js), k))
end

i = {:type=>nil, :xy=>[1,2]}
js = [
    {:type=>0, :xy=>[3,2]},
    {:type=>1, :xy=>[4,3]},
    {:type=>1, :xy=>[2,3]},
    {:type=>0, :xy=>[1,4]},
    {:type=>0, :xy=>[3,1]},
    {:type=>1, :xy=>[2,2]}
]

i[:type] = knn i, js, 2
p i

# p i
