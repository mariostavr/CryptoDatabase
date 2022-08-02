SELECT cryptoName, code, marketCap 
FROM cryptocurrency
WHERE marketCap IN (SELECT MAX(marketCap) FROM cryptocurrency)