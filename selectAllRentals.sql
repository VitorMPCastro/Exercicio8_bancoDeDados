SELECT 
    a.idAluguel,
    c.NomeCliente AS Nome_Cliente,
    c.EnderecoCliente AS Endereco_Cliente,
    a.Veiculo_Placa AS Placa_Veiculo,
    a.DateTime_Inicio AS Data_Inicio,
    a.DateTime_Fim AS Data_Fim,
    f.Endereço AS Endereco_Entrega,
    m.Motorista_CPF AS CPF_Motorista,
    m.Numero_CNH AS CNH_Motorista
FROM
    aluguel a
JOIN
    cliente c ON a.idCliente = c.idCliente
JOIN
    filial f ON a.Entrega_CNPJ = f.CNPJ_Filial
LEFT JOIN
    cliente_indica_motorista m ON a.Motorista_CPF = m.Motorista_CPF AND a.Numero_CNH = m.Numero_CNH AND a.idCliente = m.idCliente;
