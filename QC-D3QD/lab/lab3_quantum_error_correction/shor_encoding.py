from qiskit import QuantumCircuit
from qiskit.quantum_info import Statevector

def shor_encoding(qc: QuantumCircuit):
    # Phase flip encoding part
    # 0 -> +++, 1 -> ---
    # Done by CNOTs to spread 0/1 to ancillas, then H to change basis
    qc.cx(0, 3)
    qc.cx(0, 6)
    qc.h(0)
    qc.h(3)
    qc.h(6)
    
    # Bit flip encoding part
    # + -> (|000> + |111>)/sqrt(2)
    # This is done by standard bit flip code encoding on each block of 3
    qc.cx(0, 1)
    qc.cx(0, 2)
    
    qc.cx(3, 4)
    qc.cx(3, 5)
    
    qc.cx(6, 7)
    qc.cx(6, 8)

if __name__ == "__main__":
    # Case 1: Encode |0> and print statevector
    qc = QuantumCircuit(9)
    # Default state is |00...0>, so input logical qubit 0 is |0>
    shor_encoding(qc)
    print("Circuit:")
    print(qc)
    
    print("\nStatevector for logical |0>:")
    state = Statevector.from_instruction(qc)
    print(state)

    # Case 2: Encode |1>
    qc_one = QuantumCircuit(9)
    qc_one.x(0) # Prepare |1>
    shor_encoding(qc_one)
    
    print("\nStatevector for logical |1>:")
    state_one = Statevector.from_instruction(qc_one)
    print(state_one)
