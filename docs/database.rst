.. image:: http://geotrek.fr/images/logo-pne.png
    :target: http://www.ecrins-parcnational.fr
    
===============
BASE DE DONNEES
===============

Pr�-requis
----------

* postgres 9.1, postgis 1.5, disposer d'une base template postgis ici nomm�e 'templategis'
* installer postgres et postgis puis la cr�er le template 'templategis'

  ::

    apt-get install postgresql-9.1 postgresql-9.1-postgis 
    sudo -u postgres createdb templategis
    sudo -u postgres createlang -d templategis plpgsql
    sudo -u postgres psql -d templategis -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql
    sudo -u postgres psql -d templategis -f /usr/share/postgresql/9.1/contrib/postgis-1.5/spatial_ref_sys.sql

cr�ation de l'utilisateur
-------------------------

* cr�er un utilisateur postgres nomm� 'cartopnx'. 
Il sera le propri�taire de la base synthesepn et sera utilis� par l'application pour se connect� � la base.
l'application fonctionne avec le pass 'monpassachanger' mais il est conseill� de l'adapter !
  ::

    su postgres
    psql
    CREATE ROLE cartopnx WITH LOGIN PASSWORD 'monpassachanger';
    CREATE ROLE cartoadmin WITH SUPERUSER LOGIN PASSWORD 'monpassachanger';
    \q
    exit

Cr�ation de la base de donn�es
------------------------------

* transf�rer les 2 fichiers sql sur le serveur 
par exemple dans le r�pertoire /home/monuser/
* cr�ation d'une base postgis nomm�e synthesepn
se loguer en root sur le serveur (pour debian sinon utiliser sudo sur ubuntu)
  ::

    su postgres
    createdb -O cartopnx -T templategis synthesepn
    export PGPASSWORD=monpassachanger;psql -h localhost -U cartoadmin -d synthesepn -f /home/cartodev/grant.sql
    export PGPASSWORD=monpassachanger;psql -h localhost -U cartopnx -d synthesepn -f /home/cartodev/synthese_2154.sql
    export PGPASSWORD=monpassachanger;psql -h localhost -U cartopnx -d synthesepn -f /home/cartodev/data_synthese_2154.sql
si besoin un exemple de donn�es sig pour les tables du sch�ma layers
  ::

    export PGPASSWORD=monpassachanger;psql -h localhost -U cartopnx -d synthesepn -f /home/cartodev/data_sig_pne_2154.sql 
    exit