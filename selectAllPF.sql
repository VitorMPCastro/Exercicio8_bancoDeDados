SELECT 
    c.NomeCliente AS Nome_Cliente,
    c.EnderecoCliente AS Endereco_Cliente,
    pf.CPF,
    pf.Data_N AS Data_Nascimento,
    pf.Gênero
FROM
    cliente c
JOIN
    pessoa_fisica pf ON c.idCliente = pf.Cliente_idCliente;
