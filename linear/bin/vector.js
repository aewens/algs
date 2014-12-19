// Generated by CoffeeScript 1.7.1
(function() {
  var Vector,
    __slice = [].slice;

  Vector = function() {
    var xs;
    xs = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    if (T("number").arr(xs)) {
      return new Vector.init(xs);
    } else {
      return void 0;
    }
  };

  Vector.init = function(xs) {
    this.xs = [xs];
    this.self = [xs];
    this.flat = true;
    return this;
  };

  Vector.fn = Vector.prototype = {
    transpose: function() {
      var s, self, _i, _j, _ref, _ref1;
      if (this.flat) {
        self = [];
        for (s = _i = 0, _ref = this.self[0].length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; s = 0 <= _ref ? ++_i : --_i) {
          self.push([this.self[0][s]]);
        }
        this.self = self;
      } else {
        self = [];
        for (s = _j = 0, _ref1 = this.size.length; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; s = 0 <= _ref1 ? ++_j : --_j) {
          self.push(this.self[s][0]);
        }
        this.self = self;
      }
      this.xs = this.self;
      return this;
    }
  };

  Vector.init.prototype = Vector.fn;

  window.Vector = Vector;

}).call(this);