use library_foundation;

select count(abonement_validity) from reader where abonement_validity > "2022-12-31";
select sum(content) from fiction;
select upper(author) from writings;
select lower(author) from writings;
select datediff(abonement_validity, curdate()) from reader where reader.abonement_validity > curdate();
select count(nomenclative_number), author from writings group by author;
select count(nomenclative_number), author from writings group by author having count(nomenclative_number) >= 1;
select * from storage_room having racks_qty > 1;
select row_number() over (order by initials) row_num, initials, reader_id from reader where abonement_validity < curdate(); 
select * from reader order by abonement_validity;