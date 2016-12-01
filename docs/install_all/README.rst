INSTALLATION RAPIDE ET COMPLETE
===============================

Cette documentation permet une installation rapide et simplifi�e de GeoNature et de ses applications li�es : UsersHub, TaxHub et GeoNature-atlas.
Les scripts propos�s installent l'environnement logiciel du serveur, t�l�chargent les applications sur leur d�pots github, les installent et les configurent par d�faut.

Pr�-requis
----------

- Un serveur Debian 8 (Ubuntu 16.04 LTS devrait fonctionner �galement - non test�)
- Une cl� IGN pour l'API Geoportail valide pour le domaine sur lequel votre serveur r�pond
- TODO : proposer un sources.list valide et la proc�dure pour le mettre � jour

Installation
------------

Apr�s installation de l'OS avec OpenSSH server, placez vous dans le home de votre utilisateur et entrez les commandes suivantes :

  ::
    
    su
    apt-get update
    apt-get install -y sudo ca-certificates
    exit
    
R�cup�rer les scripts d'installation

  ::  
    
	wget https://raw.githubusercontent.com/PnEcrins/GeoNature/develop/docs/install_all/install_all.ini
	wget https://raw.githubusercontent.com/PnEcrins/GeoNature/develop/docs/install_all/install_all.sh
	chmod +x install_all.sh

Mettez � jour le fichier ``install_all.ini`` avec vos informations. Attention, ne lancez pas les fichiers .sh tant que vous n'avez pas totalement compl�t� ce fichier.
TODO : d�tailler la proc�dure pour l'atlas avec : 
    * install avec donn�es exemple 
    * mettre � jour les shapes territoire 
    * relancer le install.db de l'atlas.


:notes:

    Votre utilisateur linux doit disposer des droits administrateur avec sudo. Voir https://www.privateinternetaccess.com/forum/discussion/18063/debian-8-1-0-jessie-sudo-fix-not-installed-by-default


Lancez ensuite l'installation des applications:
 
  ::  
  
	./install_all.sh

Le mot de passe sudo vous sera demand� 2 fois. 
Lors de l'ex�cution du script, 2 questions seront pos�e. R�pondre ``9`` puis ``3``

Vous devez pouvoir vous connecter � vos applications avec les adresses (adaptez mondomaine.fr � votre nom de domaine ou avec votre adresse IP)
	http://mondomaine.fr/usershub
	http://mondomaine.fr/geonature
	http://mondomaine.fr/taxhub
	http://mondomaine.fr/atlas


Les 3 premi�res applications demandent une authentification.

L'utilisateur ``admin`` avec le mot de passe ``admin`` est disponible par d�faut avec des droits administrateur sur toutes les applications. 
Vous devez utiliser UsersHub pour g�rer d'autres utilisateurs.

L'installation des bases de donn�es est logu�e dans le r�pertoire ``log`` des applications : ``log/install_db.log``.

:notes:

    L'application GeoNature-atlas est livr�e avec des donn�es exemples. Une fois l'installation de l'atlas termin�e, vous devez l'adapter � votre territoire. 
    * remplacez les shapes ``territoire.shp`` et ``communes.shp`` dans ``data/ref`` avec celles de votre territoire.
    * relancer le sript ``install.db``.