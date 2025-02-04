# **EnergyChain Project**

## **Project Overview**
The **EnergyChain Project** represents an ambitious and forward-thinking approach to revolutionizing the renewable energy market. By seamlessly integrating blockchain technology, IoT devices, and cutting-edge cryptographic methods such as ZK-SNARKs, this initiative tackles critical challenges like energy security, equitable distribution, and environmental sustainability. It strives to create an energy trading ecosystem that is efficient, transparent, and decentralized while preserving privacy and ensuring trust among participants.

### **Key Features**
- **Peer-to-Peer Energy Trading:** Enabling secure, automated transactions directly between energy producers and consumers using robust blockchain-based smart contracts.
- **IoT Integration:** Leveraging IoT devices to provide real-time, accurate monitoring of energy production and consumption data.
- **Privacy-Preserving Data Sharing:** Employing ZK-SNARKs to validate data integrity while safeguarding sensitive trading information.
- **Carbon Credit Automation:** Streamlining the issuance and verification of carbon credits through blockchain, ensuring accountability and transparency.
- **Blockchain Transparency:** Establishing an immutable ledger that guarantees auditable and tamper-proof records of energy trades and related operations.

---

## **Directory Structure**
This project is systematically organized to facilitate clarity and ease of use. Below is the directory structure:

```
📂 EnergyChain_Project/
   ├── 📜 .venv/                  # Virtual environment files (local dependencies, excluded in submission)
   ├── 📜 build/
   │    ├── contracts/            # Truffle build artifacts
   │    │    ├── EnergyTrading.json
   │    │    ├── Migrations.json
   ├── 📜 contracts/              # Solidity smart contracts
   │    ├── EnergyTrading.sol     # Main contract managing energy trades
   │    ├── Migrations.sol        # Migration tracker contract
   ├── 📜 iot/                    # IoT integration scripts
   │    ├── mqtt_energy_publisher.py  # MQTT-based IoT data simulation
   ├── 📜 migrations/             # Deployment scripts
   │    ├── 1_initial_migration.js
   │    ├── 2_deploy_contracts.js
   ├── 📜 zk_snarks/              # ZK-SNARK proof generation and validation
   │    ├── zk_energy_proof.py    # Proof generator and validator script
   ├── 📜 README.md               # Project documentation
   ├── 📜 truffle-config.js       # Configuration file for Truffle
   ├── 📜 requirements.txt        # Python dependencies
```

### **Files Excluded from Submission**
- `.venv/` directory: Contains environment-specific dependencies and should not be included in the final ZIP.
- Temporary or test files (if present).

---

## **Setup Instructions**

### **Dependencies**
To ensure the project runs smoothly, please follow these installation steps:

1. **Install Node.js and npm:**
   Download and install from the [Node.js Official Website](https://nodejs.org/).
   Verify installation:
   ```bash
   node -v
   npm -v
   ```

2. **Install Python (3.9+):**
   Download and install from the [Python Official Website](https://www.python.org/).
   Verify installation:
   ```bash
   python --version
   pip --version
   ```

3. **Install Required Packages:**
   - **Truffle Framework:** Install globally using npm:
     ```bash
     npm install -g truffle
     ```
   - **Python Libraries:** Install the necessary Python libraries using pip:
     ```bash
     pip install -r requirements.txt
     ```

4. **Install Ganache:**
   Download and set up Ganache from the [Ganache Official Website](https://trufflesuite.com/ganache/).

5. **Recreate the Virtual Environment (Optional):**
   If you want to create a virtual environment for Python dependencies, follow these steps:
   ```bash
   python -m venv .venv
   source .venv/bin/activate  # Use .venv\Scripts\activate on Windows
   pip install -r requirements.txt
   ```

---

## **How to Run**

### **Step 1: Deploy Smart Contracts**
1. Navigate to the project directory and compile the smart contracts:
   ```bash
   truffle compile
   ```
2. Deploy the contracts to a local blockchain using Ganache:
   ```bash
   truffle migrate --network development
   ```
3. Note the deployed contract addresses, which can be found in the Ganache "TRANSACTIONS" tab.

### **Step 2: Simulate IoT Data**
1. Move to the IoT directory:
   ```bash
   cd iot
   ```
2. Run the MQTT publisher script to simulate IoT energy data generation:
   ```bash
   python mqtt_energy_publisher.py
   ```

### **Step 3: Generate and Validate ZK-SNARK Proofs**
1. Navigate to the ZK-SNARK directory:
   ```bash
   cd zk_snarks
   ```
2. Run the proof generator and validator script:
   ```bash
   python zk_energy_proof.py
   ```

---

## **Integration Workflow**

### **1. IoT Integration**
IoT devices, represented by `mqtt_energy_publisher.py`, generate real-time energy data. This data is structured in JSON format and sent to the blockchain for further processing.

### **2. Privacy-Preserving Validation**
The `zk_energy_proof.py` script uses ZK-SNARKs to validate the energy data. These proofs ensure the integrity of the data while maintaining the confidentiality of sensitive information.

### **3. Blockchain Transactions**
The deployed smart contracts facilitate core energy trading operations, such as creating trades and issuing payments. All transactions are transparently recorded on the blockchain and can be viewed in Ganache.

---

## **Live Demonstration Steps**

### **Step 1: Verify Smart Contract Deployment**
1. Open Ganache.
2. Check the "TRANSACTIONS" tab to ensure the contracts are deployed correctly.

### **Step 2: Simulate IoT Data**
1. Run `mqtt_energy_publisher.py` to simulate smart meter data being published.
2. Inspect Ganache logs for incoming transactions that reflect this data.

### **Step 3: Validate ZK-SNARK Proofs**
1. Execute `zk_energy_proof.py` to generate and verify ZK-SNARK proofs for the data.
2. Confirm successful validation through the script output.

### **Step 4: Review Transactions in Ganache**
1. Check the "CONTRACTS" tab in Ganache to verify interactions with the smart contracts (e.g., `createTrade` function calls).

---

## **Submission Guidelines**

1. **Prepare Files for Submission:**
   - Include all necessary files from the project directory, excluding `.venv/` and temporary files.
   - Ensure the `README.md` file and the final report (`EnergyChain Challenge.pdf`) are included.

2. **Create a ZIP Archive:**
   Use the following command to package the project:
   ```bash
   zip -r EnergyChain_Final_Submission.zip EnergyChain_Project
   ```

3. **Submit Files:**
   Upload the ZIP archive along with the final report to the designated competition submission portal.

---

## **Important Notes**
- Double-check that all scripts are functional and thoroughly tested before submission.
- Validate the logs in Ganache to confirm successful transactions and interactions.
- Emphasize the innovative features and scalability of the solution in the final report to maximize competition scoring potential.

---


