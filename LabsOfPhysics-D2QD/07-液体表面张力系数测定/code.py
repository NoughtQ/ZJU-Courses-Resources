import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import curve_fit
from math import *

plt.figure(figsize=(10, 5))
plt.rc("font", family="Noto Serif SC", size=13, weight="bold")

def invFunc(x, a, b):
    return a / x + b

pV = [67.0, 83.1, 101.2, 118.8, 136.5, 147.8, 170.4, 183.9, 202.5]
nV = [61.8, 79.3, 96.7, 112.5, 132.6, 149.3, 167.4, 182.5, 202.5]
aV = []
dV = []
m0 = 5e-4
g = 9.7936

Di = [32.92, 32.96, 33.04, 33.02, 32.98]
Do = [34.72, 34.22, 34.92, 34.70, 34.82]
L = []

V1 = [122.1, 121.4, 121.9, 122.1, 121.2]
V2 = [74.0, 73.3, 73.5, 73.8, 73.3]
V = []

T = []
V1t = [121.7, 123.8, 123.4, 122.9, 121.7, 120.9]
V2t = [74.0, 74.5, 74.5, 74.4, 74.1, 73.7]
Vt = []
alphaT = []

print("平均数：")
for i in range(len(pV)):
    aV.append((pV[i] + nV[i]) / 2)
    print(f"{aV[i]:.2f}", end=" ")
print()

print("逐差数据：")
for i in range (len(aV) // 2):
    dV.append(aV[i + 4] - aV[i])
    print(f"{dV[i]:.2f}", end=" ")
print()

dVs = (sum(dV)) / 16
print(f"ΔV: {dVs:.2f}")
K = g * m0 / dVs
print(f"转换系数K：{K:.3e}")

print("L: ")
for i in range(len(Di)):
    L.append(pi * (Di[i] + Do[i]))
    print(f"{L[i]:.2f}", end=" ")
print()

aDi = np.average(Di)
aDo = np.average(Do)
aL = np.average(L)
print("平均值：")
print(f"Di: {aDi:.2f}")
print(f"Do: {aDo:.2f}")
print(f"L: {aL:.2f}")

print("表面张力对应读数：")
for i in range(len(V1)):
    V.append(V1[i] - V2[i])
    print(f"{V[i]:.2f}", end=" ")
print()

aV = np.average(V)
print(f"平均值：{aV:.2f}")

alpha = K * aV / (aL / 1e3)
print(f"表面张力系数α：{alpha:.3e}")


T.append(20.8)
alphaT.append(alpha)
print("其他温度下的表面张力系数：")
for i in range(len(V1t)):
    T.append(24 + 3 * i)
    Vt.append(V1t[i] - V2t[i])
    alphaT.append(K * Vt[i] / (aL / 1e3))
    print(f"{alphaT[i]:.3e}", end=" ")
print()

par, cov = curve_fit(invFunc, T[2:], alphaT[2:])
par1, cov1 = curve_fit(invFunc, T, alphaT)

a_fit, b_fit = par
print(f'拟合参数: a = {a_fit:.2e}, b = {b_fit:.2e}')

a_fit1, b_fit1 = par1

plt.title("不同温度下拉脱法求表面张力系数的曲线图", weight="bold", size=20)
plt.xlabel("温度 T/℃", weight="bold", size=12)
plt.ylabel("表面张力系数α", weight="bold", size=12)
plt.grid(linewidth=0.7)

for T_, alphaT_ in zip(T, alphaT):
    plt.text(T_, alphaT_, f"({T_}, {alphaT_:.2e})", ha="left", va="bottom", size=8)

ax = plt.gca()
# ax.spines['left'].set_position(('data', 0))
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)

te = np.linspace(15, 50, 100)
plt.plot(te, invFunc(te, *par), 'g', label='拟合曲线（去掉异常点）')
plt.plot(te, invFunc(te, *par1), '--', color='orange', label='拟合曲线（包含所有点）')
plt.scatter(T, alphaT, color='blue', label='实验数据')

plt.legend()
plt.savefig('Figure.png')
plt.show()