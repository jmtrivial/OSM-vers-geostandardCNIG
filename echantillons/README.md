# Échantillons

On trouve dans ce répertoire différents jeux de données, classés en deux familles:

* les fichiers au format PostGIS (```.sql```), qui peuvent être importés dans la base de données géostandard CNIG au préalable créée.
* des fichiers dans d'autres formats

Pour les fichiers dans d'autres formats, on trouve dans le répertoire [../scripts/](../scripts/) des scripts de conversion qui permettent de générer les fichiers ```.sql``` correspondants.

## Formats existants

En plus du format PostGIS du géostandard CNIG, on trouve aussi différents formats.

### OSM Wegoto CNIG

L'entreprise [Wegoto](https://www.wegoto.eu/) a partagé avec l'équipe Compas des données compatibles géostandard CNIG dans un format ```.osm```, que l'on peut notamment ouvrir avec [JOSM](https://josm.openstreetmap.de/), un éditeur de données OpenStreetMap (OSM).

La différence entre le format *OSM standard* et le format *OSM Wegoto CNIG* réside dans les clés/valeurs associées, qui ne sont pas celles utilisées dans la base de données collaborative, mais sont spécifiques aux besoins du géostandard CNIG.

### QGIS (gpkg, qgz et dxf)

Un projet étudiant de l'[ESGT](https://fr.wikipedia.org/wiki/%C3%89cole_sup%C3%A9rieure_des_g%C3%A9om%C3%A8tres_et_topographes) a travaillé à l'acquisition de données CNIG, sous la direction d'Arnauld Gallais. 

On trouvera dans le dossier [GABARIT_UTILISABLE](./autres-formats/220203_Livrable_PPP_ESGT_2022/220203_Données_PPP_ESGT_2022/GABARIT_UTILISABLE/) une documentation au format pdf et un projet QGIS (qgz) dont les couches au format [gpkg](https://www.geopackage.org/) (geopackage, conçu autour d'SQLite)
permettent de faire la saisie des données accessibilité.

Le dossier [autres-formats/220203_Livrable_PPP_ESGT_2022](./autres-formats/220203_Livrable_PPP_ESGT_2022/) contient un exemple de projet QGIS suivant ce gabarit, et issu de leur travail d'acquisition. Le fond de carte utilisé par les étudiants est un [PCRS](http://cnig.gouv.fr/?page_id=11745) (Plan Corps de Rue Simplifié) au format dxf.

