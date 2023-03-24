-- Keep a log of any SQL queries you execute as you solve the mystery.
SELECT * FROM crime_scene_reports; -- get crime reports info
SELECT * FROM crime_scene_reports WHERE year = 2021 AND month = 7 AND day = 28; --get crime reports info for specific day
SELECT * FROM crime_scene_reports WHERE year = 2021 AND month = 7 AND day = 28 AND street = 'Humphrey Street'; --get crime reports info for specific day AND place
SELECT * FROM interviews WHERE year = 2021 AND month = 7 AND DAY = 28; -- get interviews took place in the date of crime
SELECT * FROM interviews WHERE year = 2021 AND month = 7 AND DAY = 28 AND transcript LIKE '%bakery%'; -- find interviews mentioned 'bakery'
SELECT * FROM atm_transactions WHERE year = 2021 AND month = 7 AND day = 28 AND atm_location = 'Leggett Street'; -- find all atm transactions in the date of crime
SELECT * FROM atm_transactions WHERE year = 2021 AND month = 7 AND day = 28 AND atm_location = 'Leggett Street' AND transaction_type = 'withdraw'; -- get only withdraw operaitons
SELECT id FROM airports WHERE city = 'Fiftyville'; -- get id of Fiftyville airport
SELECT * FROM flights WHERE origin_airport_id IN (SELECT id FROM airports WHERE city = 'Fiftyville') AND year = 2021 AND month = 7 AND day = 29; -- get all flights at 29 of July
SELECT * FROM bakery_security_logs WHERE year = 2021 AND month = 7 AND day = 28 AND hour = 10 AND activity = 'exit';
 -- get all exit activity at 10AM
 SELECT * FROM people WHERE license_plate IN (SELECT license_plate FROM bakery_security_logs WHERE year = 2021 AND month = 7 AND day = 28 AND hour = 10 AND activity = 'exit' AND minute = 23); --get peoples with license_plate of cars in the bakery parkin log activity
 SELECT * FROM phone_calls WHERE caller IN (SELECT phone_number FROM people WHERE license_plate IN (SELECT license_plate FROM bakery_security_logs WHERE year = 2021 AND month = 7 AND day = 28 AND hour = 10 AND activity = 'exit' AND minute = 23)) AND year = 2021 AND month = 7 AND day = 28 AND duration < 60; -- get all calls less then minute
 SELECT * FROM people WHERE phone_number = '(770) 555-1861'; -- possible thief
 SELECT * FROM bank_accounts WHERE person_id IN (SELECT id FROM people WHERE phone_number = '(770) 555-1861'); -- get info of bank_account
 SELECT * FROM  atm_transactions WHERE account_number IN (SELECT account_number FROM bank_accounts WHERE person_id IN (SELECT id FROM people WHERE phone_number = '(770) 555-1861')) AND year = 2021 AND day = 28; -- confirm thief atm transaction
 SELECT passport_number FROM people WHERE phone_number = '(770) 555-1861'; -- get thief passport number
 SELECT * FROM flights WHERE id IN (SELECT flight_id FROM passengers WHERE passport_number IN (SELECT passport_number FROM people WHERE phone_number = '(770) 555-1861')) AND year = 2021 AND month = 7 AND day = 29; -- get flight info
 SELECT * FROM airports WHERE id IN (SELECT origin_airport_id FROM flights WHERE id IN (SELECT flight_id FROM passengers WHERE passport_number IN (SELECT passport_number FROM people WHERE phone_number = '(770) 555-1861')) AND year = 2021 AND month = 7 AND day = 29); -- confirm origin airport is Fiftyville
SELECT * FROM airports WHERE id IN (SELECT destination_airport_id FROM flights WHERE id IN (SELECT flight_id FROM passengers WHERE passport_number IN (SELECT passport_number FROM people WHERE phone_number = '(770) 555-1861')) AND year = 2021 AND month = 7 AND day = 29); -- find description airport
SELECT * FROM phone_calls WHERE receiver = '(725) 555-3243' AND year = 2021 AND month = 7 AND day = 28 AND duration < 60; -- confirm receiver and thief accomplice
