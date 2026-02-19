SELECT 
    Date,
    CAST(REPLACE(Close, ',', '') AS REAL) AS clean_price,
    AVG(CAST(REPLACE(Close, ',', '') AS REAL)) OVER (
        ORDER BY Date 
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS Moving_Avg_7d
FROM bitcoin_history
ORDER BY Date DESC
LIMIT 10;