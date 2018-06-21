drop trigger if exists readers_delete;
delimiter $$
create trigger readers_delete after delete on readers
for each row
begin
insert into readers_aud(event_time, event_type, reader_id)
values(curtime(), "delete", old.reader_id);
end$$
delimiter ;

select * from readers_aud;
select * from readers;

delete from readers
where reader_id = 6;
commit;

