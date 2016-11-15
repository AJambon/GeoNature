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
    
	wget https://raw.githubusercontent.com/PnEcrins/GeoNature/develop/docs/install_all/init_user.sh
	wget https://raw.githubusercontent.com/PnEcrins/GeoNature/develop/docs/install_all/install_all.ini
	wget https://raw.githubusercontent.com/PnEcrins/GeoNature/develop/docs/install_all/install_all.sh
	chmod +x init_user.sh
	chmod +x install_all.sh

Mettez � jour le fichier ``install_all.ini`` avec vos informations. Attention, ne lancez pas les fichiers .sh tant que vous n'avez pas totalement compl�t� ce fichier.

Lancez la configuration de l'utilisateur linux (le mot de passe de votre utilisateur vous sera demand� par sudo):
  
  ::  
  
	sudo ./init_user.sh

Lancez ensuite l'installation des applications:
 
  ::  
  
	./install_all.sh

Le mot de passe sudo vous sera demand�. 
Lors de l'ex�cution du script, une question sera pos�e. 
Unable to find a suitable version for webcomponentsjs, please choose one by typing one of the numbers below:
    1) webcomponentsjs#~0.5.4 which resolved to 0.5.5 and is required by App States#0.6.9
    2) webcomponentsjs#* which resolved to 0.5.5 and is required by core-component-page#0.5.6
    3) webcomponentsjs#^0.6.0 which resolved to 0.6.3 and is required by polymer#0.5.6
R�pondre ``3``

Vous devez pouvoir vous connecter � vos applications avec les adresses (adaptez mondomaine.fr � votre nom de domaine ou avec votre adresse IP)
	http://mondomaine.fr/usershub
	http://mondomaine.fr/geonature
	http://mondomaine.fr/taxhub
	http://mondomaine.fr/atlas


Les 3 premi�res applications demandent une authentification.

L'utilisateur ``admin`` avec le mot de passe ``admin`` est disponible par d�faut avec des droits administrateur sur toutes les applications. 
Vous devez utiliser UsersHub pour g�rer d'autres utilisateurs.

L'installation des bases de donn�es est logu�e dans le r�pertoire ``log`` des applications : ``log/install_db.log``.