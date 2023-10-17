# Homework-3

#### 1 - What are the advantages and disadvantages of the 256 bit word length in the EVM?

The 256-bit word length in the EVM offers advantages in terms of precision, security, compatibility, and flexibility, but it comes with disadvantages such as increased gas costs, storage requirements, slower execution, and added complexity. The choice of word length was a trade-off made in Ethereum's design to meet the diverse needs of its applications while maintaining backward compatibility with existing contracts.

References:

- <a href="https://chat.openai.com/c/db2caa18-db95-4331-8922-5832813b283e">Chat GPT</a>
- <a href="https://ethereum.org/en/developers/tutorials/yellow-paper-evm/#91-basics">Yellow Paper EVM Basics</a>
- <a href="https://ethereum.org/en/developers/docs/evm/#evm-instructions">Ethereum docs EVM instructions</a>

#### 2 - What would happen if the implementation of a precompiled contract varied between Ethereum clients?

Precompiled contracts are essential smart contracts that perform specific operations efficiently, typically at the EVM (Ethereum Virtual Machine) level. They are considered part of the Ethereum protocol.

Consensus Breakdown: Ethereum relies on consensus among its nodes to validate and execute transactions. If different clients have inconsistent implementations of precompiled contracts, nodes may disagree on the results of specific operations. This can break consensus and result in a fork of the Ethereum blockchain.

Security Risks: Inconsistent implementations may introduce vulnerabilities or bugs that could be exploited by malicious actors. These vulnerabilities could be used to attack the network, steal funds, or disrupt the proper functioning of Ethereum.

Compatibility Issues: Differing implementations can cause compatibility issues between clients. Transactions and smart contracts that work on one client may not work correctly on another. This can lead to fragmentation of the Ethereum network, making it challenging for developers to build universally compatible applications.

User Confusion: Users may experience confusion or frustration if they interact with the Ethereum network using different clients, as they may receive different results or error messages for the same operations.

Upgrades and Forks: When Ethereum undergoes network upgrades or forks (e.g., hard forks like Ethereum's Istanbul or Berlin upgrades), the consistency of precompiled contract implementations across clients is crucial to ensure smooth transitions. Inconsistent implementations can complicate the upgrade process and hinder network stability.

#### 3 - Using Remix write a simple contract that uses a memory variable, then using the debugger step through the function and inspect the memory.
