-- How much is the total donation?
SELECT SUM(donation) AS total_donation
FROM donation_data;

-- What is the total donation by gender?
SELECT gender, SUM(donation) AS total_donation
FROM donation_data
GROUP BY gender;

-- Show the total donation and number of donations by gender
SELECT gender, COUNT (donation) AS number_of_donations, SUM(donation) AS total_donation
FROM donation_data
GROUP BY gender;

-- Total donation made by frequency of donation
SELECT donation_frequency, SUM(donation) AS total_donation
FROM donor_data 
LEFT JOIN donation_data
	ON donation_data.id = donor_data.id
GROUP BY donation_frequency;

-- Total donation and number of donation by Job field
SELECT job_field, COUNT (donation) AS number_of_donations, SUM(donation) AS total_donation
FROM donation_data
GROUP BY job_field;

-- Total donation and number of donations above $200
SELECT SUM (donation) AS total_donation, COUNT (donation) AS number_of_donations
FROM donation_data
WHERE donation > 200;

-- Total donation and number of donations below $200
SELECT SUM (donation) AS total_donation, COUNT (donation) AS number_of_donations
FROM donation_data
WHERE donation < 200;

-- Which top 10 states contributes the highest donations
SELECT state, SUM (donation) AS total_donations
FROM donation_data
GROUP BY state
ORDER by total_donations DESC
LIMIT 10;

-- Which top 10 states contributes the least donations
SELECT state, SUM (donation) AS total_donations
FROM donation_data
GROUP BY state
ORDER by total_donations
LIMIT 10;

-- What are the top 10 cars driven by the highest donors
SELECT first_name, last_name, car, SUM(donation) AS total_donations
FROM donation_data
LEFT JOIN donor_data
	ON donation_data.id = donor_data.id
GROUP BY first_name, last_name, car
ORDER BY total_donations DESC
LIMIT 10;

SELECT first_name, last_name, car, donation
FROM donation_data
LEFT JOIN donor_data
	ON donation_data.id = donor_data.id
ORDER BY donation DESC
LIMIT 10;

-- Top 10 universities with the highest donation frequency
SELECT DISTINCT(university), donation_frequency
FROM donor_data
ORDER BY donation_frequency ASC
LIMIT 10;

-- Top 10 universities with the highest total donations
SELECT DISTINCT (university), SUM(donation) AS total_donation
FROM donor_data
JOIN donation_data
	ON donation_data.id = donor_data.id
GROUP BY university
ORDER BY total_donation DESC
LIMIT 10;

-- second language of top donors
SELECT first_name, last_name, SUM(donation) AS total_donation, second_language
FROM donation_data
LEFT JOIN donor_data
	ON donation_data.id = donor_data.id
GROUP BY first_name, last_name, second_language
ORDER BY total_donation DESC
LIMIT 10;

-- total donation by job field and university
SELECT job_field, university, SUM(donation) AS total_donation
FROM donation_data
JOIN donor_data
	ON donation_data.id = donor_data.id
GROUP BY job_field, university
ORDER BY job_field ASC;

-- Who are the bottom 10 donors
SELECT first_name, last_name, donation
FROM donation_data
ORDER BY donation ASC
LIMIT 10;

-- Who are the top 10 donors
SELECT first_name, last_name, donation
FROM donation_data
ORDER BY donation DESC
LIMIT 10;