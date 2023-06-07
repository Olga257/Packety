function  res = diagsn(varargin)
% заполняет прямоугольную матрицу натуральными числами в виде "змейки" по диагонали
switch (nargin)
    case 1
      number = 1;
      x = 1;
      y = -1;
      size = varargin{1};
      matrix = zeros(size);

      while (number < size * size)
          while (x > 0 && y < size - 1)
              --x;
              ++y;
              matrix(x+1, y+1) = number;
              ++number;
          endwhile

          if (x == 0 && y < size - 1)
              ++y;
          else
              ++x;
          endif


          matrix(x+1, y+1) = number;
          ++number;

          if (number != size * size)
              while (x < size - 1 && y > 0)
                  ++x;
                  --y;
                  matrix(x+1, y+1) = number;
                  ++number;
              endwhile
              if (y == 0 && x < size - 1)
                  ++x;
              else
                  ++y;
              endif
              matrix(x+1, y+1) = number;
              ++number;
          endif
      endwhile
      disp(matrix);
    case 2
      number = 1;
      x = 1;
      y = -1;
      matrix = zeros(varargin{1},varargin{2});
      rows = varargin{1};
      cols = varargin{2};

      while (number < rows * cols)
          while (x > 0 && y < cols - 1)
              --x;
              ++y;
              matrix(x+1, y+1) = number;
              ++number;
          endwhile

          if (x == 0 && y < cols - 1)
              ++y;
          else
              ++x;
          endif


          matrix(x+1, y+1) = number;
          ++number;

          if (number != cols * rows)
              while (x < rows - 1 && y > 0)
                  ++x;
                  --y;
                  matrix(x+1, y+1) = number;
                  ++number;
              endwhile
              if (y == 0 && x < rows - 1)
                  ++x;
              else
                  ++y;
              endif
              matrix(x+1, y+1) = number;
              ++number;
          endif
      endwhile
      disp(matrix);
end
