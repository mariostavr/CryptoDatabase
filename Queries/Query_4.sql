SELECT user_rate_tradingpage.user_username AS username, date_time,tradingpage.pName AS platform, comment, rating 
FROM user_rate_tradingpage JOIN tradingpage ON user_rate_tradingpage.Tradingpage_idTradingPage=tradingpage.idTradingPage
WHERE pName='binance'