drop trigger if exists books_insert;
delimiter $$
create trigger books_insert after insert on books
for each row
begin
insert into books_aud (event_date, event_type, book_id, new_book_title,
 new_book_year, new_is_bestseller)
 values(curdate(), "insert", new.book_id, new.title, new.pub_year, new.bestseller);
end$$
delimiter ;



