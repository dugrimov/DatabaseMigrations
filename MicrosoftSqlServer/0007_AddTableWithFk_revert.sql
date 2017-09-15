if exists (select 1
				from sysobjects
				where id = object_id('ParentTable')	and type = 'U')
begin
	alter table MyTable
	drop constraint Fk_ParentTable_MyTable

	alter table MyTable
	drop column ParentTableId
	
	drop table ParentTable
	
	delete from Migrations where Number = 7

	print 'Migration 7 successfully canceled'
end
else 
begin
	print 'Migration 7 cannot be canceled'
end