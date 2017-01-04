#fichier de synchronisation des donn�es des r�pertoires les plus fr�quemment modifier sur les serveurs OVH
#Ce script copie les fichiers du serveur OVH vers le serveur client (pas d'historique)
#Un daemon rsync tourne sur les 2 serveurs OVH avec des modules (trunk, htdocs) param�tr�s pour servir la synchronisations des r�pertoires voulus
#un fichier "/root/secret" comportant le mot de passe de l'utilisateur rsyncuser sur ces deux serveurs est en place sur le serveur client avec un chmod 600

#variables pour identifier les fichiers � synchroniser selon le jour et le mois
DAY=`date +%d`
export LC_ALL="en_EN.UTF-8" 
MONTH=`date +%B |tr 'A-Z' 'a-z'`

#Exemple de synchronisation cot� client (local)
rsync -avroz --password-file=/root/secret --delete --exclude="**/.svn/" --exclude="**/cache/" --exclude="**/temp/" --exclude="**/log/" rsyncuser@mondomaine.fr::geonature /home/mylocaluser/svg_geonature/home/mylinuxuser/geonature
rsync -avroz --password-file=/root/secret --delete --exclude="**/.svn/" --exclude="**/cache/" --exclude="**/temp/" --exclude="**/log/" rsyncuser@mondomaine.fr::taxhub /home/mylocaluser/svg_geonature/home/mylinuxuser/usershub
rsync -avorz --password-file=/root/secret --delete rsyncuser@mondomaine.fr::pgsql/pgsql_$DAY.tar.gz /home/mylocaluser/svg_postgres/var/backups/pgsql/pgsql_$DAY.tar.gz