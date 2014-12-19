Matrix = (r,c) ->
    if typeof r is "number" and typeof c is "number"
        return new Matrix.init(r,c)
    else
        return undefined
Matrix.init = (r,c) ->
    [@r,@c] = [r,c]
    @self = [0,0,[]]
    @
Matrix.fn = Matrix.prototype =
    row: (xs...) ->
        unless xs.length is @c
            console.log "Wrong number of arguments"
            return @
        unless @self[0] < @r and xs.length <= @c
            console.log "Matrix is filled"
            return @
        @self[2].push(xs)
        @self[0] = @self[0] + 1
        @self[1] = xs.length
        @
    col: (xs...) ->
        unless xs.length is @r
            console.log @r, xs.length
            console.log "Wrong number of arguments"
            return @
        unless @self[1] < @c and xs.length <= @r
            console.log "Matrix is filled"
            return @
        for i in [0..xs.length-1]
            @self[2][i] = [] if @self[2][i] is undefined
            @self[2][i].push(xs[i])
        @self[0] = xs.length
        @self[1] = @self[1] + 1
        @
    # mult: (xs) -> return

# 2x3 [1,2,3],[4,5,6]
# 
# 3x2 [1,2],[3,4],[5,6]

Matrix.init.prototype = Matrix.fn

window.Matrix = Matrix
