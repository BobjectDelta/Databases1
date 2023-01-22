use aviasales;

drop table if exists payments;
drop table if exists bookings;
drop table if exists flights;
drop table if exists planes;
drop table if exists tickets;
drop table if exists credit_cards;
drop table if exists service_clients;
drop table if exists aviacompanies;
drop table if exists airports;

create table service_clients (
	client_id int not null auto_increment,
    initials varchar(40) not null,
    date_of_birth date,
    phone_num varchar(15),
    email varchar(40),
    primary key (client_id)
);
create table credit_cards (
	card_id int not null auto_increment,
	card_num varchar(16) not null,
    bank_name varchar(40),
    expire_date date,
    primary key (card_id)
);
create table aviacompanies (
	company_id int not null auto_increment,
    company_name varchar(40),
    country_registration varchar(25),
    primary key (company_id)
);
create table airports (
	airport_id int not null auto_increment,
    airport_name varchar(50),
    airport_country varchar(40),
    airport_city varchar(50),
    primary key (airport_id)
);
create table tickets (
	ticket_id int not null auto_increment,
    is_business_class bool, 
    seat_num int,
    primary key (ticket_id)
);
create table planes (
	plane_id int not null auto_increment,
    company_id int,
    seat_amount int not null,
    primary key (plane_id),
    foreign key (company_id) references aviacompanies(company_id)
);
create table flights (
	flight_id int not null auto_increment,
    airport_id int not null,
    plane_id int not null,
    departure datetime,
    destination varchar(30),
    primary key(flight_id),
    foreign key (airport_id) references airports(airport_id),
	foreign key (plane_id) references planes(plane_id) on delete cascade
);
create table bookings (
	booking_id int not null auto_increment,
    client_id int not null,
    ticket_id int not null,
    flight_id int not null,
    booking_date date,
    primary key (booking_id),
	foreign key (client_id) references service_clients(client_id) on delete cascade,
	foreign key (ticket_id) references tickets(ticket_id),
    foreign key (flight_id) references flights(flight_id)
);
create table payments (
	payment_id int not null auto_increment,
    booking_id int not null,
    card_id int not null,
    primary key (payment_id),
    foreign key (booking_id) references bookings(booking_id),
    foreign key (card_id) references credit_cards(card_id)
);
