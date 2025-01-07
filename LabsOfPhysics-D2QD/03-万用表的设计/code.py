import matplotlib.pyplot as plt
import numpy as np

plt.rc("font", family="Noto Serif SC", size=11, weight="bold")

# 图1：5mA 电流表及其校准曲线

Ic = [1.00, 2.00, 3.00, 4.00, 5.00]
Is = [1.01, 2.05, 3.01, 3.97, 5.02]
deltaI = []

for i in range(len(Ic)):
    deltaI.append(Is[i] - Ic[i])

fig, ax1 = plt.subplots()

plt.title("图1：5mA 电流表及其校准曲线", weight="bold", size=20)
plt.grid(linewidth=0.7)

ax = plt.gca()
# ax.spines['left'].set_position(('axes', 0.5))
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)

plt.axhline(0, color='black', linewidth=0.5)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)

ax2 = ax1.twinx()

for Ic_, Is_ in zip(Ic, Is):
    ax1.text(Ic_, Is_, f"{Is_:.2f}", ha="left", va="top", size=10)

ax1.plot(Ic, Is, color='green', label="改装-校准")
ax1.scatter(Ic, Is, color='blue')
ax1.set_xlabel("改装电流 Ic / mA", weight="bold", size=12)
ax1.set_ylabel("校准电流 Is / mA", weight="bold", size=12)
ax1.set_xlim(1, 5)
ax1.set_ylim(-0.1, 5.1)

for Ic_, deltaI_ in zip(Ic, deltaI):
    ax2.text(Ic_, deltaI_, f"{deltaI_:.2f}", ha="center", va="bottom", size=10)

ax2.plot(Ic, deltaI, '--', color='orange', label="偏差")
ax2.plot(Ic, deltaI, 'x', color='red')
ax2.set_ylabel("ΔI / mA", weight="bold", size=12)
ax2.set_ylim(-0.1, 5.1)
ax2.spines['top'].set_visible(False)
ax2.spines['bottom'].set_visible(False)


handler, label = ax1.get_legend_handles_labels()
handler1, label1 = ax2.get_legend_handles_labels()
ax1.legend(handler+handler1, label+label1, loc='upper left')
plt.savefig('Figure1.png')
plt.show()



# 图2：5V 电压表及其校准曲线

Uc = [1.00, 2.00, 3.00, 4.00, 4.80]
Us = [0.98, 2.05, 2.90, 4.15, 5.00]
deltaU = []

for i in range(len(Uc)):
    deltaU.append(Us[i] - Uc[i])

fig, ax1 = plt.subplots()

plt.title("图2：5V 电压表及其校准曲线", weight="bold", size=20)
plt.grid(linewidth=0.7)

ax = plt.gca()
# ax.spines['left'].set_position(('axes', 0.5))
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)

plt.axhline(0, color='black', linewidth=0.5)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)

ax2 = ax1.twinx()

for Uc_, Us_ in zip(Uc, Us):
    ax1.text(Uc_, Us_, f"{Us_:.2f}", ha="left", va="top", size=10)

ax1.plot(Uc, Us, color='green', label="改装-校准")
ax1.scatter(Uc, Us, color='blue')
ax1.set_xlabel("改装电压 Uc / V", weight="bold", size=12)
ax1.set_ylabel("校准电压 Us / V", weight="bold", size=12)
ax1.set_xlim(1, 5)
ax1.set_ylim(-0.15, 5.1)

for Uc_, deltaU_ in zip(Uc, deltaU):
    ax2.text(Uc_, deltaU_, f"{deltaU_:.2f}", ha="center", va="bottom", size=10)

ax2.plot(Uc, deltaU, '--', color='orange', label="偏差")
ax2.plot(Uc, deltaU, 'x', color='red')
ax2.set_ylabel("ΔU / V", weight="bold", size=12)
ax2.set_ylim(-0.15, 5.1)
ax2.spines['top'].set_visible(False)
ax2.spines['bottom'].set_visible(False)

handler, label = ax1.get_legend_handles_labels()
handler1, label1 = ax2.get_legend_handles_labels()
ax1.legend(handler+handler1, label+label1, loc='upper left')
plt.savefig('Figure2.png')
plt.show()



# 图3：欧姆表刻度的对应关系

Rx = [2780, 1320, 760, 515, 366, 263, 190, 130, 85, 0]
lgRx = []
Ix = []


for i in range(len(Rx)):
    Ix.append(i / 2 + 0.5)

for Rx_ in Rx:
    if Rx_ != 0:
        lgRx.append(np.log10(Rx_))

fig, ax1 = plt.subplots()


plt.title("图3：欧姆表刻度的对应关系", weight="bold", size=20)
plt.grid(linewidth=0.7)

ax = plt.gca()
ax.spines['top'].set_visible(False)
# ax.spines['right'].set_visible(False)

# plt.axhline(0, color='black', linewidth=0.5)
ax.minorticks_on()
ax.grid(which='minor', color='gray', linestyle=':', linewidth=0.5)

ax2 = ax1.twinx()

for Ix_, Rx_ in zip(Ix, Rx):
    ax1.text(Ix_, Rx_, f"{Rx_}", ha="center", va="bottom", size=10)

ax1.plot(Ix, Rx, color='green', label="实验数据")
ax1.scatter(Ix, Rx, color='blue')
ax1.set_xlabel("电流表示数 Ix / mA", weight="bold", size=12)
ax1.set_ylabel("电阻 Rx / Ω", weight="bold", size=12)
ax1.set_xlim(0, 5.1)
# ax1.set_ylim(-0.15, 5.1)

# for Ix_, lgRx_ in zip(Ix, lgRx):
#     ax2.text(Ix_, lgRx_, f"{lgRx_:.2f}", ha="center", va="top", size=10)

ax2.plot(Ix[:-1], lgRx, '--', color='orange', label="取对数后的数据")
ax2.plot(Ix[:-1], lgRx, 'x', color='red')
ax2.set_ylabel("lg Rx / lg Ω", weight="bold", size=12)
# ax2.set_ylim(-0.15, 5.1)
ax2.spines['top'].set_visible(False)
ax2.spines['bottom'].set_visible(False)

handler, label = ax1.get_legend_handles_labels()
handler1, label1 = ax2.get_legend_handles_labels()
ax1.legend(handler+handler1, label+label1, loc='upper right')

plt.savefig('Figure3.png')
plt.show()

 # type: ignore