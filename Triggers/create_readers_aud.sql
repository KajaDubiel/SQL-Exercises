create table readers_aud(
event_id int not null auto_increment primary key,
event_time datetime,
event_type varchar(10),
reader_id int not null,
new_first_name varchar(20),
old_first_name varchar(20),
new_last_name varchar(20),
old_last_name varchar(20),
new_pesel_id varchar(11),
old_pesel_id varchar(11),
new_vip_level varchar(30),
old_vip_level varchar(30)
);
