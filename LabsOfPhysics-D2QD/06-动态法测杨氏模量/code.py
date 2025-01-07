import matplotlib.pyplot as plt
import numpy as np
from math import *

plt.rc("font", family="Noto Serif SC", size=13, weight="bold")

# 图1：

x = []
f = [736.3, 735.0, 734.2, 733.1, 732.5, 732.2, 732.3, 732.4, 732.6]
d = [5.885, 5.864, 5.883, 5.855, 5.867, 5.815]
l = [159.5, 159.2, 159.3, 159.5, 159.3, 159.4]
m = [37.337, 37.337, 37.337, 37.335, 37.334, 37.336]
delta_d = 0.004
delta_l = 0.2
delta_m = 0.001
delta_f = 0.1
const = 1.6067


for i in range(len(f)):
    if i >= 6:
        x.append((i + 2) * 5)
    else:
        x.append((i + 1) * 5)

x = np.array(x)
f = np.array(f)

quad_model = np.polyfit(x, f, 2)
quad_model_fn = np.poly1d(quad_model)
a, b, c = quad_model


quad_x = np.linspace(x[0] - 5, x[-1] + 5, 100)
quad_f = quad_model_fn(quad_x)
x_min = - b / (2 * a)
f_min = a * x_min**2 + b * x_min + c

ave_d = np.average(d)
ave_l = np.average(l)
ave_m = np.average(m)

d_ua = sqrt(np.var(d) / (len(d) - 1))
d_ub = delta_d / sqrt(3)
d_u = sqrt(d_ua**2 + d_ub**2)

l_ua = sqrt(np.var(l) / (len(l) - 1))
l_ub = delta_l / sqrt(3)
l_u = sqrt(l_ua**2 + l_ub**2)

m_ua = sqrt(np.var(m) / (len(m) - 1))
m_ub = delta_m / sqrt(3)
m_u = sqrt(m_ua**2 + m_ub**2)

f_u = delta_f / sqrt(3)


E = const * (ave_l**3) * ave_m * (f_min**2) / (ave_d**4)
E_u = E * sqrt((3 * l_u / ave_l)**2 + (4 * d_u / ave_d)**2 + (m_u / ave_m)**2 + (2 * f_u / f_min)**2)

print("最低点数据：")
print(f"x: {round(x_min, 2)}mm\nf: {round(f_min, 2)}Hz\n")

print("平均值：")
print(f"d: {ave_d:.3e}mm")
print(f"l: {ave_l:.3e}mm")
print(f"m: {ave_m:.4e}g\n")

print("不确定度计算：")
print(f"直径 d/mm：\nA: {d_ua:.2e}, B: {d_ub:.2e}, 不确定度: {d_u:.2e}")
print(f"长度 l/mm：\nA: {l_ua:.2e}, B: {l_ub:.2e}, 不确定度: {l_u:.2e}")
print(f"质量 m/g：\nA: {m_ua:.2e}, B: {m_ub:.2e}, 不确定度: {m_u:.2e}")
print(f"频率(f/Hz)不确定度: {f_u:.2e}\n")

print(f"杨氏模量: {E:.3e} N/m^2")
print(f"杨氏模量的不确定度: {E_u:.3e} N/m^2")

plt.title("外延法测量共振频率曲线", weight="bold", size=20)
plt.xlabel("悬丝点距端点距离 x/mm", weight="bold", size=12)
plt.ylabel("共振频率 f/Hz", weight="bold", size=12)
plt.grid(linewidth=0.7)

for x_, f_ in zip(x, f):
    plt.text(x_, f_, f"({x_}, {f_:.1f})", ha="left", va="top", size=8)

ax = plt.gca()
ax.spines['left'].set_position(('data', 0))
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)


plt.plot(quad_x, quad_f, 'g', label='拟合曲线')
plt.scatter(x, f, color='blue', label='实验数据')
plt.scatter(x_min, f_min, color='red', label="最低点")
plt.annotate(f'最低点\n({x_min:.2f}, {f_min:.2f})',
             xy=(x_min, f_min), xycoords='data',
             xytext=(-40, 20), textcoords='offset points',
             arrowprops=dict(arrowstyle="->", connectionstyle="arc3,rad=.2"),
             fontsize=8, color='red', weight='bold')


plt.legend()
plt.savefig('Figure.png')
plt.show()
 # type: ignore