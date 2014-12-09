<?php 

class sfSyntheseConfig extends sfActions
{
	public static $id_lot_cf = 1;
	public static $id_lot_inv = 1;
	public static $id_protocole_cf = 1;
	public static $id_protocole_inv = 1;
	public static $id_protocole_mortalite = 1;
	public static $default_pdop = -1;
    //organisme producteur et propri�taire des donn�es
	public static $id_organisme = 2;
    //srid du fond de carte sur lequel les donn�es sont saisies.
    //ATTENTION ! Cette valeur doit �tre laiss�e � 3857. Elle correspond au srid du geoportail. Elle est valable en m�tropole et outre mer.
    //Cette valeur est pr�sente en dur dans le code de l'application. Elle correspond �galement aux champ des g�om�tries utilis�es dans la base pour consulter ou enregistrer des donn�es.
	public static $srid_dessin = 3857;
    //srid local et des couches communes, secteurs, unites g�ographiques, isoline20 et zones � statuts
    //Ce srid est utilis� dans les exports. 
    //Lorsque la base de donn�es est cr��e avec les scripts sql fournis (synthese_srid.sql), il faut choisir le script correspondant � la valeur port�e ci-dessous. 
    //Idem pour le script d'insertion des donn�es (synthese_data_srid.sql)
    //ATTENTION. Il faut mettre � jour le service wms interne de l'application qui utilise ce script. Fichier /var/www/localhost/private/trunk/synthesepn/wms/faune.map
	public static $srid_local = 2154;

}