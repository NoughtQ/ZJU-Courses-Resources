from qiskit import QuantumCircuit, QuantumRegister, ClassicalRegister, transpile
from qiskit_aer import AerSimulator
from shor_encoding import shor_encoding
from syndrome_measurement import syndrome_measurement, random_error

def error_correction(qc: QuantumCircuit):
    # --- Block 1 Correction (sz0) ---
    # Value 1 (01): Error q0
    with qc.if_test((qc.cregs[0], 1)):
        qc.x(0)
    # Value 2 (10): Error q2
    with qc.if_test((qc.cregs[0], 2)):
        qc.x(2)
    # Value 3 (11): Error q1
    with qc.if_test((qc.cregs[0], 3)):
        qc.x(1)

    # --- Block 2 Correction (sz1) ---
    # Value 1 (01): Error q3
    with qc.if_test((qc.cregs[1], 1)):
        qc.x(3)
    # Value 2 (10): Error q5
    with qc.if_test((qc.cregs[1], 2)):
        qc.x(5)
    # Value 3 (11): Error q4
    with qc.if_test((qc.cregs[1], 3)):
        qc.x(4)

    # --- Block 3 Correction (sz2) ---
    # Value 1 (01): Error q6
    with qc.if_test((qc.cregs[2], 1)):
        qc.x(6)
    # Value 2 (10): Error q8
    with qc.if_test((qc.cregs[2], 2)):
        qc.x(8)
    # Value 3 (11): Error q7
    with qc.if_test((qc.cregs[2], 3)):
        qc.x(7)

    # --- Phase Correction (sx) ---
    # Value 1 (01): Error Block 1 -> Z on q0
    with qc.if_test((qc.cregs[3], 1)):
        qc.z(0)
    # Value 2 (10): Error Block 3 -> Z on q6
    with qc.if_test((qc.cregs[3], 2)):
        qc.z(6)
    # Value 3 (11): Error Block 2 -> Z on q3
    with qc.if_test((qc.cregs[3], 3)):
        qc.z(3)

if __name__ == "__main__":
    print("Testing Error Correction with AerSimulator...")

    qr = QuantumRegister(9+8) # first 9 data qubits for logical state, rest 8 ancilla qubits for syndrome measurement
    sz0 = ClassicalRegister(2, "sz0") # register for syndrome Z_1Z_2 and Z_2Z_3
    sz1 = ClassicalRegister(2, "sz1") # register for syndrome Z_4Z_5 and Z_5Z_6
    sz2 = ClassicalRegister(2, "sz2") # register for syndrome Z_7Z_8 and Z_8Z_9
    sx = ClassicalRegister(2, "sx") # register for syndrome X_1X_2X_3X_4X_5X_6 and X_4X_5X_6X_7X_8X_9

    backend = AerSimulator()
    
    # Test all possible single qubit errors (X and Z for each of 9 qubits)
    possible_errors = []
    for i in range(9):
        possible_errors.append((i, 'X'))
        possible_errors.append((i, 'Z'))

    passed_all = True
    print(f"{'Error Type':<15} {'Qubit':<10} {'Final Syndrome':<20} {'Result'}")
    print("-" * 60)

    for (q_idx, gate_type) in possible_errors:
        qc = QuantumCircuit(qr, sz0, sz1, sz2, sx)
        shor_encoding(qc)
        
        # Apply error
        if gate_type == 'X':
            qc.x(q_idx)
        else:
            qc.z(q_idx)

        syndrome_measurement(qc)
        error_correction(qc)
        syndrome_measurement(qc)

        tqc = transpile(qc, backend)
        result = backend.run(tqc, shots=1).result()
        counts = result.get_counts()
        
        measured_key = list(counts.keys())[0]

        is_success = (measured_key.replace(" ", "") == "0"*8)
        status = "PASSED" if is_success else "FAILED"
        if not is_success:
            passed_all = False
            
        print(f"{gate_type:<15} {q_idx:<10} {measured_key:<20} {status}")

    if passed_all:
        print("\nAll single qubit errors were successfully corrected!")
    else:
        print("\nSome errors failed to be corrected.")
