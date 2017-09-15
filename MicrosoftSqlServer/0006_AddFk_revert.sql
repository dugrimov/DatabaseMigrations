if exists (select 1
				from sys.columns
				where object_id = object_id('MyTable') and name = 'OtherTableId')
begin
	alter table MyTable
	drop constraint Fk_OtherTable_Id
	
	alter table MyTable 
	drop column OtherTableId
	
	delete from Migrations where Number = 6
	
	print 'Migration 6 successfully canceled'
end
else begin
	print 'Migration 6 cannot be canceled'
end