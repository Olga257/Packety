function caterpooly(pos, vel, bottom_left, top_right, iter)

  xmin = bottom_left(1); xmax = top_right(1);
  ymin = bottom_left(2); ymax = top_right(2);

  x = pos(1); y = pos(2);
  vx = vel(1); vy = vel(2);

  coords = [x y];

  for i = 1:iter
    x = x + vx;
    y = y + vy;

    if x < xmin
        x = xmin;
        vx = -vx;
    elseif x > xmax
        x = xmax;
        vx = -vx;
    end

    if y < ymin
        y = ymin;
        vy = -vy;
    elseif y > ymax
        y = ymax;
        vy = -vy;
    end

  coords = [coords; x y];
  p = plot(coords(:,1), coords(:,2));
  xlim([xmin xmax]);
  ylim([ymin ymax]);
  xlabel('x');
  ylabel('y');
  title('Caterpillar Trajectory');
  pause(0.1);
  delete(p);
  end
end
