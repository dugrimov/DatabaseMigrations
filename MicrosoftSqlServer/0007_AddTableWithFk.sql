if not exists (select 1
				from sysobjects
				where id = object_id('ParentTable')	and type = 'U')
begin
	create table ParentTable (
		Id 			int identity(0,1) 	not null,
		Name 		nvarchar(50) 		not null	
		constraint Pk_ParentTable primary key(Id))
	
	insert into ParentTable (Name) 
	values ('Default value')
	
	alter table MyTable
	add ParentTableId int not null
	constraint tmp_constraint default(0)
	
	alter table MyTable
	drop constraint tmp_constraint
	
	alter table MyTable
	add constraint Fk_ParentTable_MyTable
	foreign key (ParentTableId) references ParentTable (Id)
	on update no action on delete no action

	insert into Migrations(Number, Name) values(7, '0007_AddTableWithFk')

	print 'Migration 7 applied successfully'
end
else 
begin
	print 'Migration 7 cannot be applied'
end