SELECT currentPhase, nextPhase, dateNextPhase 
FROM  cryptocurrency
JOIN project
ON cryptocurrency.code = project.cryptocurrency_code
WHERE cryptocurrency.cryptoName = 'Cardano'