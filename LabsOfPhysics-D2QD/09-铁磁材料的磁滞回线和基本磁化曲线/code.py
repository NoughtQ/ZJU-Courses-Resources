import matplotlib.pyplot as plt
import numpy as np
from math import *

plt.rc("font", family="Noto Serif SC", size=13, weight="bold")

u = [0.5, 1.0, 1.2, 1.5, 1.8, 2.0, 2.2, 2.5, 2.8, 3.0]
deltax1 = [0.106, 0.204, 0.241, 0.295, 0.356, 0.397, 0.460, 0.683]
deltay1 = [0.098, 0.186, 0.214, 0.267, 0.315, 0.352, 0.385, 0.434]
deltax2 = [0.101, 0.170, 0.203, 0.257, 0.315, 0.363, 0.416, 0.505, 0.620, 0.713]
deltay2 = [0.097, 0.193, 0.221, 0.279, 0.329, 0.367, 0.404, 0.458, 0.512, 0.554]
ux = []
uy = [-0.193, -0.178, -0.155, -0.131, -0.104, -0.075, -0.039, -0.004, 0.025, 0.054,
      0.075, 0.094, 0.115, 0.130, 0.141, 0.154, 0.164, 0.173, 0.182, 0.191,
      0.196, 0.177, 0.156, 0.140, 0.108, 0.075, 0.039, 0.008, -0.025, -0.057,
      -0.077, -0.095, -0.115, -0.130, -0.140, -0.155, -0.163, -0.176, -0.183, -0.189]

H1 = []
B1 = []
mu1 = []
H2 = []
B2 = []
mu2 = []
H = []
B = []

N1 = N2 = N3 = 150
L1 = 0.130
S1 = 1.24e-4
L2 = 6e-2
S2 = 8e-5
R1 = 2.5
R2 = 1e4
C = 3e-6

ux.append(-0.200)
for i in range(1, len(uy)):
    if i < 21:
        ux.append(ux[i - 1] + 0.020)
    else:
        ux.append(ux[i - 1] - 0.020)

print("样品1：")

print("H: ", end="")
for i in range(len(deltax1)):
    H1.append((deltax1[i] * N1) / (2 * L1 * R1 * sqrt(2)))
    print(f"{H1[-1]:.2f}", end=" ")
print()

print("B: ", end="")
for i in range(len(deltay1)):
    B1.append((deltay1[i] * C * R2) / (2 * N2 * S1 * sqrt(2)))
    print(f"{B1[-1]:.2e}", end=" ")
print()

print("μ: ", end="")
for i in range(len(deltay1)):
    mu1.append(B1[i] / H1[i])
    print(f"{mu1[-1]:.2e}", end=" ")
print()

print("\n样品2：")

print("H: ", end="")
for i in range(len(deltax2)):
    H2.append((deltax2[i] * N1) / (2 * L2 * R1 * sqrt(2)))
    print(f"{H2[-1]:.2f}", end=" ")
print()

print("B: ", end="")
for i in range(len(deltay2)):
    B2.append((deltay2[i] * C * R2) / (2 * N2 * S2 * sqrt(2)))
    print(f"{B2[-1]:.2e}", end=" ")
print()

print("μ: ", end="")
for i in range(len(deltay2)):
    mu2.append(B2[i] / H2[i])
    print(f"{mu2[-1]:.2e}", end=" ")
print()

print("\n磁滞曲线数据：")
print("H: ")
for i in range(len(ux)):
    H.append((ux[i] * N1) / (L2 * R1 * sqrt(2)))
    print(f"{H[-1]:.2f}", end=" ")
    if i % 10 == 9:
        print()
print()

print("B: ")
for i in range(len(uy)):
    B.append((uy[i] * C * R2) / (N2 * S2 * sqrt(2)))
    print(f"{B[-1]:.3f}", end=" ")
    if i % 10 == 9:
        print()
print()


# 图1：样品1的 B-H 曲线图和 μ-H 曲线图
fig, ax1 = plt.subplots()
fig.set_size_inches(10, 6)

plt.title("样品1的基本磁化曲线：B-H 曲线图和 μ-H 曲线图\n", weight="bold", size=18)
plt.grid(linewidth=0.7)

ax = plt.gca()
# ax.spines['left'].set_position(('data', 0))
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)

plt.axhline(0, color='black', linewidth=0.5)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)

ax2 = ax1.twinx()

quad_model1 = np.polyfit(H1, B1, 4)
quad_model1_fn = np.poly1d(quad_model1)
quad_H1 = np.linspace(15, 120, 100)
quad_B1 = quad_model1_fn(quad_H1)

ax1.plot(quad_H1, quad_B1, color='green', label="B-H曲线")
ax1.scatter(H1, B1, color='blue')
ax1.set_xlabel("磁场强度 H(A/m)", weight="bold", size=12)
ax1.set_ylabel("磁感应强度 B(T)", weight="bold", size=12)
ax1.set_xlim(15, 120)
ax1.set_ylim(0, 0.25)

quad_model2 = np.polyfit(H1, mu1, 4)
quad_model2_fn = np.poly1d(quad_model2)
quad_H1 = np.linspace(15, 120, 100)
quad_mu1 = quad_model2_fn(quad_H1)

ax2.plot(quad_H1, quad_mu1, '--', color='orange', label="μ-H曲线")
ax2.plot(H1, mu1, 'x', color='red')
ax2.set_ylabel("磁导率 μ(N/A^2)", weight="bold", size=12)
ax2.set_ylim(2e-3, 3.5e-3)
ax2.spines['top'].set_visible(False)
ax2.spines['bottom'].set_visible(False)


ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)

handler, label = ax1.get_legend_handles_labels()
handler1, label1 = ax2.get_legend_handles_labels()
ax1.legend(handler+handler1, label+label1, loc='upper left')
plt.savefig('Figure1.png')
plt.show()



# 图2：样品2的 B-H 曲线图和 μ-H 曲线图
fig, ax1 = plt.subplots()
fig.set_size_inches(10, 6)

plt.title("样品2的基本磁化曲线：B-H 曲线图和 μ-H 曲线图\n", weight="bold", size=18)
plt.grid(linewidth=0.7)

ax = plt.gca()
# ax.spines['left'].set_position(('data', 0))
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)

plt.axhline(0, color='black', linewidth=0.5)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)

ax2 = ax1.twinx()

quad_model1 = np.polyfit(H2, B2, 4)
quad_model1_fn = np.poly1d(quad_model1)
quad_H2 = np.linspace(30, 260, 100)
quad_B2 = quad_model1_fn(quad_H2)

ax1.plot(quad_H2, quad_B2, color='green', label="B-H曲线")
ax1.scatter(H2, B2, color='blue')
ax1.set_xlabel("磁场强度 H(A/m)", weight="bold", size=12)
ax1.set_ylabel("磁感应强度 B(T)", weight="bold", size=12)
ax1.set_xlim(30, 260)
ax1.set_ylim(0, 0.5)

quad_model2 = np.polyfit(H2[:1] + H2[2:], mu2[:1] + mu2[2:], 4)
quad_model2_fn = np.poly1d(quad_model2)
quad_H2 = np.linspace(30, 260, 100)
quad_mu2 = quad_model2_fn(quad_H2)

ax2.plot(quad_H2, quad_mu2, '--', color='orange', label="μ-H曲线")
ax2.plot(H2, mu2, 'x', color='red')
ax2.set_ylabel("磁导率 μ(N/A^2)", weight="bold", size=12)
ax2.set_ylim(1.9e-3, 2.9e-3)
ax2.spines['top'].set_visible(False)
ax2.spines['bottom'].set_visible(False)


ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)

handler, label = ax1.get_legend_handles_labels()
handler1, label1 = ax2.get_legend_handles_labels()
ax1.legend(handler+handler1, label+label1, loc='upper left')
plt.savefig('Figure2.png')
plt.show()


# 图3：B-H关系曲线（磁滞回线）
plt.title("B-H关系曲线（磁滞回线）", weight="bold", size=20)
plt.xlabel("磁场强度 H(A/m)", weight="bold", size=10, x=0.9)
plt.ylabel("磁感应强度 B(T)", weight="bold", size=10, y=0.8)
plt.grid(linewidth=0.7)

ax = plt.gca()
ax.spines['left'].set_position(('axes', 0.5))
ax.spines['bottom'].set_position(('axes', 0.5))
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)

plt.plot(H + [H[0]], B + [B[0]], color='green')
plt.scatter(H, B, color='blue')

plt.savefig('Figure3.png')
plt.show()
