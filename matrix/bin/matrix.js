// Generated by CoffeeScript 1.7.1
(function() {
  var Matrix,
    __slice = [].slice;

  Matrix = function(r, c) {
    var num;
    num = T("number");
    if (num.check(r) && num.check(c)) {
      return new Matrix.init(r, c);
    } else {
      return void 0;
    }
  };

  Matrix.init = function(r, c) {
    var _ref;
    _ref = [r, c], this.r = _ref[0], this.c = _ref[1];
    this.self = [0, 0, []];
    return this;
  };

  Matrix.fn = Matrix.prototype = {
    clear: function() {
      return new Matrix.init(this.r, this.c);
    },
    print: function() {
      var text, x, xs, _i, _j, _len, _len1, _ref;
      text = "[";
      _ref = this.self[2];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        xs = _ref[_i];
        for (_j = 0, _len1 = xs.length; _j < _len1; _j++) {
          x = xs[_j];
          text = text + ("" + x);
          if (x !== xs[xs.length - 1]) {
            text = text + " ";
          }
        }
        if (xs === this.self[2][this.self[2].length - 1]) {
          text = text + "]";
        } else {
          text = text + "\n  ";
        }
      }
      return text;
    },
    fill: function(xs) {
      var selfish, x, _i, _len;
      console.log(xs);
      if (xs.length !== this.r) {
        console.log("Wrong length of array");
        return this;
      }
      selfish = this.self[2];
      this.self[2] = [];
      for (_i = 0, _len = xs.length; _i < _len; _i++) {
        x = xs[_i];
        if (x.length !== this.c) {
          console.log("Wrong length of sub-array");
          this.self[2] = selfish;
          return this;
        }
        if (!T("number").arr(x)) {
          this.self[2] = selfish;
          return this;
        }
        this.self[2].push(x);
      }
      this.self[0] = xs.length;
      this.self[1] = xs[0].length;
      return this;
    },
    row: function() {
      var xs;
      xs = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      if (!(xs.length <= this.c)) {
        console.log("Wrong number of arguments");
        return this;
      }
      if (!(this.self[0] < this.r && xs.length <= this.c)) {
        console.log("Matrix is filled");
        return this;
      }
      if (!T("number").arr(xs)) {
        return this;
      }
      this.self[2].push(xs);
      this.self[0] = this.self[0] + 1;
      this.self[1] = xs.length;
      return this;
    },
    col: function() {
      var i, xs, _i, _ref;
      xs = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      if (!(xs.length <= this.r)) {
        console.log("Wrong number of arguments");
        return this;
      }
      if (!(this.self[1] < this.c && xs.length <= this.r)) {
        console.log("Matrix is filled");
        return this;
      }
      if (!T("number").arr(xs)) {
        return this;
      }
      for (i = _i = 0, _ref = xs.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        if (this.self[2][i] === void 0) {
          this.self[2][i] = [];
        }
        this.self[2][i].push(xs[i]);
      }
      this.self[0] = xs.length;
      this.self[1] = this.self[1] + 1;
      return this;
    },
    transpose: function() {
      var c, i, j, r, s, self, _i, _j, _k, _ref, _ref1, _ref2, _ref3;
      self = new Array(this.c);
      for (s = _i = 0, _ref = self.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; s = 0 <= _ref ? ++_i : --_i) {
        self[s] = new Array(this.r);
      }
      for (i = _j = 0, _ref1 = this.self[2].length - 1; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; i = 0 <= _ref1 ? ++_j : --_j) {
        for (j = _k = 0, _ref2 = this.self[2][0].length - 1; 0 <= _ref2 ? _k <= _ref2 : _k >= _ref2; j = 0 <= _ref2 ? ++_k : --_k) {
          self[j][i] = this.self[2][i][j];
        }
      }
      _ref3 = [this.r, this.c], r = _ref3[0], c = _ref3[1];
      this.r = c;
      this.c = r;
      this.self[2] = self;
      return this;
    },
    add: function(m) {
      var A, B, C, c, i, j, r, _i, _j, _ref, _ref1;
      if (!(this.r === m.r && this.c === m.c)) {
        console.log("Matrices cannot be added");
        return this;
      }
      r = this.r;
      c = this.c;
      A = this.self[2];
      B = m.self[2];
      C = [];
      for (i = _i = 0, _ref = r - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        C.push([]);
        for (j = _j = 0, _ref1 = c - 1; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; j = 0 <= _ref1 ? ++_j : --_j) {
          C[i].push(A[i][j] + B[i][j]);
        }
      }
      return C;
    },
    sub: function(m) {
      var A, B, C, c, i, j, r, _i, _j, _ref, _ref1;
      if (!(this.r === m.r && this.c === m.c)) {
        console.log("Matrices cannot be subtracted");
        return this;
      }
      r = this.r;
      c = this.c;
      A = this.self[2];
      B = m.self[2];
      C = [];
      for (i = _i = 0, _ref = r - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        C.push([]);
        for (j = _j = 0, _ref1 = c - 1; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; j = 0 <= _ref1 ? ++_j : --_j) {
          C[i].push(A[i][j] - B[i][j]);
        }
      }
      return C;
    },
    mult: function(m) {
      var A, B, C, c, i, j, k, r, x, _i, _j, _k, _ref, _ref1, _ref2;
      if (this.c !== m.r) {
        console.log("Matrices cannot be multiplied");
        return this;
      }
      x = this.c;
      r = this.r;
      c = m.c;
      A = this.self[2];
      B = m.self[2];
      C = [];
      for (i = _i = 0, _ref = r - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        C.push([]);
        for (j = _j = 0, _ref1 = c - 1; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; j = 0 <= _ref1 ? ++_j : --_j) {
          C[i].push(0);
          for (k = _k = 0, _ref2 = x - 1; 0 <= _ref2 ? _k <= _ref2 : _k >= _ref2; k = 0 <= _ref2 ? ++_k : --_k) {
            C[i][j] = C[i][j] + (A[i][k] * B[k][j]);
          }
        }
      }
      return C;
    }
  };

  Matrix.init.prototype = Matrix.fn;

  window.Matrix = Matrix;

}).call(this);
