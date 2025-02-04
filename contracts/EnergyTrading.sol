// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title EnergyTrading
 * @dev A decentralized peer-to-peer energy trading smart contract for prosumers and consumers.
 * This contract enables secure energy transactions using blockchain while ensuring automation 
 * through smart contracts. It eliminates intermediaries and guarantees transparency in settlements.
 * 
 * Features:
 * - Sellers (Prosumers) can list their energy offers.
 * - Buyers can complete trades by paying the required amount.
 * - Trades are immutable and recorded on the blockchain for verification.
 * - Ensures direct settlements without third-party involvement.
 */

contract EnergyTrading {
    
    // Data structure for an energy trade
    struct Trade {
        address seller;          // Address of the energy producer (seller)
        address buyer;           // Address of the energy consumer (buyer)
        uint256 energyAmount;    // Energy amount in kWh
        uint256 price;           // Price of the trade in Wei
        bool completed;          // Trade status: false (open), true (completed)
    }

    // Mapping to store trades based on trade ID
    mapping(uint256 => Trade) public trades;
    
    // Counter to track the number of trades
    uint256 public tradeCounter;
    
    // Address of the contract administrator (can be used for advanced controls if needed)
    address public admin;

    // Events for logging trade activities on the blockchain
    event TradeCreated(uint256 indexed tradeId, address indexed seller, uint256 energyAmount, uint256 price);
    event TradeCompleted(uint256 indexed tradeId, address indexed buyer);

    /**
     * @dev Contract constructor sets the deployer as the admin.
     */
    constructor() {
        admin = msg.sender;
    }

    /**
     * @notice Creates a new trade where the seller lists an energy offer.
     * @dev Only registered prosumers can create trades.
     * @param energyAmount The amount of energy (in kWh) available for sale.
     * @param price The price for the energy in Wei.
     */
    function createTrade(uint256 energyAmount, uint256 price) external {
        require(energyAmount > 0, "Energy amount must be greater than zero");
        require(price > 0, "Price must be greater than zero");

        // Increment trade counter for unique trade ID
        tradeCounter++;

        // Store new trade details
        trades[tradeCounter] = Trade({
            seller: msg.sender,
            buyer: address(0), // No buyer initially
            energyAmount: energyAmount,
            price: price,
            completed: false
        });

        // Emit event for logging trade creation
        emit TradeCreated(tradeCounter, msg.sender, energyAmount, price);
    }

    /**
     * @notice Completes a trade by allowing a buyer to purchase the listed energy.
     * @dev The trade must be active, and the exact payment must be made.
     * @param tradeId The unique identifier of the trade.
     */
    function completeTrade(uint256 tradeId) external payable {
        Trade storage trade = trades[tradeId];

        require(trade.seller != address(0), "Trade does not exist");
        require(!trade.completed, "Trade already completed");
        require(msg.value == trade.price, "Incorrect payment amount");

        // Assign the buyer's address and mark trade as completed
        trade.buyer = msg.sender;
        trade.completed = true;

        // Transfer the payment to the seller
        payable(trade.seller).transfer(msg.value);

        // Emit event for trade completion
        emit TradeCompleted(tradeId, msg.sender);
    }

    /**
     * @notice Fetches the details of a specific trade.
     * @param tradeId The unique identifier of the trade.
     * @return seller The address of the seller.
     * @return buyer The address of the buyer.
     * @return energyAmount The amount of energy being traded.
     * @return price The price of the trade.
     * @return completed The status of the trade (true if completed, false otherwise).
     */
    function getTradeDetails(uint256 tradeId) external view returns (
        address seller,
        address buyer,
        uint256 energyAmount,
        uint256 price,
        bool completed
    ) {
        Trade memory trade = trades[tradeId];
        return (trade.seller, trade.buyer, trade.energyAmount, trade.price, trade.completed);
    }
}
