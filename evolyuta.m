function matrix = evolve(matrix)
  new_matrix = matrix;
  [m, n] = size(matrix);
  for i = 1:m
    for j = 1:n
      if i > 1 && j > 1 && i < m && j < n
        new_matrix(i, j) = 0.25*(matrix(i-1, j) + matrix(i, j-1) + matrix(i+1, j) + matrix(i, j+1));
      end
    end
  end
  matrix = new_matrix;
end


function evolyuta(func, upper_left, lower_right, iterations)
% func - функция, эволюту которой нужно искать
% upper_left - координаты верхнего левого угла прямоугольника
% lower_right - координаты правого нижнего угла прямоугольника
% iterations - количество итераций

[m, n] = size(func);
[x, y] = find(func);
points = [x, y];
matrix = zeros(m, n);
figure;
axis([upper_left(1), lower_right(1), upper_left(2), lower_right(2)]);
axis square;
hold on;
  for i = 1:iterations
    matrix = evolve(matrix);
    [x_evol, y_evol] = find(matrix);
    h_evol = plot(y_evol, x_evol, '.', 'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red');
    h_curve = plot(points(:, 2), points(:, 1), 'LineWidth', 2, 'Color', 'blue');
    title(['Iteration ', num2str(i)]);
    xlabel('X');
    ylabel('Y');
    grid on;
    drawnow;
    pause(0.1);
    delete(h_evol);
    delete(h_curve);
  end
end
