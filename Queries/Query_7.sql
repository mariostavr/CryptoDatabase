WITH A AS(
SELECT Wallet_idWallet
FROM cryptocurrency  JOIN cryptocurrency_has_wallet ON cryptocurrency.code=cryptocurrency_has_wallet.Cryptocurrency_code
WHERE cryptocurrency.cryptoName IN ('Bitcoin','Ethereum')
GROUP BY Wallet_idWallet
HAVING COUNT(DISTINCT cryptocurrency.cryptoName) = 2
)
SELECT walletName,url 
FROM A JOIN wallet ON A.Wallet_idWallet=wallet.idWallet