if exists (select 
					1
				from 
					information_schema.constraint_column_usage
				where 
					table_name = 'MyTable'
					and constraint_name = 'Pk_MyTable'
					and column_name = 'Id')				
and not exists (select 
					1
				from 
					information_schema.constraint_column_usage
				where 
					table_name = 'MyTable'
					and constraint_name = 'Pk_MyTable'
					and column_name = 'MyColumn')
begin
	alter table MyTable
	drop constraint Pk_MyTable
	
	alter table MyTable
	add constraint Pk_MyTable primary key(Id, MyColumn)
	
	insert into Migrations(Number, Name) values(8, '0008_AlterPrimaryKey')
	
	print 'Migration 8 applied successfully'
end
else begin
	print 'Migration 8 cannot be applied'
end