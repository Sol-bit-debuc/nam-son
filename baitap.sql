-- 1. Đếm tổng số khách hàng
SELECT COUNT(*) AS TotalCustomers
FROM Customers;

-- 2. Đếm số sản phẩm đang còn bán (Discontinued = 0)
SELECT COUNT(*) AS ActiveProducts
FROM Products
WHERE Discontinued = 0;

-- 3. Đếm số đơn hàng trong năm 1997
SELECT COUNT(*) AS OrdersIn1997
FROM Orders
WHERE YEAR(OrderDate) = 1997;

-- 4. Giá sản phẩm thấp nhất và cao nhất
SELECT MIN(UnitPrice) AS MinPrice, MAX(UnitPrice) AS MaxPrice
FROM Products;

-- 5. Ngày đặt hàng sớm nhất và muộn nhất
SELECT MIN(OrderDate) AS EarliestOrder, MAX(OrderDate) AS LatestOrder
FROM Orders;

-- 6. Ngày sinh nhân viên lớn tuổi nhất và nhỏ tuổi nhất
SELECT MIN(BirthDate) AS OldestEmployee, MAX(BirthDate) AS YoungestEmployee
FROM Employees;

-- 7. Giá trung bình của tất cả sản phẩm
SELECT AVG(UnitPrice) AS AveragePrice
FROM Products;

-- 8. Tổng số lượng sản phẩm đã bán
SELECT SUM(Quantity) AS TotalQuantity
FROM [Order Details];

-- 9. Doanh thu toàn bộ các đơn hàng
SELECT SUM(Quantity * UnitPrice * (1 - Discount)) AS TotalRevenue
FROM [Order Details];

-- 10. Mỗi khách hàng đã đặt bao nhiêu đơn hàng
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Orders
GROUP BY CustomerID;

-- 11. Với mỗi nhà cung cấp: giá sản phẩm rẻ nhất và đắt nhất
SELECT SupplierID, MIN(UnitPrice) AS MinPrice, MAX(UnitPrice) AS MaxPrice
FROM Products
GROUP BY SupplierID;

-- 12. Với mỗi nhân viên: tổng số đơn hàng đã xử lý
SELECT EmployeeID, COUNT(*) AS OrdersHandled
FROM Orders
GROUP BY EmployeeID;

-- 13. Với mỗi khách hàng: tổng doanh thu mang lại
SELECT o.CustomerID, 
       SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS TotalRevenue
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.CustomerID;

-- 14. 5 khách hàng có doanh thu cao nhất
SELECT TOP 5 o.CustomerID, 
       SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS TotalRevenue
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.CustomerID
ORDER BY TotalRevenue DESC;

-- 15. Nhân viên có số đơn hàng phụ trách > 100
SELECT EmployeeID, COUNT(*) AS OrdersHandled
FROM Orders
GROUP BY EmployeeID
HAVING COUNT(*) > 100;

-- 16. Khách hàng có tổng doanh thu > 50,000
SELECT o.CustomerID, 
       SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS TotalRevenue
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.CustomerID
HAVING SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) > 50000;

-- 17. Nhà cung cấp có trung bình giá sản phẩm > 40
SELECT SupplierID, AVG(UnitPrice) AS AveragePrice
FROM Products
GROUP BY SupplierID
HAVING AVG(UnitPrice) > 40;
