if not exists (select 1
				from 
					information_schema.constraint_column_usage
				where 
					table_name = 'MyTable'
					and constraint_name = 'Uq_MyColumn'
					and column_name = 'MyColumn')
begin
	alter table MyTable add constraint Uq_MyColumn unique (MyColumn)

	insert into Migrations(Number, Name) values(10, '0010_AddConstraint')
	
	print 'Migration 10 applied successfully'
end
else begin
	print 'Migration 10 cannot be applied'
end