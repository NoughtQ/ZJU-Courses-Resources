import matplotlib.pyplot as plt
import numpy as np
from math import *

plt.rc("font", family="Noto Serif SC", size=13, weight="bold")

t = []
U = [28.4, 34.5, 41.7, 47.5, 53.2, 58.5, 64.6, 70.1]
alpha = []
alpha_0 = 4.28e-3
Rt = [55.07, 56.01, 57.12, 58.15, 59.24, 60.28, 61.41, 62.57]
E = 1.3

for i in range(len(U)):
    t.append(20 + i * 5)

for i in range(len(t)):
    alpha.append((4 * U[i] * 1e-3) / (t[i] * (E - 2 * U[i] * 1e-3)))

print("温度系数：")
for alpha_ in alpha:
    print(f"{alpha_:.2e}", end=" ")
print()

alpha_avg = np.average(alpha)
print(f"平均温度系数：{alpha_avg:.2e}")
E1 = fabs(alpha_avg - alpha_0) / alpha_0 * 100
print(f"相对误差：{E1:.2f}%")


# 图1：U-t 特性曲线图
plt.title("图1：U-t 特性曲线图", weight="bold", size=20)
plt.xlabel("温度 t(℃)", weight="bold", size=12)
plt.ylabel("电压 U(mV)", weight="bold", size=12)
plt.grid(linewidth=0.7)
plt.xlim(15, 60)
plt.ylim(25, 75)

for t_, U_ in zip(t, U):
    plt.text(t_, U_, f"({t_}, {U_})", ha="left", va="top", size=8)

ax = plt.gca()
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)


plt.plot(t, U, color='green')
plt.scatter(t, U, color='blue')

plt.savefig('Figure1.png')
plt.show()


# 图2：Rt-t 特性曲线图
plt.title("Rt-t 特性曲线图", weight="bold", size=20)
plt.xlabel("温度 t(℃)", weight="bold", size=12)
plt.ylabel("电阻 Rt(Ω)", weight="bold", size=12)
plt.grid(linewidth=0.7)
plt.xlim(15, 60)
plt.ylim(50, 65)

for t_, Rt_ in zip(t, Rt):
    plt.text(t_, Rt_, f"({t_}, {Rt_})", ha="left", va="top", size=8)

ax = plt.gca()
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)

linear_model = np.polyfit(t, Rt, 1)
k, b = linear_model
print(f"斜率：{k:.4f}，截距：{b:.4f}")
alpha_1 = k / b
print(f"温度系数：{alpha_1:.2e}")
E2 = fabs(alpha_1 - alpha_0) / alpha_0 * 100
print(f"相对误差：{E2:.2f}%")


linear_model_fn = np.poly1d(linear_model)
x_s = (15, 60, 0.1)

plt.plot(x_s, linear_model_fn(x_s), color='green')
plt.scatter(t, Rt, color='blue')

plt.savefig('Figure2.png')
plt.show()
