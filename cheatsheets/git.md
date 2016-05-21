GIT Cheatsheet
==============

Detatched HEAD
--------------
Make the current commit the HEAD of the master branch

    # current situation: HEAD -> (the commit)

    git checkout -b temp        # HEAD -> (temp branch) -> (the commit)
    git branch -f master temp   # master -> (the commit)
    git checkout master         # HEAD -> master -> (the commit)
    git branch -d temp          # removes the temp branch

Revert commit, keep the changes
-------------------------------
Zorgt ervoor dat de laatste commit ongedaan wordt gemaakt.
De wijzigingen blijven behouden, maar zitten niet meer in de 
repository. Ze worden dus terug lokaal en moeten nog "gecommit"
worden. Ze zijn te zien bij `$ git status`.

    git reset --soft HEAD^


Links existing, local git to new remote git
-------------------------------------------

    git remote add origin https://github.com/username/repository.git
    git push -u origin master

Use SSH to deploy
-----------------
1. Generate an SSH key: [https://help.github.com/articles/generating-ssh-keys/](link)
2. Switch from HTTPS to SSH: [https://help.github.com/articles/changing-a-remote-s-url/](link)
