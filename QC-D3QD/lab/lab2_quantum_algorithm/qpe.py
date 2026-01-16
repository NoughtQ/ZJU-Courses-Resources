from __future__ import annotations

from typing import Iterable, Optional

import numpy as np
from numpy import pi
from qiskit import ClassicalRegister, QuantumCircuit, QuantumRegister, transpile
from qiskit.circuit.library import QFTGate
from qiskit.providers.basic_provider import BasicSimulator


def build_qpe_circuit(
    theta: float,
    n_count: int = 3,
    eigen_state: Optional[str] = "1",
    eigen_vector: Optional[Iterable[complex]] = None,
) -> QuantumCircuit:
    """Rebuild the qpe.png circuit while allowing configurable angles and states."""
    if n_count <= 0:
        raise ValueError("Counting register must contain at least one qubit.")

    qr_count = QuantumRegister(n_count, "count")
    qr_eval = QuantumRegister(1, "eval")
    cr = ClassicalRegister(n_count, "meas")
    qc = QuantumCircuit(qr_count, qr_eval, cr)

    # Prepare the eigen / probe register.
    if eigen_vector is not None:
        state = np.array(list(eigen_vector), dtype=complex)
        if state.shape != (2,):
            raise ValueError("Eigen vector must contain two amplitudes.")
        norm = np.linalg.norm(state)
        if np.isclose(norm, 0.0):
            raise ValueError("Eigen vector must be non-zero.")
        qc.initialize(state / norm, qr_eval[0])
    elif eigen_state == "1":
        qc.x(qr_eval[0])
    elif eigen_state == "0":
        pass
    else:
        raise ValueError("Eigen state must be '0' or '1'.")

    # Apply Hadamard gates to prepare a uniform superposition on the counting qubits.
    for qubit in qr_count:
        qc.h(qubit)

    # Repeat the controlled phase gate 2^k times to match the 1/2/4 pattern from qpe.png.
    for k, qubit in enumerate(qr_count):
        repetitions = 2**k
        for _ in range(repetitions):
            qc.cp(theta, qubit, qr_eval[0])

    # Apply the inverse QFT on the counting register.
    qft = QFTGate(n_count)
    qc.append(qft.inverse(), qr_count[:])

    qc.measure(qr_count, cr)
    return qc


def run_qpe(
    theta: float,
    n_count: int = 3,
    eigen_state: Optional[str] = "1",
    eigen_vector: Optional[Iterable[complex]] = None,
    shots: int = 4096,
) -> dict[str, int]:
    qc = build_qpe_circuit(theta, n_count, eigen_state, eigen_vector)
    print(qc)

    backend = BasicSimulator()
    tqc = transpile(qc, backend)
    result = backend.run(tqc, shots=shots).result()
    counts = result.get_counts()
    print(counts)
    return counts


if __name__ == "__main__":
    print("QPE with theta=pi/4 and eigenstate |1>:")
    run_qpe(pi / 4, n_count=3, eigen_state="1")

    print("\nQPE with theta=2pi/3 and eigenstate |1>:")
    run_qpe(2 * pi / 3, n_count=3, eigen_state="1")

    print("\nQPE with theta=pi/4 and probe state [3/5, 4/5]^T:")
    run_qpe(pi / 4, n_count=3, eigen_vector=[3 / 5, 4 / 5])
