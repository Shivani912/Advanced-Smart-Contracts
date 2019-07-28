const ethers = require('ethers');
// Create a wallet to sign the message with
let privateKey = 'YOUR PRIVATE KEY';
let provider = ethers.getDefaultProvider('ropsten');
let wallet = new ethers.Wallet(privateKey, provider);

console.log(wallet.address);

let message = "0xca44444444444444444444444435b7d915458ef540ade6068dfe2f44e8fa733c";
let flatSig = [];

async function getSig() {
  // Sign the string message (format provided by JSON-RPC responses)
  flatSig = await wallet.signMessage(message);
  // For Solidity, we need the expanded-format of a signature
  let sig = ethers.utils.splitSignature(flatSig);
  console.log(sig);
}
getSig();

