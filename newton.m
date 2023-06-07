function [root, conv] = newton(p, x0)
  MaxIter = 100;
  tol = 1e-12;
  iter = 1;
  conv = false;
  x = x0;
  while iter <= MaxIter
      fx = polyval(p, x);
      dfx = polyval(polyder(p), x);
      if abs(dfx) < tol
          break;
      end
      x_new = x - fx/dfx;
      if abs(x_new - x) < tol*max(1, abs(x_new))
          conv = true;
          break;
      end
      x = x_new;
      iter = iter + 1;
  end
  if conv
      root = x_new;
  else
      root = NaN;
  end
