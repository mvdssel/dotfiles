SELECT insch . * , data.tekst
FROM  `jos_inschrijven_inschrijvingen` insch
INNER JOIN jos_inschrijven_data data ON insch.id = data.inschrijving
AND data.field =26
WHERE insch.check =0
ORDER BY insch.id DESC 
LIMIT 0 , 30

