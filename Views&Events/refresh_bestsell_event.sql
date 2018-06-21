delimiter $$

create event RefreshBestsellers
on schedule every 1 minute
do
begin
  declare stat_name varchar(20);
  declare stat_count int(11);
  call UpdateBestsellers();
  set stat_name = "bestsellers";
  set stat_count = (select * from bestsellers_count);
  insert into stats(stat_date, stat, stat_value)
  values(curdate(), stat_name, stat_count);
end$$

delimiter ;

