if exists (select 1 
			from sys.indexes 
			where name = 'Idx_MyTableMyColumn' and object_id = object_id('MyTable'))
begin
	drop index Idx_MyTableMyColumn on MyTable
	
	insert into Migrations(Number, Name) values(5, '0005_DropIndex')
	
	print 'Migration 5 applied successfully'
end
else  begin
	print 'Migration 5 cannot be applied'
end