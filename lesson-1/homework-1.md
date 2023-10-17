# Homework-1

#### 1 - Why is client diversity important for Ethereum ?

A diversity of clients makes the network more resilient to attacks and bugs.

#### 2 - Where is the full Ethereum state held ?

Every ethereum node.

#### 3 - What is a replay attack ? , which 2 pieces of information can prevent it ?

A replay attack occurs when a malicious entity sees a transaction on either the original network or the forked network and then copies the details of the transaction and re-broadcasts the transaction on the other network - this creates an identical transaction on both networks.
Adding the chain id and nonce to the transaction signature can prevent it. View more at <a href="https://eips.ethereum.org/EIPS/eip-155">EIP-155</a>.

#### 4 - In a contract, how do we know who called a view function ?

We don’t.
