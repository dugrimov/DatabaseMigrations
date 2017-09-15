if exists(select 1
			from information_schema.columns 
			where table_name = 'MyTable' and column_name = 'MyColumn' and data_type = 'varchar')
begin				
	alter table MyTable alter column MyColumn nvarchar(1024) not null
	
	insert into Migrations(Number, Name) values(3, '0003_AlterColumn')
	
	print 'Migration 3 applied successfully'
end
else begin
	print 'Migration 3 cannot be applied'
end