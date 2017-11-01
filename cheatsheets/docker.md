Docker
======
Informatica Cloud Secure Agent
------------------------------
Create ubuntu image:

    docker run -it --name some-ubuntu ubuntu

Install the secure agent:

    apt-get -y update; apt-get -y upgrade;
    apt-get install -y wget
    wget <url-to-agent>
    chmod +x <agent-installer>
    ./<agent-installer>

Configure the secure agent:

    tail -f ./<agent-install-location>/apps/agentcore/infaagent.log

    ./<agent-install-location>/apps/agentcore/infaagent startup
    ./<agent-install-location>/apps/agentcore/consoleAgentManager.sh configure <username> <password>

Postgres
--------
Create postgres instance:

    docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d postgres

Connect to postgres instance:
    
    docker run -it --rm --link some-postgres:postgres postgres psql -h postgres -U postgres

    CREATE USER myuser;
    CREATE DATABASE mydatabase;
    GRANT ALL PRIVILEGES ON mydatabase TO myuser;
    CREATE TABLE mytable;
    ALTER TABLE mytable ADD COLUMN column1 type1, ADD COLUMN column2 type2;
