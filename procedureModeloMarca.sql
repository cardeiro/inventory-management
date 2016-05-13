CREATE DEFINER=`root`@`localhost` PROCEDURE `marcamodelo`(in novamarca varchar(80), novomodelo varchar(80))
BEGIN
	declare marcaexiste int;
    declare modeloexiste int;
    declare modeloAux int;
    declare marcaAux int;
    set marcaexiste=0;
    set modeloexiste=0;

select count(*) into marcaexiste from marca where marca.nome like novamarca;
	if (marcaexiste=0) then 
		insert into marca (nome) value (novamarca);
        select idmarca into marcaAux from marca where marca.nome like novamarca;
	else 
		select idmarca into marcaAux from marca where marca.nome like novamarca;        
end if;

select count(*) into modeloexiste from modelo where modelo.nome like novomodelo;
	if (modeloexiste=0) then
		insert into modelo (nome) value (novomodelo);
        select idmodelo into modeloAux from modelo where modelo.nome like novomodelo;
    else 
		select idmodelo into modeloAux from modelo where modelo.nome like novomodelo;   
end if;


	insert into modelo_has_marca values (modelo.idmodelo,marca.idmarca);

    
END