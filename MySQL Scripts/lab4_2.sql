create or replace view v1 as select r.library_number, r.initials, s.tertiary_ed_institution, s.faculty from reader as r
inner join student as s where r.reader_id = s.reader_id;
select * from v1;

create or replace view v2 as select l.library_number, l.reading_rooms_qty from library as l inner join v1
where l.library_number = v1.library_number;
select * from v2;

alter view v2 as select l.library_number, l.reading_rooms_qty, v1.initials from library as l inner join v1 where
l.library_number = v1.library_number;
select * from v2;

describe v1;
describe v2;