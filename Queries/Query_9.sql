SELECT 
	trading_page_review.pName As namePage,
    tradingpage.url,
    CAST(ROUND(AVG(rating),2) AS DEC(10,2))
    avg_rating
FROM trading_page_review JOIN tradingpage ON trading_page_review.idTradingPage = tradingpage.idTradingPage
Group By namePage, url
HAVING avg_rating >= 4