create database ecommerce;
use ecommerce;

select * from banking;

DESCRIBE banking;
SHOW COLUMNS FROM banking;


ALTER TABLE banking
RENAME COLUMN `ï»¿Client ID` TO Client_ID;


-- Total Clients, Loans, and Deposits
SELECT 
    COUNT(DISTINCT `Client_ID`) AS total_clients,
    SUM(`Bank Loans`) AS total_bank_loans,
    SUM(`Bank Deposits`) AS total_bank_deposits
FROM banking;


-- Loan Amount by Occupation
SELECT 
    `Occupation`,
    SUM(`Bank Loans`) AS total_loan_amount
FROM banking
GROUP BY `Occupation`
ORDER BY total_loan_amount DESC;


-- Deposit Amount by Account Type
SELECT 
    SUM(`Saving Accounts`) AS total_savings,
    SUM(`Checking Accounts`) AS total_checking,
    SUM(`Foreign Currency Account`) AS total_foreign_currency
FROM banking;


-- Loan Distribution by Income Band
SELECT 
    `Estimated Income`,
    SUM(`Bank Loans`) AS total_loan
FROM banking
GROUP BY `Estimated Income`
ORDER BY total_loan DESC;


-- Client Count by Gender and Banking Relationship
SELECT 
    `GenderId`,
    `BRId`,
    COUNT(`Client_ID`) AS total_clients
FROM banking
GROUP BY `GenderId`, `BRId`
ORDER BY total_clients DESC;
