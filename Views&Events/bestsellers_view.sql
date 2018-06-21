create view bestsellers_count as
select count(*) from books where bestseller = 1;
commit;

