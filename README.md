# DatabaseMigrations
The example SQLs for manually database migrations with most popular table altering operations. Each migration has 2 files - one for apply and one for undo.
All files are composed by template
```
if condition of migration applicability
begin
    alter database operations
	insert record into migrations history table
    print 'Migration n applied successfully'
end
else begin
    print 'Migration nnnn cannot be applied'
end
```
At the start the database has one table
```
create table MyTable (
	Id int not null
	constraint Pk_MyTable primary key (Id)
)
```
