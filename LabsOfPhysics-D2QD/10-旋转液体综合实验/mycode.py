import matplotlib.pyplot as plt
import numpy as np
from math import *

plt.rc("font", family="Noto Serif SC", size=13, weight="bold")

D = 0.1018
g = 9.7936
n1 = []
hh = [2.78, 2.88, 3.05, 3.17, 3.29, 3.53]
hl = [2.02, 1.94, 1.76, 1.62, 1.50, 1.27]
deltah = []
g1 = []

H = 0.1062
h = 0.0249
n2 = []
d = [0.81, 1.58, 2.39, 3.81, 5.11, 6.28]
tan2t = []
tant = []
g2 = []

n3 = []
omega = []
hb = 7.48
hl2 = [2.30, 1.99, 1.88, 1.78, 1.50, 1.32]
delta1h = [3.90, 2.00, 0.50, -1.25, -2.60, -3.50]
exp_f = []
the_f = []

for i in range (len(hh)):
    n1.append(75 + i * 10)
    n2.append(45 + i * 10)
    n3.append(70 + i * 10)
    deltah.append(hh[i] - hl[i])
    g1.append(pi**2 * D**2 * n1[i]**2 / (7200 * ((deltah[i]) / 100)))
    
    tan2t.append(d[i] / ((H - h) * 100))
    tant.append(tan(atan(tan2t[i]) / 2))
    g2.append(2 * pi**2 * D * n2[i]**2 / (3600 * sqrt(2) * tant[i]))
    
    exp_f.append(hb + delta1h[i] - hl2[i])
    omega.append(2 * pi * n3[i] / 60) 
    the_f.append(g / (2 * omega[i]**2) * 100)

print("方法1：")
print("高度差Δh：")
for h_ in deltah:
    print(f"{h_:.2f}", end=" ")
print()

print("重力加速度g：")
for g_ in g1:
    print(f"{g_:.2f}", end=" ")
print() 

ave_g = sum(g1) / len(g1)
print(f"平均重力加速度：{ave_g:.2f}m/s^2")
E = (ave_g - g) / g * 100
print(f"相对误差：{E:.2f}%")

print("\n方法2：")
print("距离d：")
for d_ in d:
    print(f"{d_:.2f}", end=" ")
print() 

print("tan 2θ：")
for tan2t_ in tan2t:
    print(f"{tan2t_:.2f}", end=" ")
print()

print("tan θ：")
for tant_ in tant:
    print(f"{tant_:.2f}", end=" ")
print()

print("重力加速度g：")
for g_ in g2:
    print(f"{g_:.2f}", end=" ")
print() 

ave_g = sum(g2) / len(g2)
print(f"平均重力加速度：{ave_g:.2f}m/s^2")
E = (ave_g - g) / g * 100
print(f"相对误差：{E:.2f}%")

print("\n测量焦距：")
for f_ in exp_f:
    print(f"{f_:.2f}", end=" ")
print()

print("理论焦距：")
for f_ in the_f:
    print(f"{f_:.2f}", end=" ")
print()




plt.title("f-n 曲线图", weight="bold", size=20)
plt.xlabel("转速 n(转/分)", weight="bold", size=12)
plt.ylabel("焦距 f(cm)", weight="bold", size=12)
plt.grid(linewidth=0.7)
plt.xlim(65, 125)
plt.ylim(2, 10)

ax = plt.gca()
# ax.spines['left'].set_position(('axes', 0.5))
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)

# linear_model = np.polyfit(n3, exp_f, 1)
# linear_model_fn = np.poly1d(linear_model)
# x_s = (65, 125, 0.1)

plt.plot(n3, exp_f, color='green', label='实验数据')
plt.scatter(n3, exp_f, color='blue')

# linear_model = np.polyfit(n3, the_f, 1)
# linear_model_fn = np.poly1d(linear_model)
plt.plot(n3, the_f, '--', color='orange', label='理论数据')
plt.scatter(n3, the_f, color='red')

plt.legend()
plt.savefig('Figure.png')
plt.show()




