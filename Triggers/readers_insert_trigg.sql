drop trigger if exists readers_aud;
delimiter $$
create trigger readers_insert after insert on readers
for each row
begin
insert into readers_aud(event_time, event_type, reader_id, new_first_name, new_last_name,
new_pesel_id, new_vip_level)
values(curtime(), "insert", new.reader_id, new.first_name, new.last_name, new.pesel_id,
new.vip_level);
end$$
delimiter ;
