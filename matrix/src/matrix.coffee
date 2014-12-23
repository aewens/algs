## Deprecated :(

# Dependes on Type monad

Matrix = (r,c) ->
    num = T("number")
    if num.check(r) and num.check(c)
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
    clear: -> new Matrix.init(@r,@c)
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
        return text
    fill: (xs) ->
        console.log xs
        unless xs.length is @r
            console.log "Wrong length of array"
            return @
        selfish = @self[2]
        @self[2] = []
        for x in xs
            unless x.length is @c
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
        
    transpose: ->
        self = new Array(@c)
        for s in [0..self.length-1]
            self[s] = new Array(@r)
        for i in [0..@self[2].length-1]
            for j in [0..@self[2][0].length-1]
                self[j][i] = @self[2][i][j]
        [r,c] = [@r,@c]
        @r = c
        @c = r
        @self[2] = self
        @
        
    add: (m) ->
        unless @r is m.r and @c is m.c
            console.log "Matrices cannot be added"
            return @
        r = @r
        c = @c
        A = @self[2]
        B = m.self[2]
        C = []
        for i in [0..r-1]
            C.push([])
            for j in [0..c-1]
                C[i].push(A[i][j] + B[i][j])
        C
    
    sub: (m) ->
        unless @r is m.r and @c is m.c
            console.log "Matrices cannot be subtracted"
            return @
        r = @r
        c = @c
        A = @self[2]
        B = m.self[2]
        C = []
        for i in [0..r-1]
            C.push([])
            for j in [0..c-1]
                C[i].push(A[i][j] - B[i][j])
        C
        
    mult: (m) ->
        unless @c is m.r
            console.log "Matrices cannot be multiplied"
            return @
        x = @c
        r = @r
        c = m.c
        A = @self[2]
        B = m.self[2]
        C = []
        for i in [0..r-1]
            C.push([])
            for j in [0..c-1]
                C[i].push(0)
                for k in [0..x-1]
                    C[i][j] = C[i][j] + (A[i][k]*B[k][j])
        C

Matrix.init.prototype = Matrix.fn

window.Matrix = Matrix
