drop procedure if exists MarkBookVeryOld;
delimiter $$
create procedure MarkBookVeryOld()
begin
declare rel_date, b_id int;
declare finished int default 0;
declare all_books cursor for select book_id from books;
declare continue handler for not found set finished = 1;

open all_books;
while(finished=0) do
fetch all_books into b_id;
select pub_year from books
where book_id = b_id
into rel_date;

if(rel_date<=1930) then
update books set is_old = true
where book_id = b_id;
elseif(rel_date >1930) then 
update books set is_old = false
where book_id = b_id;
end if;
end while;
close all_books;
end$$
delimiter ;

call MarkBookVeryOld();
select * from books;