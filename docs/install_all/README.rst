INSTALLATION RAPIDE
===================

Cette documentation permet une installation rapide et simplifi�e de GeoNature et de son environnement : UsersHub, TaxHub et GeoNature-atlas.
Les scripts propos�s installent l'environnement logiciel du serveur, t�l�chargent les applications sur leur d�pots github, les installent et les configurent.

Pr�-requis
----------

- Un serveur debian 8 (ubuntu 16.04 LTS devrait fonctionner �galement - non test�) 
- Une cl� IGN pour l'api geoportail valide pour le domaine sur lequel votre serveur r�pond.
- TODO : proposer un sources.list valide et la proc�dure pour le mettre � jour.

Installation
------------

Apr�s installation de l'OS avec OpenSSH server, placez vous dans le home de votre utilisateur et entrez les commandes suivantes :
 
  ::  
  
	wget https://raw.githubusercontent.com/PnEcrins/GeoNature/develop/docs/init_user.sh
	wget https://raw.githubusercontent.com/PnEcrins/GeoNature/develop/docs/install_all.ini
	wget https://raw.githubusercontent.com/PnEcrins/GeoNature/develop/docs/install_all.sh
    chmod +x init_user.sh
    chmod +x install_all.sh

    
lancez ensuite l'installation (le mot de passe de votre utilisateur vous sera demand� par sudo):
 
  ::  
  
	./install_all.sh