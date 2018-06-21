drop trigger if exists books_update;
delimiter $$
create trigger books_update after update on books
for each row
begin
insert into books_aud(event_date, event_type, book_id, new_book_title, old_book_title, 
new_book_year, old_book_year, new_is_bestseller, old_is_bestseller)
values(curtime(), "update", old.book_id, new.title, old.title, new.pub_year,
old.pub_year, new.bestseller, old.bestseller);
end$$
delimiter ;
