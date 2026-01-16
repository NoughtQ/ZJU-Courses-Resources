# NeuroFlow 使用说明

## 环境要求

- Java: JDK 24 或更高版本
- Maven: 3.8+

## 编译

在项目根目录下运行以下命令进行编译和打包：

```bash
mvn clean package
```

构建成功后，会在 `target/` 目录下生成 `NeuroFlow-1.0-SNAPSHOT.jar`（包含所有依赖的可执行 JAR 包）。

>注：项目根目录中的 `NeuroFlow.jar` 正是 `target/NeuroFlow-1.0-SNAPSHOT.jar` 的一个副本。

## 运行

基本的运行命令格式如下：

```bash
java -jar NeuroFlow.jar --graph <graph-json-file> --reportDir <dir> [optional-args]
```

### 1. 基础执行

在指定计算图上并发执行节点任务并输出性能报告：

```bash
java -jar NeuroFlow.jar --graph graphs/graph_linear.json --reportDir results/
```

如果不指定 `--reportDir` 参数，程序就不会生成报告。

### 2. 可视化（Visualization）

使用 `--dot` 参数，程序将在报告目录生成 Graphviz DOT 格式的图文件：

```bash
java -jar NeuroFlow.jar --graph graphs/graph_linear.json --reportDir results/ --dot
```

生成的 .dot 文件可以使用 Graphviz 工具转换为图片 (例如: `dot -Tpng file.dot -o file.png`)。*

### 3. A/B 性能测试（Benchmark）

使用 `--benchmark` 参数，程序将自动运行“基准模式”和“优化模式”，并输出性能对比表（包含执行时间和峰值内存）：

```bash
java -jar NeuroFlow.jar --graph graphs/graph_linear.json --benchmark
```

另外可以使用 `--iter` 参数指定迭代测试次数，但个人用下来感觉测出来的结果不太对，感觉是下一轮迭代并不能像重新运行程序那样保持完全纯净的运行环境。所以**建议多次运行程序而不是指定该参数**。

### 4. 容错测试

使用 `--unstable` 参数，模拟计算节点随机失败（默认 50% 概率）。可以用此模式验证系统的自动重试机制和故障传播逻辑：

```bash
java -jar NeuroFlow.jar --graph graphs/graph_linear.json --reportDir results/ --unstable
```

## 测试

循环检测：

```bash
java -jar NeuroFlow.jar --graph graphs/graph_cycle_test.json --reportDir results/
```

预期结果：程序报错并指出循环路径。
