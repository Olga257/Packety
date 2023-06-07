function res = fence(varargin)
# формирует по заданому количеству строк и столбцов логическую матрицу с чередующимися нулевыми и единичными столбцами.

  switch (nargin)
    case 1
      n = varargin{1}
      A = false(n,n);
      A(:, 1:2:n) = true
    case 2
      n = varargin{1}
      m = varargin{2}
      A = false(n,m);
      A(:, 1:2:m) = true
  end
end
