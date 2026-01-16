import random
import time
import matplotlib.pyplot as plt
import matplotlib
import numpy as np
import sys
from qubit_simulator import QubitSimulator #

# 设置 matplotlib 支持中文显示
matplotlib.rcParams['font.sans-serif'] = ['Noto Serif SC']  # 或 'Microsoft YaHei'
matplotlib.rcParams['axes.unicode_minus'] = False

# 您提供的函数
def apply_circuit(circuit, n):
    circuit.h(n - 1) #
    for qubit in range(n - 1):
        #
        circuit.cu(qubit, qubit + 1, random.random() * 3.14, random.random() * 3.14, random.random() * 3.14)

qubit_counts = []
runtimes = []

min_n = 2
max_n = 15
max_time_threshold = 60.0

print(f"--- 开始模拟运行时间测试 (N = {min_n} to {max_n}) ---")

for n in range(min_n, max_n + 1):
    try:
        print(f"正在测试 n_qubits = {n}")
        
        # 1. 初始化
        simulator = QubitSimulator(n) #
        
        # 2. 计时
        t = time.time()
        apply_circuit(simulator, n)
        elapsed = time.time() - t
        
        print(f"  > 时间: {elapsed:.6f} 秒")
        
        qubit_counts.append(n)
        runtimes.append(elapsed)
        
        # 3. 检查是否超时
        if elapsed > max_time_threshold:
            print(f"  > 运行时间超过 {max_time_threshold} 秒，停止测试。")
            break
            
    except MemoryError:
        print(f"  > 内存不足 (MemoryError) at n_qubits = {n}。停止测试。")
        break
    except Exception as e:
        print(f"  > 发生错误 at n_qubits = {n}: {e}")
        break
        
print("--- 测试完成 ---")
print(f"已收集数据点: {len(qubit_counts)}")
print("比特数:", qubit_counts)
print("运行时间 (秒):", runtimes)

# 5. 绘制结果
if len(qubit_counts) > 1:
    print("正在绘制结果图...")
    
    # 绘制线性图
    plt.figure(figsize=(10, 6))
    plt.plot(qubit_counts, runtimes, marker='o', linestyle='-')
    plt.xlabel("量子比特数 (N)")
    plt.ylabel("电路模拟运行时间 (秒)")
    plt.title("QubitSimulator 运行时间 vs. 量子比特数 (线性尺度)")
    plt.grid(True)
    plt.xticks(qubit_counts)
    plt.savefig("timing_linear_plot.png")
    print("已保存 timing_linear_plot.png")

    # 绘制对数图
    plt.figure(figsize=(10, 6))
    plt.plot(qubit_counts, runtimes, marker='o', linestyle='-')
    plt.yscale('log') # 设置y轴为对数尺度
    plt.xlabel("量子比特数 (N)")
    plt.ylabel("电路模拟运行时间 (秒, 对数坐标)")
    plt.title("QubitSimulator 运行时间 vs. 量子比特数 (对数尺度)")
    plt.grid(True, which="both")
    plt.xticks(qubit_counts)
    plt.savefig("timing_log_plot.png")
    print("已保存 timing_log_plot.png")
    
else:
    print("收集的数据点不足，无法绘图。")