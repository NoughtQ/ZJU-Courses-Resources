import matplotlib.pyplot as plt
import math

plt.rc("font", family="Noto Serif SC", size=13, weight="bold")

# 图1：载流圆线圈轴线上的磁场分布

dis = [-10.00, -9.00, -8.00, -7.00, -6.00,
       -5.00, -4.00, -3.00, -2.00, -1.00,
       0.00, 1.00, 2.00, 3.00, 4.00, 5.00,
       6.00, 7.00, 8.00, 9.00, 10.00]
B_cal = []
B_exp = [0.327, 0.385, 0.448, 0.520, 0.605, 
        0.682, 0.768, 0.843, 0.907, 0.950,
        0.963, 0.949, 0.906, 0.844, 0.766,
        0.680, 0.598, 0.517, 0.447, 0.381,
        0.327]

mu = 4 * math.pi * 10**(-7)
N = 400
I = 0.4
R = 0.1

for d in dis:
    B_cal.append(round((mu * N * I * R**2) / (2 * (R**2 + (d * 0.01)**2)**1.5) * 1000, 3))

# for i in range(len(dis)):
#     print(dis[i], B_cal[i])
    

plt.title("图1：载流圆线圈轴线上的磁场分布", weight="bold", size=20)
plt.xlabel("轴向距离 X/cm", weight="bold", size=12)
plt.ylabel("磁感应强度 B/mT", weight="bold", size=12)
plt.grid(linewidth=0.7)

ax = plt.gca()
ax.spines['left'].set_position(('axes', 0.5))
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)

plt.plot(dis, B_exp, color='green', label='实验数据')
plt.scatter(dis, B_exp, color='blue')

plt.plot(dis, B_cal, '--', color='orange', label='理论值')
plt.scatter(dis, B_cal, color='red')

plt.legend()
plt.savefig('Figure1.png')
plt.show()
 # type: ignore



# 图2：亥姆霍兹线圈轴线上的磁场分布

dis = [-10.00, -9.00, -8.00, -7.00, -6.00,
       -5.00, -4.00, -3.00, -2.00, -1.00,
       0.00, 1.00, 2.00, 3.00, 4.00, 5.00,
       6.00, 7.00, 8.00, 9.00, 10.00]
B_exp = [0.888, 0.993, 1.101, 1.199, 1.282,
         1.344, 1.385, 1.408, 1.417, 1.415,
         1.415, 1.414, 1.413, 1.404, 1.383,
         1.340, 1.279, 1.199, 1.099, 0.993,
         0.882]


plt.title("图2：亥姆霍兹线圈轴线上的磁场分布", weight="bold", size=20)
plt.xlabel("轴向距离 X/cm", weight="bold", size=12)
plt.ylabel("磁感应强度 B/mT", weight="bold", size=12)
plt.grid(linewidth=0.7)

ax = plt.gca()
ax.spines['left'].set_position(('axes', 0.5))
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)

plt.plot(dis, B_exp, color='green')
plt.scatter(dis, B_exp, color='blue')

plt.savefig('Figure2.png')
plt.show()



# 图3：载流圆线圈径向上的磁场分布

dis = [-5.00, -4.00, -3.00, -2.00, -1.00,
       0.00, 1.00, 2.00, 3.00, 4.00, 5.00]
B_exp = [1.215, 1.114, 1.054, 1.018, 0.995,
         0.990, 0.997, 1.019, 1.060, 1.130,
         1.238]


plt.title("图3：载流圆线圈径向上的磁场分布", weight="bold", size=20)
plt.xlabel("径向距离 X/cm", weight="bold", size=12)
plt.ylabel("磁感应强度 B/mT", weight="bold", size=12)
plt.grid(linewidth=0.7)

ax = plt.gca()
ax.spines['left'].set_position(('axes', 0.5))
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)

plt.plot(dis, B_exp, color='green')
plt.scatter(dis, B_exp, color='blue')

plt.savefig('Figure3.png')
plt.show()
