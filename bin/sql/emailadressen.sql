%s@^\(.*\)$@"\1", @g
%s@\n@@g

SELECT email_lid FROM `jos_ledenlijst` where  voornaam in () and functies LIKE "%L%"
