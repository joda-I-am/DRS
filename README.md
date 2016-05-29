# DRS
## Disclaimer
This Distributed Reputation System was developed as a university project at UQ using the Ethereum platform.
It was designed and developed by Samuel Colbran, Jonathan Daniels, Andrew Whalley, Ben Gordon and Nash Gao, May 2016.
## How to Run
### Install Mix
In order to run the DRS on a local blockchain you need to install Mix. In order to do this, follow the instructions here:
https://gavofyork.gitbooks.io/turboethereum/content/chapter1.html
### Download this Repository
Download this repo to your local machine and save it in a directory of your choosing.
### Open a project in Mix
There are two projects that can be run: Junkyard and Coin3. They are simple implementations that make use of the reputation contract.
Open Mix and select Open Project. Go to the directory for Junkyard or Coin3 and select open.
### Setup in Mix
The project should have opened. You will see the blockchain in the right-hand pane and the website in the middle.
(If there is an error about the reputation contract not being found, navigate to the parent folder on the left pane by clicking the '..' link).
If this didn't fix the problem, then please raise an issue.
If it did, the next thing that needs to be setup is the blockchain. Remove all contracts currently setup in the blockchain.
Click on the "+" button on the right pane and select "Add Transaction...". Select the "Reputation" contract from the drop down and click "OK".
Now click the "+" button on the right pane and select "Add Transaction..." again. Select "Junkyard" or "SimpleCoin" depending on which project is loaded. From the next dropdown select "Reputation".
### Run the Program
#### Junkyard
The Junkyard is a decentralised trading service where users can sell stuff to others. 
As the system is decentralised, being scammed is a real posibility. To mitigate this risk, the Junkyard integrates with the reputation system to assign a level of trust to users.
First a user creates an item "Junk" to sell. Once listed, this product becomes available for other users to buy. When a user buys a product they are presented with a one time use reputation token to file for the seller of the junk.
#### Coin3
Coin3 works by selecting a user to mint a coin. This adds a balance to the user's account. Next, for some sevice provided by another user (Happens outside this transaction), send some coins to that user. Upon doing this, you will receive a reputation token to fill in for the service provider. This is the same concept as rating a product you buy on Amazon or Ebay. The reputation token is yes or no and is only available once.
