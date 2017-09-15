if not exists (select 1
                from sysobjects
                where id = object_id('Migrations') and type = 'U')
begin
    create table Migrations (
        Number int not null,
        Name nvarchar(max) not null,
        RunDate datetime not null default (getdate()),
        constraint PK_MIGRATIONS primary key (Number))

    insert into Migrations (Number, Name) values (1, '0001_CreateMigrationsTable')