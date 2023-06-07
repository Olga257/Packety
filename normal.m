function res = normal(fun, x0, y0)
    x = -5:0.01:5;
    y = -5:0.01:5;
    [X,Y] = meshgrid(x,y);
    Z = fun(X,Y);
    h = 1e-8;
    z0 = fun(x0, y0);
    dx = (fun(x0 + h, y0) - fun(x0, y0)) / h;
    dy = (fun(x0, y0 + h) - fun(x0, y0)) / h;
    t = [0:0.01:1];
    Xn = [dx * t + x0];
    Yn = [dy * t + y0];
    Zn = [-t + z0];
    S = surf(X, Y, Z);
    hold on;
    myRed=[1 0 0];
    plot3(Xn, Yn, Zn, 'Color', myRed);

    set(S, "facealpha", 0.2)
    xlabel('x');
    ylabel('y');
    zlabel('z');
    shading interp;
    hold off
endfunction
