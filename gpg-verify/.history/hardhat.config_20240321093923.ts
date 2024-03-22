import { HardhatUserConfig } from "hardhat/config";

import "hardhat-deploy";
import "hardhat-deploy-ethers";

const config: HardhatUserConfig = {
  networks: {
    localhost: {
      url: "http://localhost:8545",
    },
  },
  solidity: {
    version: "0.7.4",
  },
  external: {
    contracts: [
      {
        artifacts: "node_modules/@cartesi/compute-sdk/export/artifacts",
        deploy: "node_modules/@cartesi/compute-sdk/dist/deploy",
      },
    ],
    deployments: {
      localhost: ["../compute-env/deployments/localhost"],
    },
  },
  namedAccounts: {
    deployer: {
      default: 0,
    },
    alice: {
      default: 0,
    },
    bob: {
      default: 1,
    },
  },
};

export default config;