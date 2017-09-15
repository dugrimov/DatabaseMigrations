if not exists (select 1
				from sys.columns
				where object_id = object_id('MyTable') and name = 'OtherTableId')
begin			
	alter table MyTable add OtherTableId int null

	alter table MyTable
	add constraint Fk_OtherTable_Id foreign key (OtherTableId)
	references OtherTable (Id)
	
	insert into Migrations(Number, Name) values(6, '0006_AddFk')
	
	print 'Migration 6 applied successfully'
end
else begin
	print 'Migration 6 cannot be applied'
end