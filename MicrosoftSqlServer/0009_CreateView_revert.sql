if exists(select 1 
				from sys.views 
				where name = 'MyView')
begin
	drop view MyView
		
	delete from Migrations where Number = 9
	
	print 'Migration 9 successfully canceled'
end
else begin
	print 'Migration 9 cannot be canceled'
end