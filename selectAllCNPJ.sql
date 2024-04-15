SELECT 
    c.NomeCliente AS Nome_Cliente,
    c.EnderecoCliente AS Endereco_Cliente,
    pj.CNPJ,
    pj.Inscricao_Estadual
FROM
    cliente c
JOIN
    pessoa_juridica pj ON c.idCliente = pj.Cliente_idCliente;
