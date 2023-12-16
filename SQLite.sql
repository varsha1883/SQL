CREATE TABLE rolling_average AS
SELECT 
    DATE(transaction_time) AS date,
    AVG(SUM(transaction_amount)) OVER (
        ORDER BY DATE(transaction_time)
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_avg
FROM 
    transactions
GROUP BY 
    DATE(transaction_time)
HAVING 
    DATE(transaction_time) <= '2021-01-31'
ORDER BY 
    date;
