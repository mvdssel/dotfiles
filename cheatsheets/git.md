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

Use SSH to deploy
-----------------
1. Generate an SSH key: [https://help.github.com/articles/generating-ssh-keys/](link)
2. Switch from HTTPS to SSH: [https://help.github.com/articles/changing-a-remote-s-url/](link)
