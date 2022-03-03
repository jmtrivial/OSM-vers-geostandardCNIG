# Échantillons

On trouve dans ce répertoire différents jeux de données, classés en deux familles:

* les fichiers au format PostGIS (```.sql```), qui peuvent être importés dans la base de données géostandard CNIG au préalable créée.
* des fichiers dans d'autres formats

Pour les fichiers dans d'autres formats, on trouve dans le répertoire [../scripts/](../scripts/) des scripts de conversion qui permettent de générer les fichiers ```.sql``` correspondants.

## Formats existants

En plus du format SQL géostandard CNIG, on trouve aussi différents formats.

### OSM Wegoto CNIG

L'entreprise [Wegoto](https://www.wegoto.eu/) a partagé avec l'équipe Compas des données compatibles géostandard CNIG dans un format ```.osm```, que l'on peut notamment ouvrir avec [JOSM](https://josm.openstreetmap.de/), un éditeur de données OpenStreetMap (OSM).

La différence entre le format *OSM standard* et le format *OSM Wegoto CNIG* réside dans les clés/valeurs associées, qui ne sont pas celles utilisées dans la base de données collaborative, mais sont spécifiques aux besoins du géostandard CNIG.