drop trigger if exists books_delete;
delimiter $$
create trigger books_delete after delete on books
for each row
begin
insert into books_aud(event_date, event_type, book_id)
values(curtime(), "delete", old.book_id);
end$$
delimiter ;


