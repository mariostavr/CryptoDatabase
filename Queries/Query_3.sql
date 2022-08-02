SELECT pName, url, fees 
FROM tradingpage 
WHERE fees IN (SELECT MIN(fees) FROM tradingpage)
