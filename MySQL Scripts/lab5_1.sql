use library_foundation;

drop table if exists tmp;
drop procedure if exists procedure1;
delimiter //
create procedure procedure1()
begin
	create temporary table tmp select author, nomenclative_number, library_number from writings limit 0;
end //
delimiter ;
call procedure1();
select * from tmp;


drop procedure if exists procedure2;
delimiter //
create procedure procedure2()
begin
	select author, nomenclative_number, if(is_lendable = true, 'Можна позичити', 'Не можна позичити') from writings;
end //
delimiter ;
call procedure2();

drop procedure if exists procedure3;
delimiter //
create procedure procedure3()
begin
	declare lim int default 3;
	while lim > 0 do
		insert into tmp values ('author', lim, 1);
        set lim = lim-1;
	end while;
end //
delimiter ;
call procedure3();
select * from tmp;


drop procedure if exists procedure4;
delimiter //
create procedure procedure4()
begin
	select * from library;
end //
delimiter ;
call procedure4();


drop procedure if exists procedure5;
delimiter //
create procedure procedure5(in flag bool)
begin
	select * from writings where is_lendable = flag;
end //
delimiter ;
call procedure5(true);


drop procedure if exists procedure6;
delimiter //
create procedure procedure6(in num int, out s int)
begin
	select sum(content) from fiction where nomenclative_number > num into s;
    select s;
end //
delimiter ;
call procedure6(5, @s);


drop procedure if exists procedure7;
delimiter //
create procedure procedure7()
begin
	update writings set is_lendable = false where writings.nomenclative_number%5 = 0;
end //
delimiter ;
call procedure7();
select * from writings;


drop procedure if exists procedure8;
delimiter //
create procedure procedure8()
begin
	select * from reader where reader.date_of_birth > '2000-01-01';
end //
delimiter ;
call procedure8();