SELECT * FROM RES_Food inner join 
	(SELECT itemID, COUNT(*) as quantity FROM RES_OrderDetail
		WHERE orderID IN (
			SELECT orderID FROM RES_Order WHERE orderTime > '2017-07-16')
		GROUP BY itemID
		
	) as detail
	on RES_Food.itemID = detail.itemID
	
	
--asdasd
SELECT orderID, orderTime FROM RES_Order WHERE orderTime > '2017-07-18'

--SELECT BY ORDERID
SELECT * FROM RES_OrderDetail WHERE orderID = 24


--- Tất cả các món 
SELECT *, detail.itemID as itemID FROM RES_Food inner join 
	(SELECT itemID, COUNT(*) as quantity FROM RES_OrderDetail
		WHERE orderID IN (
			SELECT orderID FROM RES_Order WHERE orderTime BETWEEN '2017-07-16' AND '2017-07-18')
		GROUP BY itemID
		
	) as detail
	on RES_Food.itemID = detail.itemID
	ORDER BY quantity DESC
	

SELECT SUM(quantity * price) as total FROM RES_Food inner join 
	(SELECT itemID, COUNT(*) as quantity FROM RES_OrderDetail
		WHERE orderID IN (
			SELECT orderID FROM RES_Order WHERE orderTime BETWEEN '2017-07-16' AND '2017-07-18')
		GROUP BY itemID
		
	) as detail
	on RES_Food.itemID = detail.itemID

-- By date of week
SELECT RES_Food.itemID, RES_Food.name, RES_Food.price, detail.quantity
	FROM RES_Food
	INNER JOIN
	(SELECT itemID, COUNT(itemID) as quantity FROM RES_OrderDetail
		WHERE orderID IN (
			SELECT orderID FROM RES_Order
				WHERE DATEPART(dw,orderTime) = 2
		)
		GROUP BY itemID) as detail
	ON detail.itemID = RES_Food.itemID
	ORDER BY detail.quantity DESC
	
-- Turnaround time
SELECT AVG(DATEDIFF(SECOND, orderTime, paidTime)) as turnaround FROM RES_Order
	WHERE paidTime IS NOT NULL
	
-- PrepareTime
SELECT AVG(DATEDIFF(SECOND, orderTime, timeReady)) as prepareTime
	FROM RES_OrderDetail
	INNER JOIN RES_Order
		ON RES_Order.orderID = RES_OrderDetail.orderID
	WHERE timeReady IS NOT NULL
	
-- Busboy statistics
SELECT RES_User.userID, name, role, number FROM RES_User
	INNER JOIN
		(SELECT userID, COUNT(time) as number FROM RES_Status
			WHERE status = 0
			GROUP BY userID) as detail
		ON detail.userID = RES_User.userID
	WHERE RES_User.role = 4