use aviasales;

LOAD DATA infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/service_clients.csv' INTO TABLE service_clients
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(initials, date_of_birth, phone_num, email);
LOAD DATA infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/credit_cards.csv' INTO TABLE credit_cards
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(card_num, bank_name, expire_date);
LOAD DATA infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/aviacompanies.csv' INTO TABLE aviacompanies
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(company_name, country_registration);
LOAD DATA infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/airports.csv' INTO TABLE airports
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(airport_name, airport_country, airport_city);
LOAD DATA infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/airports.csv' INTO TABLE airports
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(airport_name, airport_country, airport_city);
LOAD DATA infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tickets.csv' INTO TABLE tickets
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(is_business_class, seat_num);
LOAD DATA infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/planes.csv' INTO TABLE planes
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(company_id, seat_amount);
LOAD DATA infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/flights.csv' INTO TABLE flights
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(airport_id, plane_id, departure, destination);
LOAD DATA infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bookings.csv' INTO TABLE bookings
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(client_id, ticket_id, flight_id, booking_date);
LOAD DATA infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/payments.csv' INTO TABLE payments
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(booking_id, card_id);