function run
  pendul1.m = 1; % масса первого звена
  pendul1.l = 1; % длина первого звена
  pendul2.m = 1; % масса второго звена
  pendul2.l = 1; % длина второго звена
  theta1_0 = 90; % начальный угол первого звена
  theta2_0 = 0; % начальный угол второго звена

  t_range = [0, 10];
  [t, pos] = pendulum2(pendul1, pendul2, theta1_0, theta2_0, t_range);
  figure;
  for i = 1:length(t)
      plot([0, pos(i, 1), pos(i, 3)], [0, pos(i, 2), pos(i, 4)], '-o');
      axis equal;
      xlim([-2, 2]);
      ylim([-2, 2]);
      pause(0.01);
  end
  figure;
  plot(pos(:, 1), pos(:, 2), '-o', pos(:, 3), pos(:, 4), '-o');
  xlabel('x, м');
  ylabel('y, м');
  legend('Звено 1', 'Звено 2');
end
