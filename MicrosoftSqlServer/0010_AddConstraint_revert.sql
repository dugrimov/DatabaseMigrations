if exists (select 1
				from 
					information_schema.constraint_column_usage
				where 
					table_name = 'MyTable'
					and constraint_name = 'Uq_MyColumn'
					and column_name = 'MyColumn')
begin
	alter table MyTable drop constraint Uq_MyColumn

	delete from Migrations where Number = 10
	
	print 'Migration 10 applied successfully'
end
else begin
	print 'Migration 10 cannot be canceled'
end