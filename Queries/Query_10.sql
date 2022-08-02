WITH A AS(
SELECT 
	wallet_review.walletName As nameWallet,
    wallet.url,wallet.idWallet , 
    CAST(ROUND(AVG(rating),2) AS DEC(10,2))
    avg_rating
FROM wallet_review JOIN wallet ON wallet_review.idWallet = wallet.idWallet
Group By nameWallet, url
HAVING avg_rating >= 4
)
,
B AS (
SELECT cryptocurrency_code ,A.idWallet ,nameWallet,url,avg_rating
FROM A JOIN cryptocurrency_has_wallet ON A.idWallet = cryptocurrency_has_wallet.Wallet_idWallet
)

SELECT nameWallet ,url,avg_rating ,cryptoName
FROM B JOIN cryptocurrency ON B.cryptocurrency_code = cryptocurrency.code
WHERE cryptoName='Solana'

