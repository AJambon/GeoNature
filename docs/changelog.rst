=========
CHANGELOG
=========

1.6.0 dev (2015-12-21)
------------------

**Note de version**

* Pour les changements dans la base de donn�es vous devez ex�cuter le fichier ``data/update_1.5to1.6.sql``
* ajouter le param�tre ``$id_application`` dans ``lib/sfGeonatureConfig.php.php`` (voir la valeur utilis�e pour GeoNature dans les tables "utilisateurs.t_applications" et "utilisateurs.cor_role_droit_application")


**Changements**

* Correction d'une erreur lors de l'enregistrement de la saisie invert�br�s. - Fix #104
* Mise en param�tre du id_application dans ``lib/sfGeonatureConfig.php.php`` - Fix #105
* Recharger la synthese apr�s suppression d'un enregistrement - Fix #94 
* Correction d'une erreur de redirection si on choisi "quitter" apr�s la saisie de l'enregistrement (contact faune, mortalit� et invert�br�s) - Fix #102
* Correction et adaptation faune-flore des exports shape 


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
* Bien d�finir le syst�me de coordonn�es � utiliser pour les pointages par coordonn�es fournies en renseignant le param�tre ``gps_user_projection`` dans le fichier ``web/js/config.js``;
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
* Suivez la proc�dure de mise � jour : http://geonature.readthedocs.org/fr/latest/installation.html#mise-a-jour-de-l-application

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
