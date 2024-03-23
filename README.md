# Social Learn, Verify To Earn Platform

### Getting Started

## Installations
-cd GpgVerify
-cd cartesi-machine
-$ docker-compose up
- ./build-cartesi-machine.sh ../../compute-env/machines

## Deployment
-$ yarn
-$ npx hardhat deploy --network localhost
-$ npx hardhat console --network localhost

## Hardhat configurations
-$ yarn add @cartesi/compute-sdk
-$ yarn add ethers hardhat hardhat-deploy hardhat-deploy-ethers --dev
-$ yarn add typescript ts-node --dev

## Languages&Stack
- Reactjs
- Solidity
- GPG Verify machine
- cartesi compute sdk
  
### Database configurations
- Create Mongodb Cloud Atlas account . Visit https://www.mongodb.com/cloud/atlas/register
- Configure your application/project to connect with the database for user authentication storage
- Test using Postman that mongodb is connected to your project.

## Get the frontend and backend running simultaneously:
  - go to WBTK-frontend and run npm run dev
  - go to the browser and run localhost:5173
  - Test the application by logging in your credentials.

## Architecture diagram
![architecture dgm for cartesi rollup](https://github.com/WBT-Kenya/Learn-Verify-Earn-app/assets/9214845/402c46bf-c9f3-4ce2-a0ee-2cb811c53b33)

