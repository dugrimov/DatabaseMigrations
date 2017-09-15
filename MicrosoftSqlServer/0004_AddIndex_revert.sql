if exists (select 1 
			   from sysindexes 
			   where id = object_id('MyTable') and name = 'Idx_MyTableMyColumn')
begin
	drop index Idx_MyTableMyColumn on MyTable

	delete from Migrations where Number = 4
	
	print 'Migration 4 successfully canceled'
end
else begin
	print 'Migration 4 cannot be canceled'
end