import numpy as np
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt

sigma = 10
beta = 8/3
r = 28

def f(t, xyz):
    x, y, z = xyz
    return [sigma*(y-x), x*(r-z)-y, x*y-beta*z]

x0, y0, z0 = 0, 1, 20
xyz0 = [x0, y0, z0]

t_span = [0, 50]

sol = solve_ivp(f, t_span, xyz0, t_eval=np.linspace(t_span[0], t_span[1], 1000))

fig = plt.figure()
ax = fig.gca()
ax.plot(sol.y[0], sol.y[1], sol.y[2])
plt.title('Решение с помощью solve_ivp')
plt.show()
