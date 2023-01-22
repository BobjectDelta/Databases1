use aviasales;

drop procedure if exists GetClientsTickets;
delimiter //
create procedure GetClientsTickets()
begin 
	select service_clients.client_id,  service_clients.initials, tickets.ticket_id, tickets.seat_num from service_clients join bookings on
    service_clients.client_id = bookings.client_id join tickets on tickets.ticket_id = bookings.ticket_id;
end //
delimiter ;
call GetClientsTickets();

drop procedure if exists GetFlightDetails;
delimiter //
create procedure GetFlightDetails(in id int)
begin
	select * from flights join airports on airports.airport_id = flights.airport_id where flights.flight_id = id;
end //
delimiter ;
call GetFlightDetails(3);

drop function if exists HasFreeSeats;
delimiter //
create function HasFreeSeats(id int) returns int
reads sql data
begin
	declare allSeats int;
    declare takenSeats int;
    select count(booking_id), seat_amount into takenSeats, allSeats from flights join bookings on flights.flight_id = bookings.flight_id join planes on 
	planes.plane_id = flights.plane_id where flights.flight_id = id;

    return allSeats - takenSeats;
end //
delimiter ;
select HasFreeSeats(3);

drop procedure if exists GetBirthdaysBetween;
delimiter //
create procedure GetBirthdaysBetween(in month1 int, in month2 int)
begin
	select * from service_clients where month(date_of_birth) between month1 and month2;
end //
delimiter ;
call GetBirthdaysBetween(3, 5);