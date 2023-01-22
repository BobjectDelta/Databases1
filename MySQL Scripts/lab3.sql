use library_foundation;

select * from checker;
select * from library where library_number = 1;
select * from library where library.available_literature_qty < 4;
select * from checker where checker.library_number >= 2;
select * from reader where reader.date_of_birth < "2000-01-01" and reader.sex = "male";
select * from writings where writings.library_number = 1 or writings.is_lendable = true;
select * from writings where not writings.is_lendable = true;
select * from reader where not reader.abonement_validity > "2023-01-01" and reader.library_number > 1;
select * from reader where initials like 'O%';
select * from reader where reader.library_number between 1 and 2;
select * from writings where writings.lending_term is not null;
select initials, reader.abonement_validity from reader where reader.library_number > 1;

select initials, library_number, date_of_birth, school_number, grade from reader join pupil on pupil.reader_id =
reader.reader_id;

select X.initials, X.library_number, X.date_of_birth, X.grade from (select initials, library_number, 
date_of_birth, grade from reader join pupil on pupil.reader_id = reader.reader_id) as X where X.grade >= (select avg(grade) from pupil);
select * from writings where nomenclative_number in (select nomenclative_number from scientific);
select library.library_number, library.reading_rooms_qty, reader.initials, reader.library_number from library cross join reader;
select fiction.book_name from fiction where exists(select nomenclative_number from writings where 
fiction.nomenclative_number = writings.nomenclative_number);
select initials, date_of_birth, job_profile from reader join teacher on teacher.reader_id = reader.reader_id and
reader.date_of_birth > "1980-01-01";
select library.library_number, reader.initials, reader.abonement_validity from library inner join reader on
library.library_number = reader.library_number;
select checker.worker_id, checker.library_number from checker left join storage_room on storage_room.storage_room_number = 2 and 
storage_room.storage_room_number = checker.storage_room_number;
select library.library_number, library.storage_rooms_qty, writings.nomenclative_number, writings.author from writings right join library on
library.library_number = 1 and library.library_number = writings.library_number;
select nomenclative_number from fiction union select nomenclative_number from journalistic;
