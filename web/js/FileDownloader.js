FileDownloader = {
  load : function(config) {
    var el = Ext.getBody();

    //cr�ation de l'url avec d'eventuels param�tres
    var url = config.url + (config.params ? '?' + Ext.urlEncode(config.params) : '');
    var format = config.format || 'pdf';

    return new Promise(function(resolve, reject) {
      //Si le navigateur g�re la cr�ation d'URL � partir de blob
      if (!Ext.isEmpty(window.URL) && Ext.isFunction(window.URL.createObjectURL) && window.Blob) {
        //Alors on va effectuer une requ�te ajax
        var xhr = new XMLHttpRequest();
        xhr.open('GET', url, true);
        xhr.responseType = 'blob';

        xhr.onload = function(e) {
          //Et si tout s'est bien pass�
          if (this.status == 200) {
            //Alors on construit un blob avec la r�ponse
            var blob = new Blob([this.response], {
              type : e.currentTarget.response.type
            });

            //On en g�n�re un URL
            var url = window.URL.createObjectURL(blob);

            //Et on va regarder si on a dans les param�tres un nom de fichier
            var fileName = config.filename || 'fichier';

            //Et on peut alors resolve notre promise
            resolve(url);

            //On r�cup�re la bonne extension suivant le format choisi
            if (navigator.msSaveBlob) {
              navigator.msSaveBlob(blob, fileName + "." + format);
            } else {
              //On construit alors une balise <a>, avec l'attribut "download" qui permet de sp�cifier le nom du fichier qui sera t�l�charg�
              var a = el.createChild({
                tag : 'a',
                href : url,
                download : fileName + "." + format
              });
              //Et on lance le click sur le lien pour afficher le fen�tre de t�l�chargement
              a.dom.click();
            }

          } else {
            //Si il y a eu un probl�me, on reject avec le code erreur
            reject(this.status);
          }
        };

        xhr.send();

      } else {
        resolve(url);
        window.location = url;
      }
    });
  }
};
