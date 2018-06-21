
create table books_aud(
	event_id int not null auto_increment,
    event_date datetime not null,
    event_type varchar(10),
    new_book_id int(11) not null,
    new_book_title varchar(40),
    old_book_title varchar(40),
    new_book_year int(5),
    old_book_year int(5),
    new_is_bestseller boolean,
    old_is_bestseller boolean,
    primary key (event_id)
);

commit;

select * from books_aud;
