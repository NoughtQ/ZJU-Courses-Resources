from numpy import pi
from qiskit import QuantumCircuit, transpile
from qiskit.providers.basic_provider import BasicSimulator

def qft(qc:QuantumCircuit) -> QuantumCircuit:
    for i in range(qc.num_qubits - 1, -1, -1):
        qc.h(i)
        for j in range(i - 1, -1, -1):
            qc.cp(pi / 2 ** (i - j), j, i)
    for i in range(qc.num_qubits // 2):
        qc.swap(i, qc.num_qubits - i - 1)
    return qc

# TODO: change the number of qubits
n_qubits = 2
qc = QuantumCircuit(n_qubits)

# TODO: add quantum gate to set the initial state
little_endian_bits = [int(bit) for bit in reversed("10")]
for idx, bit in enumerate(little_endian_bits):
    if bit == 1:
        qc.x(idx)

qc = qft(qc)
qc.measure_all()
print(qc)

backend = BasicSimulator()
tqc = transpile(qc, backend)
result = backend.run(tqc).result()
counts = result.get_counts()
print(counts)