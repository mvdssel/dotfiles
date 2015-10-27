PHP
===

Composer
--------
Install Symfony

    $ composer create-project symfony/framework-standard-edition "project name"
    $ php app/check.php
    $ sf server:run

Update Composer.json

    $ composer update

Symfony
-------
### Installation


### Console
Create a bundle

    $ sf generate:bundle --namespace=My/NewBundle --format=yml
    
Create project database

    $ sf doctrine:database:create

Create an entity

    $ sf doctrine:generate:entity

Generate getters & setters for an entity with properties

    $ sf doctrine:generate:entities My/NewBundle/Entity/MyEntity

Update the database-schema

    $ sf doctrine:schema:update --force

Create CRUD possibilities

    $ sf generate:doctrine:crud

Debug things

    $ sf debug:router

PHPUnit
-------
Run tests

    $ phpunit -c path/to/configuration

Run certain tests
    
    $ phpunit -c path/to/configuration path/to/tests

Generate code coverage

    $ phpunit -c path/to/configuration --coverage-html=path/to/generated/coverage
