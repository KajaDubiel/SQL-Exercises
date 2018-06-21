drop trigger if exists update_readers;

delimiter $$
create trigger update_readers after update on readers
for each row
begin
insert into readers_aud(event_time, event_type, reader_id, new_first_name,
old_first_name, new_last_name, old_last_name, new_pesel_id, old_pesel_id,
new_vip_level, old_vip_level)
values(curtime(), "update", old.reader_id, new.first_name, old.first_name, new.last_name,
old.last_name, new.pesel_id, old.pesel_id, new.vip_level, old.vip_level);
end$$
delimiter ;
