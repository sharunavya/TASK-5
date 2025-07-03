SQL JOIN Queries for loan_management_systems

1. INNER JOIN

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
Purpose:
Retrieves complete loan records only where matching entries exist in Loan, Customer, Employee, and LoanType.
Use Case: View all valid, assigned loans with complete details.

 2. LEFT JOIN

SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    l.LoanID,
    l.Amount,
    l.StartDate,
    l.EndDate
FROM Customer c
LEFT JOIN Loan l ON c.CustomerID = l.CustomerID;
Purpose:
Returns all customers, along with their loan info if available. If a customer hasn’t taken a loan, loan-related fields will be NULL.
Use Case: Identify customers with and without loans.

3. RIGHT JOIN

SELECT 
    e.EmployeeID,
    e.Name AS EmployeeName,
    l.LoanID,
    l.Amount
FROM Loan l
RIGHT JOIN Employee e ON l.EmployeeID = e.EmployeeID;
Purpose:
Returns all employees, including those who are not assigned any loan. Loan fields will be NULL if no assignment exists.
Use Case: Review employee involvement in loan processing.

4. FULL OUTER JOIN (MySQL Workaround)

SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    l.LoanID,
    l.Amount
FROM Customer c
LEFT JOIN Loan l ON c.CustomerID = l.CustomerID

UNION

SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    l.LoanID,
    l.Amount
FROM Customer c
RIGHT JOIN Loan l ON c.CustomerID = l.CustomerID;
Purpose:
Simulates a FULL OUTER JOIN, displaying all customers and all loans, whether or not they have a match.
Use Case: Get a complete view of all customer-loan relationships, including unmatched entries.

 MySQL doesn’t support FULL JOIN directly; UNION of LEFT and RIGHT joins is used.
