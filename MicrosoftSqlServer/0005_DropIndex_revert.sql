if not exists (select 1 
			from sys.indexes 
			where name = 'Idx_MyTableMyColumn' and object_id = object_id('MyTable'))
begin
	create index Idx_MyTableMyColumn on MyTable (MyColumn asc)
	
	delete from Migrations where Number = 5
	
	print 'Migration 5 successfully canceled'
end
else  begin
	print 'Migration 5 cannot be canceled'
end