At the top of the Deploy & Run panel, The field labeled "Value” (next to “Gas limit”).

This is where you specify how much Ether to send.

Example: enter 1 and select ether in the dropdown (so Remix sends 1 ETH).

In the donate section:

It asks for a string argument: _name

Enter your name in quotes, for example: "John"

Click transact to call the function.

This will:

Send the Ether into the contract.

Store your name + donation.

Emit a DonationReceived event (you can view it under Remix’s Logs tab).

Update totalDonations.

Check Data

You can now check:

getContractBalance() → should show 1000000000000000000 //that’s 1 ETH in wei

totalDonations() → should match the same amount

donors(your_address) → enter the address that donated (from Remix’s account list)

It'll look like this: 

0: "John"
1: "1000000000000000000"

Withdraw Funds (as Owner)

If you switch back to the owner’s address (the one that deployed the contract):

Call withdrawFunds().

This will:

Transfer all Ether from the contract to the owner’s address.

Emit FundsWithdrawn(owner, amount) event.

Then you can call getContractBalance() again → it should be 0.
