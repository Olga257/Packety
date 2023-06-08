function [t, pos] = pendulum2(pendul1, pendul2, theta1_0, theta2_0, t_range)

  g = 9.81;
  t = linspace(t_range(1), t_range(2), 1000);

  theta1_0 = deg2rad(theta1_0);
  theta2_0 = deg2rad(theta2_0);

  omega1_0 = 0;
  omega2_0 = 0;

  % Расчет функций ускорения
  f1 = @(t, theta1, theta2, omega1, omega2) (-g*(2*pendul1.m+pendul2.m)*sin(theta1) - pendul2.m*g*sin(theta1-2*theta2) - 2*sin(theta1-theta2)*pendul2.m*(omega2^2*pendul2.l+omega1^2*pendul1.l*cos(theta1-theta2))) / (pendul1.l*(2*pendul1.m+pendul2.m-pendul2.m*cos(2*theta1-2*theta2)));
  f2 = @(t, theta1, theta2, omega1, omega2) (2*sin(theta1-theta2)*((omega1^2*pendul1.l*(pendul1.m+pendul2.m) + g*(pendul1.m+pendul2.m)*cos(theta1) + omega2^2*pendul2.l*pendul2.m*cos(theta1-theta2))) / (pendul2.l*(2*pendul1.m+pendul2.m-pendul2.m*cos(2*theta1-2*theta2))));

  % Решение дифференциальных уравнений методом Рунге-Кутта 4 порядка
  [t, sol] = ode45(@(t, y) [y(2); f1(t, y(1), y(3), y(2), y(4)); y(4); f2(t, y(1), y(3), y(2), y(4))], t, [theta1_0, omega1_0, theta2_0, omega2_0]);

  x1 = pendul1.l*sin(sol(:, 1));
  y1 = -pendul1.l*cos(sol(:, 1));
  x2 = pendul2.l*sin(sol(:, 3)) + x1;
  y2 = -pendul2.l*cos(sol(:, 3)) + y1;

  pos = [x1, y1, x2, y2];
end
