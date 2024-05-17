-- Creating the Sales Data Store Table --
CREATE TABLE SALES_DATA(
OrderNo INTEGER,
ProductNo Integer,
Price FLOAT,
Quantity INTEGER,
Sales FLOAT,
QtrId INTEGER CHECK (QtrId BETWEEN 1 AND 4),
MonthId INTEGER CHECK (MonthId BETWEEN 1 AND 12),
YearId INTEGER
);


-- Inserting Data into the Sales Data Store Table --
INSERT INTO SALES_DATA (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, YearId) VALUES (10107, 2, 85.7, 30, 2587, 1, 2, 2003);
INSERT INTO SALES_DATA (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, YearId) VALUES (10107, 5, 95.8, 39, 3879.49, 1, 2, 2003);
INSERT INTO SALES_DATA (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, YearId) VALUES (10121, 5, 71.5, 34, 2700, 1, 2, 2003);
INSERT INTO SALES_DATA (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, YearId) VALUES (10134, 2, 94.74, 41, 3884.34, 3, 7, 2004);
INSERT INTO SALES_DATA (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, YearId) VALUES (10134, 5, 100, 27, 3307.77, 3, 7, 2004);
INSERT INTO SALES_DATA (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, YearId) VALUES (10159, 14, 100, 49, 5205.27, 4, 10, 2005);
INSERT INTO SALES_DATA (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, YearId) VALUES (10168, 1, 96.66, 36, 3479.66, 4, 10, 2006);
INSERT INTO SALES_DATA (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, YearId) VALUES (10180, 12, 100, 42, 4695.6, 4, 11, 2006);


-- SQL query to determine the number of products sold for each product in each month of each year from the SalesData table.
SELECT
ProductNo, -- Include ProductNo to identify each product.
MonthId,   -- Group the data by MonthId.
YearId,    -- Group the data by YearId.
SUM(Quantity) AS Products_Sold -- Calculate Total Products sold in each Group.
FROM SALES_DATAE -- Specify The table name containing Sales data.
GROUP BY ProductNo, MonthId, YearId -- Group the result by ProductNo, MonthId, YearId.
ORDER BY ProductNo, YearId, MonthId; --Order by ProductNo first, then by YearId and finally by MonthId.

commit;
