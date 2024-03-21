USE LittleLemonDB;

-- Task 1
-- In this first task, Little Lemon need you to create a procedure that
-- displays the maximum ordered quantity in the Orders table.

-- Creating this procedure will allow Little Lemon to reuse the logic
-- implemented in the procedure easily without retyping the same code
-- over again and again to check the maximum quantity.

-- You can call the procedure GetMaxQuantity and invoke it as follows:

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS 'Get Max Quantity'
        FROM Orders;
end;

CALL GetMaxQuantity();

-- Task 2
-- In the second task, Little Lemon need you to help them to create a
-- prepared statement called GetOrderDetail. This prepared statement will
-- help to reduce the parsing time of queries. It will also help to
-- secure the database from SQL injections.

-- The prepared statement should accept one input argument, the CustomerID value, from a variable. 
-- The statement should return the order id, the quantity and the order cost from the Orders table.
-- Once you create the prepared statement, you can create a variable called id and assign it value of 1.

-- Then execute the GetOrderDetail prepared statement

PREPARE GetOrderDetail FROM
    'SELECT OrderID, Quantity, TotalCost
        FROM Orders
        WHERE CustomerID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Task 3 Your third and final task is to create a stored procedure
-- called CancelOrder. Little Lemon want to use this stored procedure
-- to delete an order record based on the user input of the order id.

-- Creating this procedure will allow Little Lemon to cancel any order
-- by specifying the order id value in the procedure parameter without
-- typing the entire SQL delete statement.

-- If you invoke the CancelOrder procedure, the output result should
-- be similar to the output of the following screenshot:

CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
    DELETE FROM Orders
           WHERE CancelOrder.order_id = Orders.OrderID;
end;

CALL CancelOrder(3);