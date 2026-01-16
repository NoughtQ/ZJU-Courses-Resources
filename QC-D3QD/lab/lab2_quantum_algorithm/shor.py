import numpy as np
from qiskit import QuantumCircuit, transpile
from qiskit.circuit.library import UnitaryGate, QFTGate
from qiskit.providers.basic_provider import BasicSimulator

def shor_circuit(N, a, n_p, n_v):
    qc = QuantumCircuit(n_p + n_v, n_p)

    for q in range(n_p):
        qc.h(q)
    qc.x(n_p)

    for q in range(n_p):
        exponent = 2 ** q
        ctrl_mod = mod_exp_circuit(a, exponent, N, n_v).to_gate().control(1)
        qc.append(ctrl_mod, [q] + list(range(n_p, n_p + n_v)))
    
    qc.append(QFTGate(n_p).inverse(), range(n_p))

    qc.measure(range(n_p), range(n_p))
    return qc

def mod_exp_circuit(a, power, N, n_v):
    qc = QuantumCircuit(n_v)
    for _ in range(power):
        qc.append(mod_circuit(a, N, n_v), range(n_v))
    return qc

def mod_circuit(a, N, n_v):
    dim = 2 ** n_v
    matrix = np.zeros((dim, dim), dtype=int)
    # TODO: complete modular multiplication circuit
    for y in range(dim):
        if y < N:
            mapped = (a * y) % N
        else:
            mapped = y
        matrix[mapped, y] = 1.0
    return UnitaryGate(matrix)

N = 21
a = 2
n_p = 5 # number of qubits in period register
n_v = 5 # number of qubits in value register
qc = shor_circuit(N, a, n_p, n_v)
print(qc.draw())

backend = BasicSimulator()
tqc = transpile(qc, backend)
result = backend.run(tqc).result()
counts = result.get_counts()
print("counts:", counts)

r = len(counts)
print(f"r: {r}")

if r % 2 == 0 and pow(a, r // 2, N) != N - 1:
    factor1 = np.gcd(pow(a, r // 2) - 1, N)
    factor2 = np.gcd(pow(a, r // 2) + 1, N)
    print(f"{N} = {factor1} * {factor2}")
else:
    print("Invalid a!")