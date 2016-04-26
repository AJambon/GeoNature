============================
MISE A JOUR DE L'APPLICATION
============================

Les diff�rentes versions sont disponibles sur le Github du projet (https://github.com/PnEcrins/GeoNature/releases).

* T�l�charger et extraire la version souhait�e dans un r�pertoire s�par� (o� ``X.Y.Z`` est � remplacer par le num�ro de la version que vous installez). 

    ::

        cd /home/synthese/
        wget https://github.com/PnEcrins/GeoNature/archive/vX.Y.Z.zip
        unzip vX.Y.Z.zip
        mv geonature geonature_old
        mv GeoNature-X.Y.Z/ geonature
        rm vX.Y.Z.zip

* Copier les anciens fichiers de configuration et les comparer avec les nouveaux. Attention, si de nouveaux param�tres ont �t� ajout�s, ajoutez les dans ces fichiers.

    ::
    
        cp geonature_old/wms/wms.map geonature/wms/wms.map
        cp geonature_old/web/js/config.js geonature/web/js/config.js
        cp geonature_old/web/js/configmap.js geonature/web/js/configmap.js
        cp geonature_old/lib/sfGeonatureConfig.php geonature/lib/sfGeonatureConfig.php
        cp geonature_old/config/databases.yml geonature/config/databases.yml
        cd geonature
    
    
* Si vous l'avez personnalis�, r�cup�rez votre bandeau de l'application 

    ::
    
        cp ../geonature_old/web/images/bandeau_geonature.jpg web/images/bandeau_geonature.jpg

* Lire attentivement les notes de chaque version si il y a des sp�cificit�s (https://github.com/PnEcrins/GeoNature/releases). Suivre ces instructions avant de continuer la mise � jour.
       
* Si vous avez ajout� des protocoles sp�cifiques dans GeoNature (https://github.com/PnEcrins/GeoNature/issues/54), il vous faut les r�cup�rer dans la nouvelle version. 

Commencez par copier les modules Symfony correspondants dans le r�pertoire de la nouvelle version de GeoNature. 

Il vous faut ensuite reporter les modifications r�alis�es dans les parties qui ne sont pas g�n�riques (module Symfony ``bibs``, le fichier de routing, la description de la BDD dans le fichier ``config/doctrine/schema.yml`` et l'appel des JS et CSS dans ``apps/backend/modules/home/config/view.yml``).

