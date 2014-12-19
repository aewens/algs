# Virtually useless, but I want it here anyways

Vector = (xs...) ->
    if T("number").arr(xs)
        return new Vector.init(xs)
    else
        return undefined
        
Vector.init = (xs) ->
    @xs = [xs]
    @self = [xs]
    @flat = true
    @

Vector.fn = Vector.prototype =
    transpose: ->
        if @flat
            self = []
            for s in [0..@self[0].length-1]
                self.push([@self[0][s]])
            @self = self
        else
            self = []
            for s in [0..@size.length]
                self.push(@self[s][0])
            @self = self
        @xs = @self
        @

Vector.init.prototype = Vector.fn

window.Vector = Vector
