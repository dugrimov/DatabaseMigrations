if exists(select 1
			from information_schema.columns 
			where table_name = 'MyTable' and column_name = 'MyColumn' and data_type = 'nvarchar')
begin				
	alter table MyTable alter column MyColumn varchar(32) not null
	
	delete from Migrations where Number = 3
	
	print 'Migration 3 successfully canceled'
end
else begin
	print 'Migration 3 cannot be canceled'
end