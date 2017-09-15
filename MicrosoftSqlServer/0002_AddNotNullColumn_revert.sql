if exists (select 1
                from sys.columns
                where object_id = object_id('MyTable') and name = 'MyColumn')
begin
    alter table MyTable drop column MyColumn

    delete from Migrations where Number = 2

	print 'Migration 2 successfully canceled'
end
else begin
	print 'Migration 2 cannot be canceled'
end