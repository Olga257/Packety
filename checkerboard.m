function res = checkerboard(varargin)

  switch (nargin)
    case 1
      n = varargin{1}
      A = false(n,n);
      A(1:2:n, 1:2:n) = true;
      A(2:2:n, 2:2:n) = true
    case 2
      n = varargin{1}
      m = varargin{2}
      A = false(n,m);
      A(1:2:n, 1:2:m) = true;
      A(2:2:n, 2:2:m) = true
  end
end
