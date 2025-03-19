-- ============================================================================
-- OLA Data Analyst Project - SQL Queries and Views
-- ============================================================================

-- Create Database and Use It
CREATE DATABASE Ola;
USE Ola;

-- ============================================================================
-- Query 1: Retrieve all successful bookings
-- ============================================================================

-- Create a view to store all successful bookings
CREATE VIEW Successful_Bookings AS
SELECT * 
FROM bookings 
WHERE Booking_Status = 'Success';

-- Retrieve data from the view
SELECT * FROM Successful_Bookings;

-- ============================================================================
-- Query 2: Find the average ride distance for each vehicle type
-- ============================================================================

-- Create a view to store average ride distance by vehicle type
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance 
FROM bookings 
GROUP BY Vehicle_Type;

-- Retrieve data from the view
SELECT * FROM ride_distance_for_each_vehicle;

-- ============================================================================
-- Query 3: Get the total number of cancelled rides by customers
-- ============================================================================

-- Create a view to store total cancelled rides by customers
CREATE VIEW cancelled_rides_by_customers AS
SELECT COUNT(*) AS total_cancelled_by_customers 
FROM bookings 
WHERE Booking_Status = 'Cancelled by Customer';

-- Retrieve data from the view
SELECT * FROM cancelled_rides_by_customers;

-- ============================================================================
-- Query 4: List the top 5 customers who booked the highest number of rides
-- ============================================================================

-- Create a view to store top 5 customers by ride count
CREATE VIEW Top_5_Customers AS
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides 
FROM bookings 
GROUP BY Customer_ID 
ORDER BY total_rides DESC 
LIMIT 5;

-- Retrieve data from the view
SELECT * FROM Top_5_Customers;

-- ============================================================================
-- Query 5: Get the number of rides cancelled by drivers due to personal and car-related issues
-- ============================================================================

-- Create a view to store rides cancelled by drivers due to personal and car-related issues
CREATE VIEW Rides_cancelled_by_Drivers_P_C_Issues AS
SELECT COUNT(*) AS rides_cancelled_by_drivers 
FROM bookings 
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- Retrieve data from the view
SELECT * FROM Rides_cancelled_by_Drivers_P_C_Issues;

-- ============================================================================
-- Query 6: Find the maximum and minimum driver ratings for Prime Sedan bookings
-- ============================================================================

-- Create a view to store max and min driver ratings for Prime Sedan bookings
CREATE VIEW Max_Min_Driver_Rating AS
SELECT MAX(Driver_Ratings) AS max_rating, MIN(Driver_Ratings) AS min_rating 
FROM bookings 
WHERE Vehicle_Type = 'Prime Sedan';

-- Retrieve data from the view
SELECT * FROM Max_Min_Driver_Rating;

-- ============================================================================
-- Query 7: Retrieve all rides where payment was made using UPI
-- ============================================================================

-- Create a view to store rides where payment was made using UPI
CREATE VIEW UPI_Payment AS
SELECT * 
FROM bookings 
WHERE Payment_Method = 'UPI';

-- Retrieve data from the view
SELECT * FROM UPI_Payment;

-- ============================================================================
-- Query 8: Find the average customer rating per vehicle type
-- ============================================================================

-- Create a view to store average customer rating by vehicle type
CREATE VIEW AVG_Cust_Rating AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating 
FROM bookings 
GROUP BY Vehicle_Type;

-- Retrieve data from the view
SELECT * FROM AVG_Cust_Rating;

-- ============================================================================
-- Query 9: Calculate the total booking value of rides completed successfully
-- ============================================================================

-- Create a view to store total booking value of successful rides
CREATE VIEW total_successful_ride_value AS
SELECT SUM(Booking_Value) AS total_successful_value 
FROM bookings 
WHERE Booking_Status = 'Success';

-- Retrieve data from the view
SELECT * FROM total_successful_ride_value;

-- ============================================================================
-- Query 10: List all incomplete rides along with the reason
-- =============================================================================

-- Create a view to store incomplete rides along with the reason
CREATE VIEW Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookings 
WHERE Incomplete_Rides = 'Yes';

-- Retrieve data from the view
SELECT * FROM Incomplete_Rides_Reason;
