# Files for testing the contracts on a Foundry project
* Initiate a Foundry project.
* Import the [Donable Solidity](https://github.com/salvadorjesus/Donable-Solidity) repository into the Foundry project:
```
forge install salvadorjesus/Donable-Solidity
```
* Copy [DocumentRegistry.sol](https://github.com/salvadorjesus/DocumentRegistryAndTimestamp-Dapp/blob/dev/DocumentRegistry.sol) from this repository into the `src` folder.
* In DocumentRegistry.sol, change the line `import "github.com/salvadorjesus/Donable-Solidity/blob/master/Donable.sol";`
for:
```
import "Donable-Solidity/Donable.sol";
```
* Copy the tests on this folder into the `test` folder.
* To run tests:
```
forge test
```
