# 模拟器初始化
from qubit_simulator import QubitSimulator
import matplotlib.pyplot as plt

simulator = QubitSimulator(num_qubits=5)

# 施加量子门
simulator.h(target_qubit=0)
simulator.cx(control_qubit=0, target_qubit=1)
simulator.cx(control_qubit=1, target_qubit=2)
simulator.cx(control_qubit=2, target_qubit=3)
simulator.cx(control_qubit=3, target_qubit=4)

# 量子测量
shots = int(input("Shots: "))
results = simulator.run(shots=shots)

# 电路可视化
print(simulator)
print(results)

# 绘制概率分布直方图
# 对结果按键（状态）排序，以确保 '00000' 在 '11111' 之前
sorted_states = sorted(results.keys())
sorted_counts = [results[state] for state in sorted_states]

print("\n--- 正在绘制结果 ---")

plt.rcParams['font.sans-serif'] = ['Noto Serif SC']
plt.figure(figsize=(10, 6))
# 使用 bar 函数创建直方图
plt.bar(sorted_states, sorted_counts, color=['blue', 'orange'])

plt.xlabel('测量到的量子态')
plt.ylabel('测量次数 (Counts)')
plt.title(f'5-Qubit GHZ 态测量分布 (总共 {shots} 次)')

if sorted_counts:
    plt.yticks(range(0, max(sorted_counts) + shots//10, shots//10))
plt.grid(axis='y', linestyle='--', alpha=0.7)

plt.savefig('task2-histogram.png')
plt.show()