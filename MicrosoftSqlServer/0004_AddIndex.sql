if not exists (select 1 
			   from sysindexes 
			   where id = object_id('MyTable') and name = 'Idx_MyTableMyColumn')
begin
	create index Idx_MyTableMyColumn on MyTable (MyColumn asc)

	insert into Migrations(Number, Name) values(4, '0004_AddIndex')
	
	print 'Migration 4 applied successfully'
end
else begin
	print 'Migration 4 cannot be applied'
end