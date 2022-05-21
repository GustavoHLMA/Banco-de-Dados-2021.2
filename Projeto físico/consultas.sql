--CONSULTAS

- Group by/Having
- Projetar os modelos dos carros de 2015 que tem mais de 2 unidades. 

SELECT modelo, COUNT(*) AS qtd
FROM veiculo
WHERE ano = 2015
GROUP BY modelo
HAVING COUNT > 2;

- Junção interna
- Projetar os cpfs dos vendedores que vendeu carro com seguro.

SELECT cpf_vendedor 
FROM venda v INNER JOIN seguro s ON v.chassi = s.chassi

- Junção externa
- Projetar todos os modelos de carros que nao foram vendidos

SELECT modelo
FROM venda vd RIGHT OUTER JOIN veiculo vc ON vd.chassi = vc.chassi
WHERE NOT EXISTS(
	SELECT *
	FROM venda vd1
	WHERE vd1.chassi = vd.chassi
)

-Anti-junção

SELECT v.cpf_vendedor, ve.modelo
FROM venda v INNER JOIN veiculo ve ON v.chassi = ve.chassi
WHERE NOT EXISTS(
	SELECT * 
	FROM veiculo ve1
	WHERE ve1.chassi = v.chassi
)


-Semi junção / subconsulta do tipo tabela
- Projetar os cpfs dos vendedores que tenham realizado uma venda para
uma pessoa que indicou outra pessoa

SELECT cpf_vendedor
FROM venda v
WHERE EXISTS(
	SELECT  *
	FROM cliente c
	WHERE v.cpf_cliente = c.cpf_padrinho 
)

-Subconsulta do tipo escalar
- Modelo do carro mais antigo da concessionaria

SELECT modelo
FROM veiculo
WHERE ano = (
	SELECT MIN(ano)
	from veiculo
	GROUP BY veiculo.chassi
)
