-- select count(*)
select data.tekst
from jos_inschrijven_inschrijvingen insch
inner join jos_inschrijven_data data
on insch.id = data.inschrijving
where data.field = 26
and insch.event = 6
and insch.check = 1
