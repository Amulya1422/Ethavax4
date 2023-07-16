require("@nomicfoundation/hardhat-toolbox");


const FORK_FUJI = true;

let forkingData = undefined;

if (FORK_FUJI) {
  forkingData = {
    url: "https://api.avax-test.network/ext/bc/C/rpc",
  };
}

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  networks: {
    hardhat: {
      gasPrice: 225000000000,
      chainId: !forkingData ? 43112 : undefined, //Only specify a chainId if we are not forking
      forking: forkingData,
    },
    fuji: {
      url: "https://api.avax-test.network/ext/bc/C/rpc",
      gasPrice: 225000000000,
      chainId: 43113,
      accounts: ["ea6c44ac03bff858b476bba40716402b03e41b8e97e276d1baec7c37d42484a0"], // we use a .env file to hide our wallets private key
    },
    
  },
  etherscan: {
    apiKey:"C77JCDPB6N788JTK9UW8EUYEJFBC7PFIFR" , // we use an .env file to hide our Snowtrace API KEY
  },
};
