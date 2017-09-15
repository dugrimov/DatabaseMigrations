if not exists(select 1 
				from sys.views 
				where name = 'MyView')
begin
	exec('create view MyView as
		select 
			MyColumn
		from 
			MyTable')
		
	insert into Migrations(Number, Name) values(9, '0009_CreateView')
	
	print 'Migration 9 applied successfully'
end
else begin
	print 'Migration 9 cannot be applied'
end