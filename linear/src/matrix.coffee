Matrix = (r,c) ->
    if typeof r is "number" and typeof c is "number"
        return new Matrix.init(r,c)
    else
        return undefined
        
Matrix.init = (r,c) ->
    [@r,@c] = [r,c]
    # self[0] :: How full the row is
    # self[1] :: How full the column is
    # self[2] :: The actual matrix
    @self = [0,0,[]]
    @
    
Matrix.fn = Matrix.prototype =
    clear: -> new Matrix.init(@r, @c)
    print: ->
        text = "["
        for xs in @self[2]
            for x in xs
                text = text + "#{x}"
                text = text + " " unless x is xs[xs.length-1]
            if xs is @self[2][@self[2].length-1]
                text = text + "]"
            else
                text = text + "\n  "
        console.log text
    fill: (xs) ->
        unless xs.length is @c
            console.log "Wrong length of array"
            return @
        selfish = @self[2]
        @self[2] = []
        for x in xs
            unless x.length is @r
                console.log "Wrong length of sub-array"
                @self[2] = selfish
                return @
            unless T("number").arr(x)
                # T(Type) monad logs its own errors
                @self[2] = selfish
                return @
            @self[2].push(x)
        @self[0] = xs.length
        @self[1] = xs[0].length
        @
        
    row: (xs...) ->
        unless xs.length <= @c
            console.log "Wrong number of arguments"
            return @
        unless @self[0] < @r and xs.length <= @c
            console.log "Matrix is filled"
            return @
        unless T("number").arr(xs)
            # T(Type) monad logs its own errors
            return @
        @self[2].push(xs)
        @self[0] = @self[0] + 1
        @self[1] = xs.length
        @
        
    col: (xs...) ->
        unless xs.length <= @r
            console.log "Wrong number of arguments"
            return @
        unless @self[1] < @c and xs.length <= @r
            console.log "Matrix is filled"
            return @
        unless T("number").arr(xs)
            # T(Type) monad logs its own errors
            return @
        for i in [0..xs.length-1]
            @self[2][i] = [] if @self[2][i] is undefined
            @self[2][i].push(xs[i])
        @self[0] = xs.length
        @self[1] = @self[1] + 1
        @
    # mult: (xs) -> return

Matrix.init.prototype = Matrix.fn

window.Matrix = Matrix
