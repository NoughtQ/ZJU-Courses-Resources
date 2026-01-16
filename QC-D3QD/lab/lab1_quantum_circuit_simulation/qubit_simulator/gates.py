import numpy as np
from typing import Union


class Gates:
    """
    A class that represents the quantum gates.
    """

    # Hadamard (H) gate
    H: np.ndarray = np.array([[1, 1], [1, -1]]) / np.sqrt(2)
    # π/8 (T) gate
    T: np.ndarray = np.array([[1, 0], [0, np.exp(1j * np.pi / 4)]])
    # Pauli-X (NOT) gate
    X: np.ndarray = np.array([[0, 1], [1, 0]])

    @staticmethod
    def U(theta: float, phi: float, lambda_: float) -> np.ndarray:
        """
        Generic (U) gate.

        :param theta: Angle theta.
        :param phi: Angle phi.
        :param lambda_: Angle lambda.
        :return: Unitary matrix representing the U gate.
        """
        return np.array(
            [
                [np.cos(theta), -np.exp(1j * lambda_) * np.sin(theta)],
                [
                    np.exp(1j * phi) * np.sin(theta),
                    np.exp(1j * (phi + lambda_)) * np.cos(theta),
                ],
            ]
        )

    @staticmethod
    def create_controlled_gate(
        gate: np.ndarray, control_qubit: int, target_qubit: int, num_qubits: int
    ) -> np.ndarray:
        """
        Creates a controlled gate.

        :param gate: Matrix representing the gate.
        :param control_qubit: Index of the control qubit.
        :param target_qubit: Index of the target qubit.
        :param num_qubits: Total number of qubits.
        :return: Matrix representing the controlled gate.
        """
        controlled_gate = np.eye(2**num_qubits, dtype=complex)
        for basis in range(2**num_qubits):
            basis_binary = format(basis, f"0{num_qubits}b")
            if basis_binary[control_qubit] == "1":
                target_state = int(
                    basis_binary[:target_qubit]
                    + str(1 - int(basis_binary[target_qubit]))
                    + basis_binary[target_qubit + 1 :],
                    2,
                )
                controlled_gate[basis, basis] = gate[
                    int(basis_binary[target_qubit]), int(basis_binary[target_qubit])
                ]
                controlled_gate[basis, target_state] = gate[
                    int(basis_binary[target_qubit]), 1 - int(basis_binary[target_qubit])
                ]
                controlled_gate[target_state, basis] = gate[
                    1 - int(basis_binary[target_qubit]), int(basis_binary[target_qubit])
                ]
                controlled_gate[target_state, target_state] = gate[
                    1 - int(basis_binary[target_qubit]),
                    1 - int(basis_binary[target_qubit]),
                ]
        return controlled_gate

    @staticmethod
    def create_inverse_gate(gate: np.ndarray) -> np.ndarray:
        """
        Creates an inverse gate.

        :param gate: Matrix representing the gate.
        :return: Matrix representing the inverse gate.
        """
        return np.conjugate(gate.T)

    @staticmethod
    def _validate_gate(gate: np.ndarray):
        """
        Validates the gate.

        :param gate: Matrix representing the gate.
        :raises ValueError: If the gate is invalid.
        """
        if not np.allclose(
            gate @ Gates.create_inverse_gate(gate), np.eye(gate.shape[0])
        ):
            raise ValueError(
                "The gate must be unitary. Its conjugate transpose must be equal to its inverse."
            )
