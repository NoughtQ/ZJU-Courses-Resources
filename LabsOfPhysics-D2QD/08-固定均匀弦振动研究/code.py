import matplotlib.pyplot as plt
import numpy as np
from math import *

plt.figure(figsize=(10, 5))
plt.rc("font", family="Noto Serif SC", size=13, weight="bold")

sqrtm = []
length = [0.6656, 0.7062, 0.7582, 0.8088, 0.8426, 0.8774]
f = 75
g = 9.7936
rho_ = 1.31e-4
k_ = 1 / f * sqrt(g / rho_)

for i in range(len(length)):
    sqrtm.append(sqrt((30 + i * 5) * 1e-3))

linear_model = np.polyfit(sqrtm, length, 1)
linear_model_fn = np.poly1d(linear_model)
k, b = linear_model
rho = g / (k * f)**2 

print(f"理论斜率：{k_:.2f}")
print(f"拟合曲线斜率：{k:.2f}")

print(f"理论弦线密度：{rho_:.2e}")
print(f"实验弦线密度：{rho:.2e}")

deltam = 1e-3
deltal = 1e-4
deltaf = 1e-2

delta_rho = []
for i in range(len(length)):
    delta_rho.append(rho * sqrt((deltam / ((30 + 5 * i) * 1e-3))**2 + (2 * deltaf / f)**2 + (2 * deltal / length[i])**2))

print("不确定度：")
for i in range(len(delta_rho)):
    print(f"{delta_rho[i]:.2e}", end=", ")
print()


# λ-√m 曲线图
plt.title("λ-√m 曲线图", weight="bold", size=20)
plt.xlabel("砝码质量的算术平方根 √m/√kg", weight="bold", size=12)
plt.ylabel("波长 λ/m", weight="bold", size=12)
plt.grid(linewidth=0.7)

for m_, l_ in zip(sqrtm, length):
    plt.text(m_, l_, f"({m_:.2e}, {l_:.2f})", ha="left", va="bottom", size=8)

ax = plt.gca()
# ax.spines['left'].set_position(('data', 0))
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)

m_s = (0.17, 0.24, 0.01)
plt.plot(sqrtm, linear_model_fn(sqrtm),color='green', label='拟合曲线')
plt.scatter(sqrtm, length, color='blue', label='实验数据')

plt.legend()
plt.savefig('Figure.png')
plt.show()