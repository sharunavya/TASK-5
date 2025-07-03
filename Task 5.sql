-- inner join
SELECT 
    l.LoanID,
    c.Name AS CustomerName,
    e.Name AS EmployeeName,
    lt.LoanCategory,
    l.Amount,
    l.StartDate,
    l.EndDate
FROM Loan l
INNER JOIN Customer c ON l.CustomerID = c.CustomerID
INNER JOIN Employee e ON l.EmployeeID = e.EmployeeID
INNER JOIN LoanType lt ON l.LoanTypeID = lt.LoanTypeID;

-- left join
SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    l.LoanID,
    l.Amount,
    l.StartDate,
    l.EndDate
FROM Customer c
LEFT JOIN Loan l ON c.CustomerID = l.CustomerID;

-- right join
SELECT 
    e.EmployeeID,
    e.Name AS EmployeeName,
    l.LoanID,
    l.Amount
FROM Loan l
RIGHT JOIN Employee e ON l.EmployeeID = e.EmployeeID;

-- FULL OUTER JOIN equivalent
SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    l.LoanID,
    l.Amount
FROM Customer c
LEFT JOIN Loan l ON c.CustomerID = l.CustomerID UNION SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    l.LoanID,
    l.Amount
FROM Customer c
RIGHT JOIN Loan l ON c.CustomerID = l.CustomerID;
