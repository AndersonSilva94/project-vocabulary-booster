/* 4 - Exiba a média salarial e o nível de senioridade de todas as pessoas empregadas, agrupadas pelo cargo
Obtenha informações a respeito dos salários das pessoas empregadas.

Use o banco hr como referência

Crie uma query que exiba 03 colunas:

  A) A primeira deve possuir o alias "Cargo" e exibir o nome do cargo.
  B) A segunda deve possuir o alias "Média salarial" e exibir a média dos salários das pessoas empregadas que possuem o cargo em questão.
  C) A terceira deve possuir o alias "Senioridade" e categorizar o nível de senioridade do cargo com base na média salarial, da seguinte forma:
    -> Média salarial entre 2000 - 5800 -> Júnior
    -> Média salarial entre 5801 - 7500 -> Pleno
    -> Média salarial entre 7501 - 10500 -> Sênior
    -> Média salarial acima de 10500 -> CEO

Sempre que fizer uso da média salarial, arredonde o valor para 02 casas decimais.

Os resultados devem estar ordenados pela média salarial em ordem crescente.

Em caso de empate na média, os resultados devem ser ordenados pelo nome do cargo em ordem alfabética. */
SELECT
j.JOB_TITLE AS `Cargo`,
ROUND(AVG(e.SALARY), 2) AS `Média salarial`,
CASE
  WHEN ROUND(AVG(e.SALARY), 2) BETWEEN 2000 AND 5800 THEN 'Júnior'
  WHEN ROUND(AVG(e.SALARY), 2) BETWEEN 5801 AND 7500 THEN 'Pleno'
  WHEN ROUND(AVG(e.SALARY), 2) BETWEEN 7501 AND 10500 THEN 'Sênior'
  ELSE 'CEO'
END AS `Senioridade`
FROM hr.jobs j
INNER JOIN hr.employees e
ON j.JOB_ID = e.JOB_ID
GROUP BY e.JOB_ID
ORDER BY `Média salarial`, `Cargo`;
