use aviasales;

alter table service_clients drop index idx_clients;
explain select * from service_clients where client_id = 1117; 
create index idx_clients on
service_clients (client_id);
explain select * from service_clients where client_id = 1117; 

alter table service_clients drop index idx_initials;
explain select * from service_clients where initials like 'J%'; 
create index idx_initials on
service_clients (initials);
explain select * from service_clients where initials like 'J%'; 