function fracto(p, ll, ur, num_points)

  roots = roots(p);

  colormap(hsv(length(roots)));
  color_idx = 1:length(roots);

  x = linspace(ll(1), ur(1), num_points(1));
  y = linspace(ll(2), ur(2), num_points(2));
  [x_mesh, y_mesh] = meshgrid(x, y);
  points = x_mesh(:) + 1i*y_mesh(:);

  colors = zeros(size(points));

  for k = 1:length(points)
      [root, conv] = newton(p, points(k));
      [~, idx] = min(abs(root-roots));
      colors(k) = color_idx(idx);
  end

  colors_mesh = reshape(colors, size(x_mesh));
  image(x, y, colors_mesh, 'CDataMapping', 'scaled');
  axis equal;
  xlabel('Real');
  ylabel('Imaginary');

end
