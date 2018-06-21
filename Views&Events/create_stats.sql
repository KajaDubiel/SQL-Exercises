create table stats(
stat_id int(11) auto_increment primary key,
stat_date datetime not null,
stat varchar(20) not null,
stat_value int(11) not null
);

commit;