import matplotlib.pyplot as plt  # type: ignore
import numpy as np # type: ignore

plt.rc("font", family="Noto Serif SC", size=13, weight="bold")

# R-t 特性曲线

t = []
Rx = [4.820, 4.897, 4.991, 5.098, 5.173, 5.266, 5.356, 5.451, 5.548, 5.636]
alpha = []
  
for i in range(len(Rx)):
    t.append(30 + i * 5)

for i in range(len(Rx) // 2):
    alpha.append((Rx[i+5] - Rx[i]) / (t[i+5] * Rx[i] - t[i] * Rx[i+5]))

alpha_ave = np.average(alpha)

plt.title("R-t 特性曲线", weight="bold", size=20)
plt.xlabel("温度 t / ℃", weight="bold", size=12)
plt.ylabel("电阻 Rx / 10^-3 Ω", weight="bold", size=12)
plt.grid(linewidth=0.7)
plt.xlim(20, 80)
plt.ylim(4, 6)

for t_, Rx_ in zip(t, Rx):
    plt.text(t_, Rx_, f"({t_}, {Rx_:.3f})", ha="right", va="bottom", size=10)

ax = plt.gca()
# ax.spines['left'].set_position(('axes', 0.5))
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)

linear_model = np.polyfit(t, Rx, 1)
linear_model_fn = np.poly1d(linear_model)
x_s = (0, 80, 1)
alpha_exp = linear_model[0] / linear_model[1]
err = (alpha_exp - alpha_ave) / alpha_ave

print("α：", end="")
for alpha_ in alpha:
    print(f"{alpha_:.4e}", end=" ")
print()
print(f"理论α：{alpha_ave:.4e}")
print(f"实验α：{alpha_exp:.4e}")
print(f"相对误差：{round(err, 6) * 100}%")


plt.plot(x_s, linear_model_fn(x_s), color='green')
plt.scatter(t, Rx, color='blue')

plt.savefig('Figure.png')
plt.show()

