if not exists (select 1
                from sys.columns
                where object_id = object_id('MyTable') and name = 'MyColumn')
begin
    alter table MyTable
    add MyColumn varchar(32) not null 
    constraint tmp_constraint default('foo')
    
    alter table MyTable
    drop constraint tmp_constraint

    insert into Migrations(Number, Name) values(2, '0002_AddNotNullColumn')
    
	print 'Migration 2 applied successfully'
end
else begin
	print 'Migration 2 cannot be applied'
end