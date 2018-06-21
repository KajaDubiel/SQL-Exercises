drop procedure if exists UpdateBestsellers;
delimiter $$
create procedure UpdateBestsellers()
	begin
		declare count_read int(10);
		declare finished int default 0;
		declare b_id int;
		declare all_books cursor for select book_id from books;
		declare continue handler for not found set finished = 1;
		open all_books;
		while(finished = 0) do
		fetch all_books into b_id;
		if(finished = 0) then
			select count(book_id) 
			from rents
			where book_id = b_id
			into count_read;
				if(count_read>2) then
					update books set bestseller = true
					where book_id = b_id;
				else
					update books set bestseller = false
					where book_id = b_id;
				end if;
			end if;
		end while;
		close all_books;
	end$$

delimiter ;

call UpdateBestsellers();
select * from books;