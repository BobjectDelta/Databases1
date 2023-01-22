use aviasales;

select service_clients.client_id, service_clients.initials, bookings.booking_id, bookings.ticket_id, is_business_class, seat_num 
from service_clients join bookings on service_clients.client_id = bookings.client_id join tickets on
bookings.ticket_id = tickets.ticket_id;

select service_clients.client_id, service_clients.initials, bookings.booking_id, payments.card_id, credit_cards.card_num
from service_clients join bookings on service_clients.client_id = bookings.client_id join payments on 
payments.booking_id = bookings.booking_id join credit_cards on payments.card_id = credit_cards.card_id;

select flights.flight_id, flights.destination, count(booking_id) from flights join bookings on 
flights.flight_id = bookings.flight_id group by flights.flight_id;

select aviacompanies.company_id, aviacompanies.company_name, count(planes.plane_id) from planes join aviacompanies on
aviacompanies.company_id = planes.company_id group by aviacompanies.company_id;

select flights.flight_id, flights.destination, count(booking_id) from flights join bookings on 
flights.flight_id = bookings.flight_id group by flights.destination;

select aviacompanies.country_registration, count(aviacompanies.company_id) from aviacompanies group by aviacompanies.country_registration;

select planes.plane_id, planes.company_id, planes.seat_amount, count(booking_id) from flights join bookings on 
flights.flight_id = bookings.flight_id join planes on planes.plane_id = flights.plane_id group by planes.plane_id;

select airports.airport_country, count(airports.airport_id) from airports group by airports.airport_country 
order by count(airports.airport_id) desc;

select planes.plane_id, planes.company_id, count(tickets.ticket_id) from flights join bookings on flights.flight_id = bookings.flight_id join 
planes on planes.plane_id = flights.plane_id join tickets on tickets.ticket_id = bookings.booking_id where 
tickets.is_business_class = true group by planes.plane_id;

select bookings.booking_id, service_clients.initials, flights.destination from service_clients join bookings on  
service_clients.client_id = bookings.client_id join flights on flights.flight_id = bookings.flight_id 
where bookings.booking_date > "2022-10-01";

select flights.flight_id, flights.destination, count(booking_id) from flights join bookings on 
flights.flight_id = bookings.flight_id group by flights.flight_id;

select service_clients.client_id, service_clients.initials, service_clients.email, count(bookings.booking_id) from service_clients join
bookings on service_clients.client_id = bookings.client_id group by service_clients.client_id;

select airports.airport_id, airports.airport_name, airports.airport_country, count(flights.flight_id) from airports join flights on
flights.airport_id = airports.airport_id group by airports.airport_id;

select flights.flight_id, flights.destination, flights.departure, count(bookings.booking_id) from bookings join flights on
flights.flight_id = bookings.flight_id join tickets on tickets.ticket_id = bookings.ticket_id  where tickets.is_business_class = false
group by flights.flight_id;

select airports.airport_id, airports.airport_name, airports.airport_country, airports.airport_city, flights.flight_id, flights.destination
from airports join flights on airports.airport_id = flights.airport_id;

select service_clients.client_id, service_clients.initials, bookings.booking_id, flights.flight_id, flights.departure from service_clients join
bookings on service_clients.client_id = bookings.client_id join flights on bookings.flight_id = flights.flight_id where 
flights.departure between curdate() and date_add(curdate(), interval 30 day);

select flights.flight_id, flights.destination, aviacompanies.company_id, aviacompanies.company_name from flights join planes on
flights.plane_id = planes.plane_id join aviacompanies on planes.company_id = aviacompanies.company_id where 
flights.departure > date_add(curdate(), interval 90 day);

drop view if exists company_booking_rating;
create view company_booking_rating as
select aviacompanies.company_id, aviacompanies.company_name, count(flights.flight_id) from flights join planes on
flights.plane_id = planes.plane_id join aviacompanies on planes.company_id = aviacompanies.company_id group by aviacompanies.company_id;
select * from company_booking_rating;

drop view if exists planes_month_flights;
create view planes_month_flights as
select planes.plane_id, count(flights.flight_id) from planes join flights on flights.plane_id = planes.plane_id where
year(flights.departure) = 2023 and month(flights.departure) in (1, 5, 6, 12) group by planes.plane_id;
select * from planes_month_flights;

create view departure_country_rating as
select airports.airport_country, count(flights.flight_id) from airports join flights on
airports.airport_id = flights.airport_id group by airports.airport_country order by count(flights.flight_id) desc;
select * from departure_country_rating
