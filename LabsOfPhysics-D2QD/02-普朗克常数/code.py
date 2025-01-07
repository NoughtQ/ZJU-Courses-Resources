import matplotlib.pyplot as plt 
import numpy as np

plt.rc("font", family="Noto Serif SC", size=13, weight="bold")

# 图1：Ua ~ ν 图像

frequency = [8.214, 7.408, 6.879, 5.490, 5.196]
Ua = [1.802, 1.456, 1.259, 0.715, 0.597]
e = 1.6e-19
h0 = 6.626e-34    

plt.title("图1：Ua ~ ν 图像", weight="bold", size=20)
plt.xlabel("频率 v/10^14 Hz", weight="bold", size=12)
plt.ylabel("遏止电压 Ua/V", weight="bold", size=12)
plt.grid(linewidth=0.7)
plt.xlim(0, 10)
plt.ylim(0, 2)

ax = plt.gca()
# ax.spines['left'].set_position(('axes', 0.5))
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)

linear_model = np.polyfit(frequency, Ua, 1)
linear_model_fn = np.poly1d(linear_model)
x_s = (0, 9, 0.01)

h = linear_model[0] * e * 10**(-14)
E = (h - h0) / h0
print(f"实验测得普朗克常量 h: {h}")
print(f"公认普朗克常量 h0: {h0}")
print(f"相对误差E: {round(E * 100, 2)}%")

plt.plot(x_s, linear_model_fn(x_s), color='green')
plt.scatter(frequency, Ua, color='blue')

plt.savefig('Figure1.png')
plt.show()




# 图2：光电管的伏安特性曲线

U = []
U_min = -5
U_max = 30
I = [-0.047, -0.039, -0.034, 0.32, 3.4,
     5.8, 15, 22, 26, 32, 35,
     40, 45, 52, 57, 61,
     65, 69, 72, 75, 77,
     80, 82, 86, 87, 90,
     91, 94, 96, 97, 98,
     101, 102, 104, 105, 106]
    

plt.title("图2：光电管的伏安特性曲线", weight="bold", size=20)
plt.xlabel("电压 U/V", weight="bold", size=12)
plt.ylabel("电流 I/10^(-10) Hz", weight="bold", size=12)
plt.grid(linewidth=0.7)
plt.xlim(-5, 32)
plt.ylim(-3, 110)

ax = plt.gca()
ax.spines['left'].set_position(('data', 0))
ax.spines['bottom'].set_position(('data', 0))
# ax.spines['top'].set_visible(False)
# ax.spines['right'].set_visible(False)
# ax.spines['left'].set_visible(False)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)
plt.axvline(-5, color='black', linewidth=1) 
plt.axhline(-3, color='black', linewidth=1)

for i in range(U_min, U_max + 1):
    if i < 0:
        U.append(i + 0.5)
    else:
        U.append(i)

# print(U)

plt.plot(U, I, color='green')
plt.scatter(U, I, color='blue')

plt.savefig('Figure2.png')
plt.show()

 # type: ignore