use aviasales;

drop trigger if exists b_ins_wrong_book_date;
delimiter //
create trigger b_ins_wrong_book_date before insert on bookings for each row 
begin 
	declare dep_date datetime;
    declare book_flight int;
    set book_flight = new.flight_id;
	select departure into dep_date from flights where flights.flight_id = book_flight;
    if dep_date < new.booking_date then
		signal sqlstate '45000' set message_text = 'Wrong flight. Choose another date.';
	end if;
end //
delimiter ;

drop trigger if exists b_ins_wrong_flight_date;
delimiter //
create trigger b_ins_wrong_flight_date before insert on flights for each row 
begin 
    if new.departure < curdate() then
		signal sqlstate '45000' set message_text = 'Cannot insert flight. Date is in past.';
	end if;
end //
delimiter ;

drop trigger if exists b_ins_are_seats_avail;
delimiter //
create trigger b_ins_are_seats_avail before insert on bookings for each row 
begin 
	declare seats_taken int;
    declare all_seats int;
	declare book_flight int;
    set book_flight = new.flight_id;
    select count(booking_id), seat_amount into seats_taken, all_seats from flights join bookings on flights.flight_id = book_flight join planes on 
    planes.plane_id = flights.plane_id group by planes.plane_id;
    if seats_taken >= all_seats then
		signal sqlstate '45000' set message_text = 'Cannot insert booking. Not enough availiable seats.';
	end if;
end //
delimiter ;