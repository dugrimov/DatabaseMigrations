if exists (select 
					1
				from 
					information_schema.constraint_column_usage
				where 
					table_name = 'MyTable'
					and constraint_name = 'Pk_MyTable'
					and column_name = 'Id')		
and  exists (select 
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
	add constraint Pk_MyTable primary key(Id)
	
	delete from Migrations where Number = 8
	
	print 'Migration 8 successfully canceled'
end
else begin
	print 'Migration 8 cannot be canceled'
end