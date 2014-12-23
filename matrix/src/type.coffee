## Deprecated :(

# Private helper functions
str = (s) ->
    if typeof s != "string"
        console.log "Expected type: string"
        return false
    else
        return s
        
arr = (a) ->
    if {}.toString.call(a) != "[object Array]"
        console.log "Expected type: array"
        return false
    else
        return a

# Library begins here
Type = (type) -> new Type.init(str(type))

Type.init = (type) ->
    @type = type
    @

Type.fn = Type.prototype = 
    check: (p) ->
        if typeof p != @type
            console.log "Expected type: #{@type}, not #{typeof p}"
            return false
        else
            return p
                
    arr: (a) ->
        array = arr(a)
        state = false
        if array
            state = true
            for x in array
                state = false unless @check(x)
        unless state
            console.log "Expected array type: #{@type}"
            return false
        else
            return a
        
    
Type.init.prototype = Type.fn

window.T    = Type
window.Type = Type
