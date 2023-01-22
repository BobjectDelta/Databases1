use library_foundation;

drop function if exists func1;
delimiter //
create function func1() returns date
reads sql data
begin
	declare maximum date;
	select max(abonement_validity) from reader where sex = 'female' into maximum;
    return maximum;
end //
delimiter ;
select func1();


drop procedure if exists func_proc;
delimiter //
create procedure func_proc(in flag bool)
begin
	if flag then
		select * from reader;
	else
		select reader_id, initials, date_of_birth from reader;
	end if;
end //
delimiter ;
call func_proc(false);


drop table if exists reserve;
create table reserve(
	id int,
	school_id int,
    gradenum int
);
drop procedure if exists cursors;
delimiter //
create procedure cursors()
begin
	declare done int default 0;
	declare reader_id, school_number, grade int;
    declare curs cursor for select * from pupil;
    declare continue handler for not found set done = 1;
    open curs;
    cycle_loop: loop
    fetch curs into reader_id, school_number, grade;
    insert into reserve values(reader_id, school_number, grade);
    if done = 1 then leave cycle_loop;
      end if;
      end loop;
      close curs;
end //
delimiter ;
call cursors();
select * from reserve;


drop trigger if exists deletion;
delimiter //
create trigger deletion before delete on writings for each row 
begin 
	if old.lending_term > 30 then
		signal sqlstate '45000'
		set message_text = 'Error, privilege is too low';
	end if;
end //
delimiter ;

delete from writings where nomenclative_number = 2;

drop trigger if exists modification;
delimiter //
create trigger modification before update on writings for each row 
begin 
	if new.lending_term > 90 then
		signal sqlstate '45000'
		set message_text = 'Error, term is too big';
        set new.lending_term = 90;
	end if;
end //
delimiter ;

drop trigger if exists insertion;
delimiter //
create trigger insertion before update on writings for each row 
begin 
	if new.shelf_number > 20 then
		signal sqlstate '45000'
		set message_text = 'Error, no libraries contain this much shelves';
        set new.shelf_number = 20;
	end if;
end //
delimiter ;