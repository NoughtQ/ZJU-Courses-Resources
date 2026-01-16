import random
from qiskit import QuantumCircuit, QuantumRegister, ClassicalRegister, transpile
from qiskit.providers.basic_provider import BasicSimulator
from shor_encoding import shor_encoding

def random_error(qc: QuantumCircuit):
    """
    Apply a random Pauli-X or Pauli-Z error to a random qubit.
    """
    qubit_id = random.randint(0, 8) # 0 to 8 for data qubits
    noise_gate = random.choice(["X", "Z"])
    if noise_gate == "X":
        qc.x(qubit_id)
    elif noise_gate == "Z":
        qc.z(qubit_id)
    print(f"Random Pauli-{noise_gate} error on qubit {qubit_id}.")

def syndrome_measurement(qc: QuantumCircuit):
    """
    Perform syndrome measurement for 9-qubit Shor code.
    Ancillas 9-16 are used.
    stabilizers:
    Z1 Z2, Z2 Z3 -> sz0
    Z4 Z5, Z5 Z6 -> sz1
    Z7 Z8, Z8 Z9 -> sz2
    X1..X6, X4..X9 -> sx
    """
    # reset ancilla qubits
    for i in range(8):
        qc.reset(9+i)
    
    # --- Z-stabilizers (detect bit flips) ---
    # These use CNOT with Data as Control and Ancilla as Target
    
    # Z1 Z2 (q0, q1) -> ancilla 9 (sz0[0])
    qc.cx(0, 9)
    qc.cx(1, 9)
    qc.measure(9, qc.cregs[0][0]) 

    # Z2 Z3 (q1, q2) -> ancilla 10 (sz0[1])
    qc.cx(1, 10)
    qc.cx(2, 10)
    qc.measure(10, qc.cregs[0][1])

    # Z4 Z5 (q3, q4) -> ancilla 11 (sz1[0])
    qc.cx(3, 11)
    qc.cx(4, 11)
    qc.measure(11, qc.cregs[1][0])

    # Z5 Z6 (q4, q5) -> ancilla 12 (sz1[1])
    qc.cx(4, 12)
    qc.cx(5, 12)
    qc.measure(12, qc.cregs[1][1])

    # Z7 Z8 (q6, q7) -> ancilla 13 (sz2[0])
    qc.cx(6, 13)
    qc.cx(7, 13)
    qc.measure(13, qc.cregs[2][0])

    # Z8 Z9 (q7, q8) -> ancilla 14 (sz2[1])
    qc.cx(7, 14)
    qc.cx(8, 14)
    qc.measure(14, qc.cregs[2][1])

    # --- X-stabilizers (detect phase flips) ---
    # These use H on Ancilla, CNOT(Ancilla, Data), H on Ancilla
    
    # X1 X2 X3 X4 X5 X6 (q0..q5) -> ancilla 15 (sx[0])
    qc.h(15)
    for i in range(0, 6): # q0 to q5
        qc.cx(15, i)
    qc.h(15)
    qc.measure(15, qc.cregs[3][0])

    # X4 X5 X6 X7 X8 X9 (q3..q8) -> ancilla 16 (sx[1])
    qc.h(16)
    for i in range(3, 9): # q3 to q8
        qc.cx(16, i)
    qc.h(16)
    qc.measure(16, qc.cregs[3][1])

if __name__ == "__main__":
    qr = QuantumRegister(9+8) # first 9 data qubits for logical state, rest 8 ancilla qubits
    sz0 = ClassicalRegister(2, "sz0") # register for syndrome Z_1Z_2 and Z_2Z_3
    sz1 = ClassicalRegister(2, "sz1") # register for syndrome Z_4Z_5 and Z_5Z_6
    sz2 = ClassicalRegister(2, "sz2") # register for syndrome Z_7Z_8 and Z_8Z_9
    sx = ClassicalRegister(2, "sx") # register for syndrome X_1X_2X_3X_4X_5X_6 and X_4X_5X_6X_7X_8X_9
    
    qc = QuantumCircuit(qr, sz0, sz1, sz2, sx)
    shor_encoding(qc)
    
    # Inject random error
    print("Injecting error...")
    random_error(qc)
    
    print("Measuring syndrome...")
    syndrome_measurement(qc)
    
    backend = BasicSimulator()
    tqc = transpile(qc, backend)
    result = backend.run(tqc, shots=10).result() # Few shots since it's deterministic for Pauli errors
    counts = result.get_counts()
    print("\nMeasurement counts (Syndromes):")
    print(counts)
    
    syndrome_str = list(counts.keys())[0]
    print(f"Observed syndrome string: {syndrome_str}")
