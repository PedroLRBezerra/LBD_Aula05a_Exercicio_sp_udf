CREATE DATABASE Aula05a_Exercicio_sp_udf
go
use Aula05a_Exercicio_sp_udf

CREATE TABLE cliente(
codigo int not null primary key,
nome VARCHAR(100) not null,
telefone CHAR(13) not null
)

Insert into cliente values
(20,'Strezkagg',5511983032380),
(1,'Kacdros',5511983032380),
(2,'Idgend',5511983032380),
(3,'Tarcith',5511983032380),
(4,'Gidgraeth',5511983032380),
(5,'Nezkaz',5511983032380),
(6,'Giokthind',5511983032380),
(7,'Zethunas',5511983032380),
(8,'Tusgionax',5511983032380),
(9,'Siushaltuph',5511983032380),
(10,'Iurirciuph',5511983032380),
(11,'Tidkrand',5511983032380),
(12,'Ircajeg',5511983032380),
(13,'Hoktha',5511983032380),
(14,'Usulath',5511983032380),
(15,'Igtoth',5511983032380),
(16,'Gonsah',5511983032380),
(17,'Thenaille',5511983032380),
(18,'Zhothei',5511983032380),
(19,'Endush',5511983032380)

CREATE TABLE produto(
codigo int not null primary key,
nome VARCHAR(100) NOT NULL,
valor_unit DECIMAL(7,2) NOT NULL)


INSERT INTO produto VALUES
(1,'Peacekeeper Shield',30),
(2,'Volcanic Guard Shield',430),
(3,'Steel Handguards Gauntlet',90),
(4,'Grips of Divine Damnation Gauntlet',380),
(5,'Golden Handguards of Ancient Fortunes Gauntlet1',740),
(6,'Mercy, Sword of Fury',180),
(7,'Worldslayer Sword',360),
(8,'Amnesia, Betrayer of the Phoenix Sword',700),
(9,'Iron Heavy Crossbow',400),
(10,'Bloodvenom Warpwood Hunting Bow',950),
(11,'Potion of Firepower',40),
(12,'Potion of Agility',35),
(13,'Vial of Cure Disease',30),
(14,'Tonic of Moonlight',70),
(15,'Elixir of Fire Protection',60),
(16,'Potion of Protection',65)



CREATE TABLE venda(
cod_cli int not null,
cod_prod int not null,
data_venda DATE not null,
qtde int not null,
valor_unit DECIMAL(7,2) not null,
primary key(cod_cli,cod_prod,data_venda),
foreign key (cod_cli) references cliente (codigo),
foreign key (cod_prod) references produto(codigo)
)

CREATE TABLE bonus(
id int not null primary key,
valor decimal(7,2) not null,
premio VARCHAR(200) not null)

INSERT INTO bonus VALUES
(1,1000,'Jogo de copos'),
(2,2000,'Jogo de pratos'),
(3,3000,'Jogo de talheres'),
(4,4000,'Jogo de porcelana'),
(5,5000,'Jogos de cristais')



CREATE PROCEDURE sp_inserevendas(@codCli INT , @codProd INT , @qtde INT)
AS
BEGIN
	DECLARE @valorUnit DECIMAL(7,2)

	SET @valorUnit = (SELECT valor_unit FROM produto WHERE codigo = @codProd)
	INSERT INTO venda VALUES (@codCli,@codProd,GETDATE(),@qtde,@valorUnit)
END

	select *from venda


EXEC sp_inserevendas 1,9,1
EXEC sp_inserevendas 1,10,1 
EXEC sp_inserevendas 1,2,1 
EXEC sp_inserevendas 1,7,1 
EXEC sp_inserevendas 1,11,9
EXEC sp_inserevendas 1,12,2
EXEC sp_inserevendas 1,13,5
EXEC sp_inserevendas 1,14,14
EXEC sp_inserevendas 1,15,0
EXEC sp_inserevendas 1,16,5
EXEC sp_inserevendas 2,7,1 
EXEC sp_inserevendas 2,6,1 
EXEC sp_inserevendas 2,3,1 
EXEC sp_inserevendas 2,6,1 
EXEC sp_inserevendas 2,11,9
EXEC sp_inserevendas 2,12,4
EXEC sp_inserevendas 2,13,6
EXEC sp_inserevendas 2,14,14
EXEC sp_inserevendas 2,15,9
EXEC sp_inserevendas 2,16,11
EXEC sp_inserevendas 3,5,1 
EXEC sp_inserevendas 3,3,1 
EXEC sp_inserevendas 3,4,1 
EXEC sp_inserevendas 3,5,1 
EXEC sp_inserevendas 3,11,4
EXEC sp_inserevendas 3,12,7
EXEC sp_inserevendas 3,13,8
EXEC sp_inserevendas 3,14,11
EXEC sp_inserevendas 3,15,9
EXEC sp_inserevendas 3,16,1
EXEC sp_inserevendas 4,7,1 
EXEC sp_inserevendas 4,7,1 
EXEC sp_inserevendas 4,7,1 
EXEC sp_inserevendas 4,3,1 
EXEC sp_inserevendas 4,11,7
EXEC sp_inserevendas 4,12,9
EXEC sp_inserevendas 4,13,0
EXEC sp_inserevendas 4,14,7
EXEC sp_inserevendas 4,15,6
EXEC sp_inserevendas 4,16,2
EXEC sp_inserevendas 5,8,1 
EXEC sp_inserevendas 5,2,1 
EXEC sp_inserevendas 5,7,1 
EXEC sp_inserevendas 5,7,1 
EXEC sp_inserevendas 5,11,4
EXEC sp_inserevendas 5,12,8
EXEC sp_inserevendas 5,13,9
EXEC sp_inserevendas 5,14,1
EXEC sp_inserevendas 5,15,10
EXEC sp_inserevendas 5,16,6
EXEC sp_inserevendas 6,8,1 
EXEC sp_inserevendas 6,8,1 
EXEC sp_inserevendas 6,10,1 
EXEC sp_inserevendas 6,10,1 
EXEC sp_inserevendas 6,11,9
EXEC sp_inserevendas 6,12,12
EXEC sp_inserevendas 6,13,10
EXEC sp_inserevendas 6,14,2
EXEC sp_inserevendas 6,15,14
EXEC sp_inserevendas 6,16,8
EXEC sp_inserevendas 7,9,1 
EXEC sp_inserevendas 7,3,1 
EXEC sp_inserevendas 7,9,1 
EXEC sp_inserevendas 7,3,1 
EXEC sp_inserevendas 7,11,0
EXEC sp_inserevendas 7,12,7
EXEC sp_inserevendas 7,13,6
EXEC sp_inserevendas 7,14,13
EXEC sp_inserevendas 7,15,5
EXEC sp_inserevendas 7,16,1
EXEC sp_inserevendas 8,7,1 
EXEC sp_inserevendas 8,7,1 
EXEC sp_inserevendas 8,5,1 
EXEC sp_inserevendas 8,6,1 
EXEC sp_inserevendas 8,11,13
EXEC sp_inserevendas 8,12,7
EXEC sp_inserevendas 8,13,8
EXEC sp_inserevendas 8,14,8
EXEC sp_inserevendas 8,15,12
EXEC sp_inserevendas 8,16,14
EXEC sp_inserevendas 9,7,1 
EXEC sp_inserevendas 9,7,1 
EXEC sp_inserevendas 9,2,1 
EXEC sp_inserevendas 9,10,1 
EXEC sp_inserevendas 9,11,0
EXEC sp_inserevendas 9,12,8
EXEC sp_inserevendas 9,13,10
EXEC sp_inserevendas 9,14,10
EXEC sp_inserevendas 9,15,10
EXEC sp_inserevendas 9,16,0
EXEC sp_inserevendas 10,5,1 
EXEC sp_inserevendas 10,7,1 
EXEC sp_inserevendas 10,10,1 
EXEC sp_inserevendas 10,10,1 
EXEC sp_inserevendas 10,11,11
EXEC sp_inserevendas 10,12,10
EXEC sp_inserevendas 10,13,1
EXEC sp_inserevendas 10,14,7
EXEC sp_inserevendas 10,15,1
EXEC sp_inserevendas 10,16,3
EXEC sp_inserevendas 11,7,1 
EXEC sp_inserevendas 11,4,1 
EXEC sp_inserevendas 11,6,1 
EXEC sp_inserevendas 11,8,1 
EXEC sp_inserevendas 11,11,7
EXEC sp_inserevendas 11,12,13
EXEC sp_inserevendas 11,13,5
EXEC sp_inserevendas 11,14,13
EXEC sp_inserevendas 11,15,9
EXEC sp_inserevendas 11,16,8
EXEC sp_inserevendas 12,5,1 
EXEC sp_inserevendas 12,9,1 
EXEC sp_inserevendas 12,3,1 
EXEC sp_inserevendas 12,8,1 
EXEC sp_inserevendas 12,11,11
EXEC sp_inserevendas 12,12,7
EXEC sp_inserevendas 12,13,14
EXEC sp_inserevendas 12,14,11
EXEC sp_inserevendas 12,15,5
EXEC sp_inserevendas 12,16,4
EXEC sp_inserevendas 13,3,1 
EXEC sp_inserevendas 13,6,1 
EXEC sp_inserevendas 13,2,1 
EXEC sp_inserevendas 13,1,1 
EXEC sp_inserevendas 13,11,4
EXEC sp_inserevendas 13,12,10
EXEC sp_inserevendas 13,13,4
EXEC sp_inserevendas 13,14,12
EXEC sp_inserevendas 13,15,3
EXEC sp_inserevendas 13,16,5
EXEC sp_inserevendas 14,8,1 
EXEC sp_inserevendas 14,3,1 
EXEC sp_inserevendas 14,6,1 
EXEC sp_inserevendas 14,10,1 
EXEC sp_inserevendas 14,11,12
EXEC sp_inserevendas 14,12,6
EXEC sp_inserevendas 14,13,5
EXEC sp_inserevendas 14,14,2
EXEC sp_inserevendas 14,15,13
EXEC sp_inserevendas 14,16,11
EXEC sp_inserevendas 15,6,1 
EXEC sp_inserevendas 15,1,1 
EXEC sp_inserevendas 15,7,1 
EXEC sp_inserevendas 15,2,1 
EXEC sp_inserevendas 15,11,0
EXEC sp_inserevendas 15,12,11
EXEC sp_inserevendas 15,13,3
EXEC sp_inserevendas 15,14,11
EXEC sp_inserevendas 15,15,5
EXEC sp_inserevendas 15,16,8
EXEC sp_inserevendas 16,1,1 
EXEC sp_inserevendas 16,7,1 
EXEC sp_inserevendas 16,5,1 
EXEC sp_inserevendas 16,4,1 
EXEC sp_inserevendas 16,11,6
EXEC sp_inserevendas 16,12,0
EXEC sp_inserevendas 16,13,11
EXEC sp_inserevendas 16,14,9
EXEC sp_inserevendas 16,15,0
EXEC sp_inserevendas 16,16,14
EXEC sp_inserevendas 17,7,1 
EXEC sp_inserevendas 17,10,1 
EXEC sp_inserevendas 17,2,1 
EXEC sp_inserevendas 17,9,1 
EXEC sp_inserevendas 17,11,14
EXEC sp_inserevendas 17,12,9
EXEC sp_inserevendas 17,13,11
EXEC sp_inserevendas 17,14,5
EXEC sp_inserevendas 17,15,9
EXEC sp_inserevendas 17,16,12
EXEC sp_inserevendas 18,4,1 
EXEC sp_inserevendas 18,7,1 
EXEC sp_inserevendas 18,6,1 
EXEC sp_inserevendas 18,10,1 
EXEC sp_inserevendas 18,11,12
EXEC sp_inserevendas 18,12,3
EXEC sp_inserevendas 18,13,5
EXEC sp_inserevendas 18,14,8
EXEC sp_inserevendas 18,15,5
EXEC sp_inserevendas 18,16,4
EXEC sp_inserevendas 19,1,1 
EXEC sp_inserevendas 19,2,1 
EXEC sp_inserevendas 19,10,1 
EXEC sp_inserevendas 19,1,1 
EXEC sp_inserevendas 19,11,7
EXEC sp_inserevendas 19,12,0
EXEC sp_inserevendas 19,13,10
EXEC sp_inserevendas 19,14,4
EXEC sp_inserevendas 19,15,1
EXEC sp_inserevendas 19,16,0
EXEC sp_inserevendas 20,5,1 
EXEC sp_inserevendas 20,8,1 
EXEC sp_inserevendas 20,4,1 
EXEC sp_inserevendas 20,9,1 
EXEC sp_inserevendas 20,11,12
EXEC sp_inserevendas 20,12,9
EXEC sp_inserevendas 20,13,13
EXEC sp_inserevendas 20,14,3
EXEC sp_inserevendas 20,15,10
EXEC sp_inserevendas 20,16,14

CREATE FUNCTION fn_tablebonus()
RETURNS @tabela TABLE(
cod_cliente INT,
nome varchar(100),
total_gasto decimal(11,2),
_bonus int,
_premio varchar(200),
bonus_restante int)
AS
BEGIN
	INSERT @tabela(cod_cliente,nome) SELECT codigo,nome from cliente
	UPDATE @tabela SET total_gasto = (SELECT SUM(venda.qtde*venda.valor_unit) from venda where cod_cliente=venda.cod_cli)
	UPDATE @tabela SET _bonus = total_gasto
	UPDATE @tabela SET _premio = (SELECT premio from bonus where bonus.valor=(_bonus-_bonus%1000))
	UPDATE @tabela SET bonus_restante = (_bonus - CAST((SELECT valor FROM bonus WHERE bonus.premio=_premio) AS INT))

	RETURN 
END
select * FROM dbo.fn_tablebonus()
