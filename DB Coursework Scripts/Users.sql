use aviasales;

create role if not exists 'operator', 'viewer';
grant select, delete, insert, update on aviasales.* to 'operator';
grant select on aviasales.* to 'viewer';

create user if not exists 'reader'@'localhost' identified by '1234';
create user if not exists 'editor'@'localhost' identified by '4321';

grant 'viewer' to 'reader'@'localhost';
grant 'operator' to 'editor'@'localhost';

select * from bookings;
insert into tickets values (1, 23);