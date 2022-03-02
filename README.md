# OSM-vers-geostandardCNIG
Outils de manipulation de données d'accessibilité géostandard CNIG et OpenStreetMap (OSM).

## À propos du géostandard CNIG
Le géostandard du CNIG a été proposé par le [GT Accessibilité](http://cnig.gouv.fr/?page_id=18058), et vise à proposer un cadre de description de l'accessibilité des infrastructures de mobilité piétonne.

L'implémentation du géostandard que nous proposons ici au format PostGIS contient pour certains types énumérés une possibilité supplémentaire par rapport au format proposé par le GT accessibilité, identifiée ```88```, et permettant de renseigner le fait que la donnée a été importée depuis une base de données (typiquement OSM) qui n'est pas assez précise pour pouvoir renseigner le champ.

## Prérequis

Les logiciels suivants sont requis:

* [PostGiS](https://postgis.net/) (version 3.1.1), et donc [PostgreSQL](https://www.postgresql.org/)
* [QGIS](https://www.qgis.org/) (version 3.20)

Les logiciels suivants peuvent faciliter la prise en main:

* [DBeaver](https://dbeaver.io/)

## Installation

Pour créer une base de données au format géostandard CNIG, on utilise le script SQL proposé sur ce dépôt: [geostandard-CNIG.sql](postgis/geostandard-CNIG.sql).
Vous pouvez utiliser DBeaver pour cela, en l'ayant au préalable connecté à un serveur PostgreSQL.

*TODO*

## Retours utilisateurs

N'hésitez pas à utiliser les [issues de ce dépôt github](https://github.com/jmtrivial/OSM-vers-geostandardCNIG/issues) pour tout retour utilisateur.

## Notes et références

Cet outil est conçu au [LIMOS](https://limos.fr) (Université Clermont Auvergne), par les membres de [Compas](https://compas.limos.fr). Les premières versions ont été réalisées dans le cadre d'un projet étudiant par Eunice Wadjom. On peut trouver [le code source initial](https://github.com/eunicewadjom/OSMCNIGProject) ainsi que le rapport de recherche associé: [Models transformation and data integration in OpenStreetMap for accessibility: feasibility study from the geostandard.](https://compas.limos.fr/files/Eunice_WADJOM_Research_Project_Report.pdf) (en).

On trouvera plus d'informations sur les liens entre OpenStreetMap et le géostandard du CNIG sur le site de Compas: [Géostandard CNIG et OpenStreetMap](https://compas.limos.fr/geostandard-CNIG-et-OSM/).

### Auteurs et autrices

* Eunice Wadjon
* Jérémy Kalsron
* Jean-Marie Favreau

