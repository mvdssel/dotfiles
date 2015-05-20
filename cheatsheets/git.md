GIT Cheatsheet
==============

Revert commit, keep the changes
-------------------------------
Zorgt ervoor dat de laatste commit ongedaan wordt gemaakt.
De wijzigingen blijven behouden, maar zitten niet meer in de 
repository. Ze worden dus terug lokaal en moeten nog "gecommit"
worden. Ze zijn te zien bij $ git status.

    git reset --soft HEAD^


Links existing, local git to new remote git
-------------------------------------------

    git remote add origin https://github.com/username/repository.git
    git push -u origin master
