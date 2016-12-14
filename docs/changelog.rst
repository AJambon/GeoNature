=========
CHANGELOG
=========

1.8.0 dev (unreleased)
----------------------

**Corrections de bugs**

* Mise en coh�rence avec GeoNature-mobile utilisant les classes 'gasteropodes' et 'bivalves' et non la classe g�n�rique 'mollusques'.
* Am�lioration des triggers concernant la suppression de fiches orphelines
* Affichage par d�faut du nom latin pour contact flore et contact invert�br�s
* Correction pour l'export concernant la pr�sence de points-virgules dans les commentaires
* Suppression du besoin d'un super utilisateur lors de l'installation de la base
* Correction de l'id du protocole mortalit� et invertebres dans la configuration
* Suppression d'un doublon dans le fichier de configuration symfony de l'application
* Correction des coordonn�es lors de l'export flore station

**Nouveaut�s**

* Compatibilit� avec Taxhub et GeoNature-atlas
* Taxref V9
* Acc�s � la synth�se en consultation uniquement pour des utilisateurs enregistr�s avec des droits 1
* Ajout d'un champ diffusion oui/non en synth�se utilisable dans GeoNature-atlas (pas d'interface de gestion de ce champ pour le moment)
* Proposition d'un script d'installation simplifi� pour un pack UsersHub, TaxHub, GeoNature et GeoNature-atlas
* Factorisation des sql des sch�mas ``taxonomie`` et ``utilisateurs`` avec les d�pots TaxHub et UsersHub

**Note de version**

* Remplacer ``id_classe_mollusques`` par ``id_classe_gasteropodes`` dans ``web/js/config.js`` et renseigner la valeur en coh�rence avec l'id_liste retenu dans la table ``taxonomie.bib_listes`` pour les gast�ropodes. Attention, vous devez avoir �tabli une correspondance entre les taxons gast�ropodes et bivalves et leur liste dans la table ``taxonomie.cor_taxon_liste``.
* Ex�cuter le script sql ``data/update_1.7to1.8.sql``
* Mettre � jour taxref en V9 en vous inspirant du script ``data/taxonomie/inpn/update_taxref_v8tov9``

**taxhub**

L'application TaxHub devient fonctionnelle pour sa premi�re version. Vous pouvez l'installer. https://github.com/PnX-SI/TaxHub

Elle vous aidera � g�rer vos taxons. 

Taxhub �voluera pour int�grer progressivement de nouvelles fonctionnalit�s.

Il est conseill� de ne pas installer la base de donn�es TaxHub et de connecter l'application directement sur la base de donn�es de GeoNature

**GeoNature Atlas**

GeoNature Atlas sera �galement bas� sur Taxhub qui permettra la saisie des informations relatives aux taxons. GeoNature Atlas dispose de sa propre base de donn�es mais pour fonctionner en connexion avec le contenu de la base GeoNature il faudra une version 1.8 de GeoNature.
  

:notes:

    Une r�gression dans le contenu de Taxref V9 conduit � la suppression de l'information concernant le niveau de protection des esp�ces (r�gional, national, international,...). 
    Cette information �tait utilis�e par GeoNature, notamment pour d�finir les textes � retenir pour la colonne ``concerne_mon_territoire`` de la table ``taxonomie.taxref_protection_articles``.
    Vous devez d�sormais remplir cette colonne manuellement.


1.7.4 (2016-07-06)
------------------

**Corrections de bugs**

* Correction du script d'installation des tables li�es au Contact flore (5a1fb07)
* Mise en coh�rence avec GeoNature-mobile utilisant les classes 'gasteropodes' et 'bivalves' et non la classe g�n�rique 'mollusques'.

**Nouveaut�s**

* Corrections de mise en forme de la documentation
* Ajout de la liste rouge France de TaxRef lors d'une nouvelle installation (f4be2b6). A ne pas prendre en compte dans le cas d'une mise � jour.
* Ajout du MCD de la BDD - https://github.com/PnEcrins/GeoNature/blob/master/docs/2016-04-29-mcd_geonaturedb.png

**Note de version**

* Vous pouvez passer directement de la version 1.6.0 � la 1.7.4 mais en vous r�f�rant aux notes de version de la 1.7.0.
* Remplacer id_classe_mollusques par id_classe_gasteropodes dans web/js/config.js et renseigner la valeur en coh�rence avec l'id_liste retenu dans la table taxonomie.bib_listes pour les gast�ropodes. Attention, vous devez avoir �tabli une correspondance entre les taxons gast�ropodes et bivalves et leur liste dans la table taxonomie.cor_taxon_liste.


1.7.3 (2016-05-19)
------------------

**Corrections de bugs**

* Correction de coordonn�es vides dans l'export de Flore station. cf https://github.com/PnEcrins/GeoNature/commit/0793a3d3d2b3719ed515058d1a0ba9baf7cb2096
* Correction des triggers en base concernant un bug de saisie pour les taxons dont le taxon de r�f�rence n'est pas pr�sent dans ``taxonomie.bib_taxons``.

**Note de version**

Rappel : commencez par suivre la proc�dure classique de mise � jour. http://geonature.readthedocs.org/fr/latest/update.html
* Vous pouvez passer directement de la version 1.6.0 � la 1.7.3 mais en vous r�f�rant aux notes de version de la 1.7.0.
* Pour passer de la 1.7.2 � la 1.7.3 vous devez ex�cuter le script ``https://github.com/PnEcrins/GeoNature/blob/master/data/update_1.7.2to1.7.3.sql``.


1.7.2 (2016-04-27)
----------------------

**Corrections de bug**

* Correction d'un bug dans l'export XLS depuis Flore Station.

**Note de version**

* Vous pouvez passer directement de la version 1.6.0 � la 1.7.2 mais en vous r�f�rant aux notes de version de la 1.7.0.

1.7.1 (2016-04-27)
----------------------

**Corrections de bug**

* Ajout des listes flore manquantes dans le script de mise � jour ``data/update_1.6to1.7.sql``.

1.7.0 (2016-04-24)
----------------------

**Nouveaut�s**

* Ajout du contact flore
* Correction et compl�ments dans les statistiques et mise en param�tre de leur affichage ou non, ainsi que de la date de d�but � prendre en compte pour leur affichage.
* Ajout d'un module d'export des donn�es permettant d'offrir, en interne ou � des partenaires, un lien de t�l�chargement des donn�es bas� sur une ou des vues de la base de donn�es (un fichier par vue). Voir http://geonature.readthedocs.org/fr/latest/export.html
* Modification des identifiants des listes pour compatibilit� avec les applications GeoNature-Mobile.
* Compl�ment dans la base de donn�es pour compatibilit� avec les applications GeoNature-Mobile.
* Correction d'une erreur sur l'importation de shape pour la recherche g�ographique
* WMS : correction de la liste des sites N2000, correction de l'affichage de l'aire optimale d'adh�sion des parcs nationaux et retrait des sites inscrits et class�s
* Correction d'un bug permettant la saisie d'une date d'observation post�rieure � aujourd'hui dans Flore station
* Mention de la version de taxref sur la page d'accueil

**Note de version**

Rappel : commencez par suivre la proc�dure classique de mise � jour. http://geonature.readthedocs.org/fr/latest/update.html

**1.** Modification des identifiants des listes de taxons pour compatibilit� avec les applications GeoNature-Mobile.
   
Dans GeoNature-Mobile, les taxons sont filtrables par classe sur la base d'un ``id_classe``. Ces id sont inscrits en dur dans le code des applications mobiles. 

Dans la base GeoNature les classes taxonomiques sont configurables grace au vues ``v_nomade_classes`` qui utilisent les listes (``taxonomie.bib_listes``).

Les ``id_liste`` ont donc �t� mis � jour pour �tre compatibles avec les ``id_classe`` des applications mobiles.

Voir le script SQL d'update ``data/update_1.6to1.7.sql`` et LIRE ATTENTIVEMENT LES COMMENTAIRES.

* En lien avec les modifications ci-dessus, mettre � jour les variables des classes taxonomiques correspondant aux modification des ``id_liste`` dans ``web/js/config.js``

* Ajouter dans le fichier ``lib/sfGeonatureConfig.php`` les variables ``$struc_abregee``, ``$struc_long``, ``$taxref_version``, ``$show_statistiques`` et ``$init_date_statistiques`` (voir le fichier ``lib/sfGeonatureConfig.php.sample``)

**2.** Pour ajouter le Contact flore

* Ex�cuter le script sql ``data/2154/contactflore.sql``
* Ajouter les variables ``$id_lot_cflore  = 7``, ``$id_protocole_cflore  = 7``, ``$id_source_cflore = 7`` et ``$appname_cflore = 'Contact flore - GeoNature';`` dans ``lib/sfGeonatureConfig.php`` (voir le fichier d'exemple ``lib/sfGeonatureConfig.php.sample``)
* Ajouter les variables  ``id_lot_contact_flore = 7``, ``id_protocole_contact_flore = 7``, ``id_source_contactflore = 7`` dans ``web/js/config.js`` (voir le fichier d'exemple ``web/js/config.js.sample``)
* l'enregistrement correspondant au contact flore dans la table ``synthese.bib_sources`` doit �tre actif (derni�re colonne) pour que le contact flore soit accessible depuis la page d'accueil.
            
**3.** Afin de mettre � jour la configuration WMS, vous devez ex�cuter le fichier ``wms/update1.6to1.7.sh``. 

Au pr�alable, assurez vous que les informations renseign�es dans le fichier ``config/settings.ini`` sont � jour. L'ancien fichier sera sauvegard� sous ``wms/wms_1.6.map``. Vous pourrez faire le choix de conserver ou de supprimer ce fichier de sauvegarde qui ne sera pas utilis� par l'application.

   :: 

      ./wms/update1.6to1.7.sh
        
**4.** Mise en place du module d'export 

* Cr�er les vues retournant les donn�es attendues.
* Configurer le module dans le fichier ``lib/sfGeonatureConfig.php`` � partir de l'exemple du fichier ``lib/sfGeonatureConfig.php.sample``); section ``configuration du module d'export``
   
   * Vous pouvez param�trer plusieurs modules avec un nom pour chacun grace au param�tre ``exportname``
   * Pour chacun des modules seuls les utilisateurs de geonature dont le ``id_role`` figure dans le tableau ``authorized_roles_ids`` peuvent exporter les donn�es mises � disposition par le module d'export.
   * Chaque module peut comporter autant que vues que n�cessaire (un bouton par vue g�n�rera un fichier zip par vue). Renseigner le tableau ``views`` pour chacun des modules.
   * Voir la documentation ici : http://geonature.readthedocs.org/fr/latest/export.html

* Attribution des droits n�cessaires pour le r�pertoire permettant l'enregistrement temporaire des fichiers g�n�r�s par le module d'export.

   :: 

      chmod -R 775 web/uploads/exports
        
* R�tablir les droits d'�criture et vider le cache 

   ::

      chmod -R 777 cache/
      chmod -R 777 log/
      php symfony cc


1.6.0 (2016-01-14)
------------------

**Note de version**

* Pour les changements dans la base de donn�es vous pouvez ex�cuter le fichier ``data/update_1.5to1.6.sql``
* Mise � jour de la configuration Apache. Modifier le fichier ``apache/wms.conf`` en vous basant sur l'exemple https://github.com/PnEcrins/GeoNature/blob/master/apache/wms.conf.sample#L16-L17
* Ajouter le param�tre ``$id_application`` dans ``lib/sfGeonatureConfig.php.php`` (voir la valeur utilis�e pour GeoNature dans les tables ``utilisateurs.t_applications`` et ``utilisateurs.cor_role_droit_application``)
* Ajouter le param�tre ``import_shp_projection`` dans ``web/js/configmap.map`` - voir l'exemple dans le fichier ``https://github.com/PnEcrins/GeoNature/blob/master/web/js/configmap.js.sample#L35``
* Supprimer toute r�f�rence � gps_user_projection dans ``web/js/configmap.map`` 
* Ajouter un tableau JSON des projections disponibles pour l'outil de pointage GPS : ``gps_user_projections`` dans ``web/js/configmap.map``. Respecter la structure d�finie dans ``https://github.com/PnEcrins/GeoNature/blob/master/web/js/configmap.js.sample#L7-L14``. Attention de bien respecter la structure du tableau JSON et notamment sa syntaxe (accolades, virgules, nom des objects, etc...)
* Ajouter les ``id_liste`` pour les classes faune filtrables dans les formulaires de saisie dans le fichier ``web/js/config.map``. Ceci concerne les variables ``id_classe_oiseaux``, ``id_classe_mammiferes``, ``id_classe_amphibiens``, ``id_classe_reptiles``, ``id_classe_poissons`` et ``id_classe_ecrevisses``, ``id_classe_insectes``, ``id_classe_arachnides``, ``id_classe_myriapodes`` et  ``id_classe_mollusques``. Voir l'exemple dans le fichier ``https://github.com/PnEcrins/GeoNature/blob/master/web/js/config.js.sample#L32-44``
* Taxref a �t� mis � jour de la version 7 � 8. GeoNature 1.6.0 peut fonctionner avec la version 7. Cependant il est conseill� de passer en taxref V8 en mettant � jour la table ``synthese.taxref`` avec la version 8. Cette mise � jour pouvant avoir un impact fort sur vos donn�es, son automatisation n'a pas �t� pr�vue. Le script SQL de migration de vos donn�es de taxref V7 vers taxref V8 n'est donc pas fourni. Pour une installation nouvelle de la base de donn�es, GeoNature 1.6.0 est fourni avec taxref V8.
* Le routing a �t� mis � jour, vous devez vider le cache de Symfony pour qu'il soit pris en compte. Pour cela, placez vous dans le r�pertoire racine de l'application et effectuez la commande suivante :

    ::
    
        php symfony cc

**Changements**

* Les recherches dans la synth�se sont d�sormais faites sur le ``cd_ref`` et non plus sur le ``cd_nom`` pour retourner tous les synonymes du taxon recherch� - Fix #92
* Passage de taxref V7 � Taxref V8 - Fix #34
* Int�gration de la premi�re version de l'API permettant d'int�grer des donn�es dans la synth�se depuis une source externe - https://github.com/PnEcrins/GeoNature/blob/master/docs/geonature_webapi_doc.rst
* Mise en param�tre du ``id_application`` dans ``lib/sfGeonatureConfig.php.php`` - Fix #105
* Recharger la synthese apr�s suppression d'un enregistrement - Fix #94 
* L'utilisateur peut lui-m�me d�finir le syst�me de coordonn�es dans l'outil de pointage GPS - Fix #107 
* Mise en param�tre de la projection de la shape import�e comme zone de recherche dans la synth�se
* Les exports XLS et SHP comportent le ``cd_nom`` ET le ``cd_ref`` de tous les synonymes du nom recherch� ainsi que le nom_latin (bib_taxons) ET le nom_valide (taxref) - Fix #92
* SAISIE invert�br�s - Ajout d'un filtre Mollusques - Fix #117
* Am�lioration du vocabulaire utilis� sur la page d'accueil - #118
* Affichage d'un message pendant le chargement des exports
* Mise en place de statistiques automatiques sur la page d'accueil, bas�es sur les listes de taxons. A compl�ter. 

**Corrections de bug**

* Int�gration de la librairie ``OpenLayers.js`` en local dans le code car les liens distants ne fonctionnaient plus - Fix #97
* Correction d'une erreur lors de l'enregistrement de la saisie invert�br�s - Fix #104
* Correction d'une erreur de redirection si on choisit "Quitter" apr�s la saisie de l'enregistrement (contact faune, mortalit� et invert�br�s) - Fix #102
* Correction du trigger ``contactfaune.synthese_update_cor_role_fiche_cf()`` - Fix #95
* Correction d'un bug dans les listes d�roulantes des taxons filtr�e par classe qui n'affichaient rien - Fix #109 
* Correction d'un bug sur le contenu des exports shape avec le crit�re de protection activ� - Fix #114
* Correction et adaptation faune-flore des exports shape
* SYNTHESE - Correction de la liste des taxons sans nom fran�ais - Fix #116
* Corrections CSS sur la page d'accueil - Fix #115
* Correction sur la largeur de la liste des r�sultats de la synth�se - Fix #110
* Correction des doublons dans la recherche multi-taxons - Fix #101
* Autres corrections mineures


1.5.0 (2015-11-26)
------------------

**Note de version**

* Pour les changements dans la base de donn�es vous pouvez ex�cuter le fichier ``data/update_1.4to1.5.sql``
* Le bandeau de la page d'accueil ``web/images/bandeau_faune.jpg`` a �t� renomm� en ``bandeau_geonature.jpg``. Renommez le votre si vous aviez personnalis� ce bandeau.
* Si vous souhaitez d�sactiver certains programmes dans le "Comment ?" de la synth�se vous devez utiliser le champs ``actif`` de la table ``meta.bib_programmes``.
* Compl�ter si n�cessaire les champs ``url``, ``target``, ``picto``, ``groupe`` et ``actif`` dans la table ``synthese.bib_sources``.
* Nouvelle r�partition des param�tres de configuration javascript en 2 fichiers (``config.js`` et ``configmap.js``). Vous devez reprendre vos param�tres de configuration du fichier ``web/js/config.js`` et les ventiler dans ces deux fichiers.
* Ajouter le param�tre ``id_source_mortalite = 2;`` au fichier ``web/js/config.js``;
* Retirer le param�tre ``fuseauUTM;`` du fichier ``web/js/config.js``;
* Bien d�finir le syst�me de coordonn�es � utiliser pour les pointages par coordonn�es fournies en renseignant le param�tre ``gps_user_projection`` dans le fichier ``web/js/configmap.js``;
* Ajouter le param�tre ``public static $id_source_mortalite = 2;`` au fichier ``lib/sfGeonatureConfig.php``;
* Ajouter le param�tre ``public static $srid_ol_map = 3857;`` au fichier ``lib/sfGeonatureConfig.php``;
* L'altitude est calcul�e automatiquement � partir du service "Alticodage" de l'API GeoPortail de l'IGN et non pluas � partir de la couche ``layers.l_isolines20``. Ajoutez ce service dans votre contrat API Geoportail. Il n'est donc plus n�cessaire de remplir la couche ``layers.l_isolines20``. Cette couche peut toutefois encore �tre utile si l'utilisateur supprime l'altitude calcul�e par l'API Geoportail dans les formulaires de saisie.
* Le loup et le lynx sont retir�s par d�faut de la saisie (saisie recommand�e dans le protocole national du r�seau grands pr�dateurs)
* Le cerf, chamois et le bouquetin doivent �tre saisis selon 6 crit�res de sexe et age et non 5 comme les autres taxons. Comportement peut-�tre chang� en modifiant la vue ``contactfaune.v_nomade_taxons_faune``.
* Mortailit� est d�sormais une source � part enti�re alors qu'elles �taient m�lang�es avec la source ContactFaune pr�c�demment. Si vous avez d�j� des donn�es de mortalit� enregistr�es, vous devez adapter la requ�te SQL ci-dessous avec votre ``id_source`` pour Mortalit� et l'ex�cuter :
    
    ::
    
        UPDATE synthese.syntheseff SET id_source = 2 WHERE id_source = 1 AND id_critere_synthese = 2;

**Changements**

* Optimisation des vues aux chargement des listes de taxons. Fixes #64
* G�n�ricit� des champs dans ``meta.bib_programmes`` (champs ``sitpn`` renomm� en ``public``). Fixes #68
* Ajout d'un champ ``actif`` � la table ``meta.bib_programmes`` permettant de masquer certains programmes dans le "Comment ?" de la synth�se. Fixes #66
* Ajout d'un champ ``url``, ``target``, ``picto``, ``groupe`` et ``actif`` dans la table ``synthese.bib_sources`` pour g�n�rer la page d'accueil dynamiquement et de mani�re g�n�rique. Fixes #69
* Construire dynamiquement la liste des liens vers la saisie des diff�rents protocoles � partir de la table ``synthese.bib_sources``. Fixes #69
* Tous les styles des �l�ments de la page d'accueil ont �t� pass�s en CSS. Fixes #57
* Am�lioration de l'interface pendant le chargement des diff�rentes applications (synth�se, flore station, formualires de saisie...). Fixes #65
* Recentrage sur la position de l'utilisation en utilisant le protocole de g�olocalisation int�gr� au navigateur de l'utilisateur. Fixes #65
* Un message automatique conseille les utilisateurs d'Internet Explorer de plut�t utiliser Firefox ou Chrome. Fixes #65
* Tri par d�faut par date d�croissante des 50 derni�res observations affich�es � l'ouverture de la Synth�se. Fixes #51
* Vocabulaire. "Dessiner un point" remplac� par "Localiser l'observation". Fixes #66
* Mise � jour des copyrights dans les pieds de page de toutes les applications.
* Refonte du CSS du formulaire de login avec bootstrap et une image de fond diff�rente.
* Refonte Bootstrap de la page d'accueil.
* Homog�n�isation du pied de page.
* FloreStation et Bryophytes - Homog�n�iser interaction carte liste - ajout d'un popup au survol. Fixes #74
* Suppression d'images non utilis�es dans le r�pertoire ``web/images``.
* Mise en coh�rence des vues taxonomiques faune. Fixes #81
* Calcul de l'altitude � partir du service "Alticodage" de l'API GeoPortail de l'IGN.
* Factorisation et g�n�ralisation du module permettant un positionnement des pointages par saisie de coordonn�es selon projection et bbox fournies en param�tres de config.
* Cr�ation d'une configuration javascript carto d�di�e (``configmap.js``).
 
**Corrections de bug**
 
* Correction des probl�mes de saisie de la version 1.4.0 li�s � la migration de la taxonomie.
* Correction de bugs dans Flore Station et Bryophytes (Zoom, recherche


1.4.0 (2015-10-16)
------------------

**Note de version**

* La gestion de la taxonomie a �t� mis en conformit� avec le sch�ma ``taxonomie`` de la base de donn�es de TaxHub (https://github.com/PnX-SI/TaxHub). Ainsi le sch�ma ``taxonomie`` int�gr� � GeoNature 1.3.0 doit �tre globalement revu. L'ensemble des modifications peuvent �tre r�alis�es en �xecutant la partie correspondante dans le fichier ``data/update_1.3to1.4.sql`` (https://github.com/PnEcrins/GeoNature/blob/master/data/update_1.3to1.4.sql).
* De nouveaux param�tres ont potentiellement �t� ajout�s � l'application. Apr�s avoir r�cup�r� le fichier de configuration de votre version 1.3.0, v�rifiez les changements �ventuels des diff�rents fichiers de configuration.
* Modification du nom de l'host host h�bergeant la base de donn�es. databases --> geonatdbhost. A changer ou ajouter dans le ``/etc/hosts`` si vous avez d�j� install� GeoNature.
* Suivez la proc�dure de mise � jour : http://geonature.readthedocs.org/fr/latest/update.html

**Changements**

* A l'installation initiale, chargement en base des zones � statuts juridiques pour toute la France m�tropolitaine � partir des sources de l'INPN
* A l'installation initiale, chargement en base de toutes les communes de France
* Mise en place de la compatibilit� de la base avec le schema de TaxHub


1.3.0 (2015-02-11)
------------------

Pr�-Version de GeoNature - Faune ET Flore. Le fonctionnement de l'ensemble n'a pas �t� totalement test�, des bugs sont identifi�s, d'autres subsistent certainement.

**Changements**

* Grosse �volution de la base de donn�es
* Ajout de deux applications de saisie flore (flore station et bryophytes)
* Int�gration de la flore en sythese
* Ajouter un id_lot, id_organisme, id_protocole dans toutes les tables pour que ces id soit ajout�s vers la synthese en trigger depuis les tables et pas avec des valeurs en dur dans les triggers. Ceci permet d'utiliser les param�tres de conf de GeoNature
* Ajout d'une fonction � la base pour correction du dysfonctionnement du wms avec mapserver
* Suppression du champ id_taxon en synthese et lien direct de la synthese avecle taxref. ceci permet d'ajouter des donn�es en synthese directement dans la base sans ajouter tous les taxons manquants dans la table bib_taxons
* Suppression de la notion de coeur dans les crit�re de recherche en synthese
* Ajout d'un filtre faune flore fonge dans la synthese
* Ajout de l'embranchement et du regne dans les exports
* Permettre � des partenaires de saisir mais d'exporter uniquement leurs donn�es perso
* Ajout du d�terminateur dans les formulaires invert�br�s et contactfaune + en synthese
* Ajout du r�f�rentiel g�ographique de toutes les communes de France m�tropolitaine
* Ajout des zones � statuts juridiques de la r�gion sud-est (national � venir)
* Bugs fix
 
**BUG � identifier**

Installation :

* corriger l'insertion de donn�es flore station qui ne fonctionne pas

Bryophythes :

* Corriger la recherche avanc�e par date sans ann�es

Synth�se :

* la construction de l'arbre pour choisir plusieurs taxons ne tient pas compte des filtres
* le fonctionnement des unit�s geographiques n'a pas �t� test� (initialement con�u uniquement pour la faune)


1.2.0 (2015-02-11)
------------------

Version stabilis�e de GeoNature - Faune uniquement (Synth�se Faune + Saisie ContactFauneVertebre, ContactFauneInvertebre et Mortalit�).

**Changements**

* Modification du nom de l'application de FF-synthese en GeoNature
* Changement du nom des utilisateurs PostgreSQL
* Changement du nom de la base de donn�es
* Mise � jour de la documentation (http://geonature.readthedocs.org/)
* Automatisation de l'installation de la BDD
* Renommer les tables pour plus de g�n�ricit�
* Supprimer les tables inutiles ou trop sp�cifiques
* Gestion des utilisateurs externalis�e et centralis�e avec UsersHub (https://github.com/PnEcrins/UsersHub)
* Correction de bugs
* Pr�paration de l'int�gration de la Flore pour passer de GeoNature Faune � GeoNature Faune-Flore


1.1.0 (2014-12-11)
------------------

**Changements**

* Modification du sch�ma de la base pour �tre compatible taxref v7
* Import automatis� de taxref v7
* Suppression des tables de hi�rarchie taxonomique (famille, ordre, ...) afin de simplifier l'utilisation de la taxonomie.
* Cr�ation de la notion de groupe (para-taxonomique) � la place de l'utilisation des classes.
* Ajout de donn�es pour pouvoir tester de fa�on compl�te l'application (invert�br�s, vert�br�s)
* Ajout de donn�es exemples
* Bugs fix


1.0.0 (2014-12-10)
------------------

Version fonctionnelle des applications : visualisation de la synth�se faune, saisie d'une donn�e de contact (vert�br�s, invert�br�s, mortalit�)

**Changements**

* Documentation de l'installation d'un serveur Debian wheezy pas � pas
* Documentation de la mise en place de la base de donn�es
* Documentation de la mise en place de l'application et de son param�trage
* Script d'insertion d'un jeu de donn�es test
* Passage � PostGIS v2
* Mise en param�tre de la notion de lot, protocole et source

**Prochaines �volutions**

* Script d'import de taxref v7
* Utilisation pr�f�rentielle de la taxonomie de taxref plut�t que les tables de hi�rarchie taxonomique


0.1.0 (2014-12-01)
------------------

* Cr�ation du projet et de la documentation
