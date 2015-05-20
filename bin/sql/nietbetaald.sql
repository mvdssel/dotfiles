-- Leden met email_ouders
SELECT replace(email_ouders, "|", ", ")
FROM `jos_ledenlijst`
WHERE   betaald = 0
    AND email_ouders > ''
    AND tak > ''
    AND NOT functies LIKE "%l%";

-- Leden zonder email_ouders maar met email_lid
SELECT replace(email_lid, "|", ", ")
FROM `jos_ledenlijst`
WHERE   betaald = 0
    AND NOT email_ouders > '' AND email_lid > ''
    AND tak > ''
    AND NOT functies LIKE "%l%";

-- Leden zonder email_ouders en email_lid
SELECT voornaam, achternaam, telefoon, gsm_ouders, gsm_lid
FROM `jos_ledenlijst`
WHERE   betaald = 0
    AND NOT email_lid > '' AND NOT email_ouders > ''
    AND tak > ''
    AND NOT functies LIKE "%l%";

