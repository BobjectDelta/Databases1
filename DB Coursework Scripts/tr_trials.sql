use aviasales;
select * from flights where flight_id = 4;
delete from tickets where ticket_id = 81;
insert into tickets values(81, 1, 50);
delete from bookings where booking_id = 81;
insert into bookings values(81, 3, 81, 3, "2023-10-04");

insert into flights values(81, 2, 4, '2023-01-05 00:00:00', "Kyiv");
delete from flights where flight_id = 81;
