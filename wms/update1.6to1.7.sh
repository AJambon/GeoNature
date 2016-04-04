#!/bin/bash

. config/settings.ini

echo "Recr�er le fichier de configuration wms..."
mv wms/wms.map wms/wms_1.6.map
cp wms/wms.map.sample wms/wms.map

echo "Configuration du fichier wms/wms.map ..."
sed -i "s/CONNECTION \"host=geonatdbhost.*$/CONNECTION \"host=geonatdbhost dbname=$db_name user=$user_pg password=$user_pg_pass\"/" wms/wms.map

echo "Le fichier wms/wms.map a �t� mis � jour. L'ancien fichier a �t� sauvegard� sous wms/wms_1.6.map. Vous pouvez conserver ou supprimer ce fichier de sauvegarde qui n'est pas utilis� par l'application."