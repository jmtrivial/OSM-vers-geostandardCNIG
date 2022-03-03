#!/usr/bin/env python3
# coding: utf-8

import xml.etree.ElementTree as ET
import argparse

class SQLUtil:

    def sql_value(value):
        if value == None:
            return "null"
        elif isinstance(value, bool):
            return "true" if value else "false"
        elif isinstance(value, (int, float)):
            return str(value)
        else:
            return "'" + str(value) + "'"

    def sql_insert_request(table, schema, data):
        sql = "INSERT INTO "
        if schema != "":
            sql += schema + "."
        sql += "\"" + table + "\" ("
        sql += ",".join(["\"" + d + "\"" for d in data])
        sql += ") VALUES ("
        sql += ",".join([SQLUtil.sql_value(data[d]) for d in data])
        sql += ");\n"
        return sql

class CNIGUtil:
    identifiants = {}

    def getNewIdentifiant(prefixe):
        if prefixe in CNIGUtil.identifiants:
            return max([int(x) for x in CNIGUtil.identifiants[prefixe]]) + 1
        else:
            return 0

    def addIdentifiant(prefixe, identifiant):
        if not prefixe in CNIGUtil.identifiants:
            CNIGUtil.identifiants[prefixe] = []
        CNIGUtil.identifiants[prefixe].append(identifiant)

    def getCodeINSEE(commune, codepostal):
        if commune == "Aubière" and codepostal == "63170":
            return "63014"
    
    def getUniqueIdentifiant(codespace, codeclasse, identifiant = None):
        prefixe = codespace + ":" + codeclasse + ":"
        if identifiant == None:
            identifiant = CNIGUtil.getNewIdentifiant(prefixe)
        CNIGUtil.addIdentifiant(prefixe, identifiant)
        return prefixe + str(identifiant) + ":LOC"


class OSMUtil:

    def toChar2(val):
        l = len(val)
        if l == 2:
            return val
        elif l == 1:
            return "0" + val
        else:
            return "00"

    def get_xml_tag(node, tag, char2 = False):
        for c in node:
            if c.tag == "tag" and c.attrib["k"] == tag:
                if char2:
                    return OSMUtil.toChar2(c.attrib["v"])
                else:
                    return c.attrib["v"]
        return None

class AbstractPoint:
    pass

# un point OSM
class Point(AbstractPoint):
    def __init__(self, xml_node):
        self.lat = float(xml_node.attrib["lat"])
        self.lng = float(xml_node.attrib["lon"])
        self.id = int(xml_node.attrib["id"])
        self.xml_node = xml_node
        self.type = []

    def get_xml_tag(self, key, char2 = False):
        return OSMUtil.get_xml_tag(self.xml_node, key, char2)

    def latlng(self):
        return str(self.lat) + " " + str(self.lng)

    def __str__(self):
        return str((self.lat, self.lng))

    def __repr__(self):
        return str((self.lat, self.lng))

# le mécanisme de décoration pour construire les classes du géostandard
class PointDecorator(AbstractPoint):

    _point: AbstractPoint = None
    
    def __init__(self, point: AbstractPoint):
        self._point = point
        self._data = {}
        self._point.type.append(type(self).__name__)

    def sql_insert_request(self, table, schema, geometry):
        return SQLUtil.sql_insert_request(table, schema, self._data)

    def get_xml_tag(self, key, char2 = False):
        return self._point.get_xml_tag(key, char2)

    def get_id_noeud(self):
        return self._point.get_id_noeud()

    def getIdentifiant(self, codeClasse, idTechnique = None):
        commune = self.get_xml_tag("adr_ville")
        codepostal = self.get_xml_tag("adr_cp")
        codeINSEE = CNIGUtil.getCodeINSEE(commune, codepostal)
        return CNIGUtil.getUniqueIdentifiant(codeINSEE, codeClasse, idTechnique)

    @property
    def point(self) -> str:
        return self._point

    @property
    def id(self) -> str:
        return self._point.id

    def latlng(self):
        return self._point.latlng()

    @property
    def lat(self) -> str:
        return self._point.lat
    
    @property
    def lng(self) -> str:
        return self._point.lng

    @property
    def type(self) -> str:
        return self._point.type


class AbstractLineaire:
    pass

# les ways d'OSM
class Lineaire(AbstractLineaire):
    def __init__(self, xml_way, noeuds):
        self.points = [noeuds[child.attrib["ref"]] for child in xml_way if child.tag == "nd"]
        self.id = int(xml_way.attrib["id"])
        self.xml_way = xml_way
        self.type = []

    def __str__(self):
        return str((self.type, str(len(self.points)) + " points"))

    def __repr__(self):
        return str((self.type, str(len(self.points)) + " points"))

    def get_xml_tag(self, key, char2 = False):
        return OSMUtil.get_xml_tag(self.xml_way, key, char2)


# le mécanisme de décoration pour ajouter les classes du géostandard
class LineaireDecorator(AbstractLineaire):

    _lineaire: AbstractLineaire = None
    
    def __init__(self, lineaire: AbstractLineaire):
        self._lineaire = lineaire
        self._data = {}
        self._lineaire.type.append(type(self).__name__)

    def sql_insert_request(self, table, schema, geometry):
        return SQLUtil.sql_insert_request(table, schema, self._data)

    def get_xml_tag(self, key, char2 = False):
        return self._lineaire.get_xml_tag(key, char2)

    def getIdentifiant(self, codeClasse, idTechnique = None):
        commune = self.get_xml_tag("adr_ville")
        codepostal = self.get_xml_tag("adr_cp")
        codeINSEE = CNIGUtil.getCodeINSEE(commune, codepostal)
        return CNIGUtil.getUniqueIdentifiant(codeINSEE, codeClasse, idTechnique)

    def __str__(self):
        return str(self._lineaire)

    def __repr__(self):
        return str(self._lineaire)

    def get_id_troncon(self):
        return self._lineaire.get_id_troncon()

    @property
    def lineaire(self) -> str:
        return self._lineaire

    @property
    def id(self) -> str:
        return self._lineaire.id

    @property
    def points(self) -> str:
        return self._lineaire.points

    @property
    def type(self) -> str:
        return self._lineaire.type

class Geostandard:
    # classe correspondant au noeud géostandard
    class Noeud(PointDecorator):
        node_types = {
                "noeud": "1",
                "lieu": "2",
                "objet": "3",
                "traversee": "4",
                "porte": "5",
                "sortie_vehicule": "6",
                "ilot": "7",
                "rupture": "8",
                "escaliers": "9"
            }

        def get_id_noeud(self):
            return self._data["idNoeud"]


        def __init__(self, decorated_point):
            PointDecorator.__init__(self, decorated_point)
            self._data["idNoeud"] = self.getIdentifiant("NOD", self.get_xml_tag("node_id"))
            self._data["altitude"] = None # non défini
            if self.get_xml_tag("tra_bev") != None:
                self._data["bandeEveilVigilance"] = self.get_xml_tag("tra_bev", True)
                self._data["hauteurRessaut"] = float(self.get_xml_tag("tra_ressaut"))
                self._data["abaissePente"] = int(self.get_xml_tag("tra_pente"))
                self._data["abaisseTrottoir"] = None # non défini
                self._data["controleBEV"] = self.get_xml_tag("tra_bev_etat_id", True)
                self._data["bandeInterception"] = None # non défini
            else:
                self._data["bandeEveilVigilance"] = None
                self._data["hauteurRessaut"] = None
                self._data["abaissePente"] = None
                self._data["abaisseTrottoir"] = None
                self._data["controleBEV"] = None
                self._data["bandeInterception"] = None
            self._data["geom"] = "POINT(" + str(self.lat) + " " + str(self.lng) + ")"

        def to_sql(self, schema):
            return self.sql_insert_request("Noeud", schema, True)

        def is_valid_xml_entry(entry):
            return OSMUtil.get_xml_tag(entry, "node_type_id") not in [Geostandard.Noeud.node_types["objet"]]

    # classe correspondant au tronçon géostandard
    class TronconCheminement(LineaireDecorator):

        def __init__(self, decorated_lineaire):
            LineaireDecorator.__init__(self, decorated_lineaire)
            self._data["idTroncon"] = self.getIdentifiant("TRC", self.get_xml_tag("way_id"))
            self._data["from"] = self.getIdentifiant("NOD", self.get_xml_tag("node_from_id"))
            self._data["to"] = self.getIdentifiant("NOD", self.get_xml_tag("node_to_id"))
            self._data["longueur"] = None # TODO: à calculer
            self._data["typeTroncon"] = self.get_xml_tag("way_type_id", True)
            self._data["statutVoie"] = None # (voie classique, zone 30, etc) non disponible
            self._data["pente"] = int(self.get_xml_tag("way_pente")) # TODO: intégrer "way_pente_sens"
            self._data["devers"] = int(self.get_xml_tag("way_devers")) # TODO: intégrer "way_devers_sens"
            self._data["accessibiliteGlobale"] = None # (accessible, accessibilité moyenne, non accessible) non disponible
            self._data["geom"] = "LineString(" + ",".join([p.latlng() for p in self.points]) + ")"

        def get_id_troncon(self):
            return self._data["idTroncon"]

        def to_sql(self, schema):
            return self.sql_insert_request("Troncon_Cheminement", schema, True)

        def is_valid_xml_entry(entry):
            return OSMUtil.get_xml_tag(entry, "node_from_id") != None

    # classe correspondant à un escalier géostandard
    class Escalier(LineaireDecorator):

        def __init__(self, decorated_lineaire):
            LineaireDecorator.__init__(self, decorated_lineaire)
            self._data["idEscalier"] = self.getIdentifiant("ESC")
            self._data["etatRevetement"] = self.get_xml_tag("way_surf_q_id", True)
            garde_d = self.get_xml_tag("way_garde_d") # TODO: utiliser way_esc_barre ?
            garde_g = self.get_xml_tag("way_garde_d")
            if garde_d:
                self._data["mainCourante"] = "04" if garde_g else "02"
            else:
                self._data["mainCourante"] =  "03" if garde_g else "01"
            self._data["dispositifVigilance"] = "02" if self.get_xml_tag("way_esc_bev_h") else "01" # pas aussi fin, manque 03, 04, 05
            self._data["contrasteVisuel"] = None # TODO: non défini, mais peut-être au niveau des noeuds
            self._data["largeurUtile"] = float(self.get_xml_tag("way_esc_larg"))
            self.get_xml_tag("way_garde_d")
            self._data["mainCouranteContinue"] = None # TODO: non défini le long des ways, mais sur les noeuds extrémité
            self._data["prolongMainCourante"] = None # TODO: non défini le long des ways, mais sur les noeuds extrémité
            self._data["nbMarches"] = int(self.get_xml_tag("way_esc_nb_m"))
            self._data["nbVoleeMarches"] = 1 # à confirmer
            self._data["hauteurMarche"] = float(self.get_xml_tag("way_esc_h_m"))
            self._data["giron"] = float(self.get_xml_tag("way_esc_giron"))

            # clé étrangère
            self._data["idTroncon"] = self.get_id_troncon()

        def to_sql(self, schema):
            sql = self._lineaire.to_sql(schema)
            return sql + "\n" + self.sql_insert_request("Escalier", schema, False)

        def is_valid_xml_entry(entry):
            return OSMUtil.get_xml_tag(entry, "way_esc_type") != None


    # classe correspondant à une traversée géostandard
    class Traversee(LineaireDecorator):

        def __init__(self, decorated_lineaire):
            LineaireDecorator.__init__(self, decorated_lineaire)
            self._data["idTraversee"] = self.getIdentifiant("TRA")
            self._data["etatRevetement"] = self.get_xml_tag("way_surf_q_id", True)
            self._data["marquageSol"] = self.get_xml_tag("way_tra_marq_id", True)
            self._data["eclairage"] = None # non disponible
            self._data["feuPietons"] = bool(self.get_xml_tag("way_feux"))
            self._data["aideSonore"] = "02" if bool(self.get_xml_tag("way_feux_s")) else "01" # manquent les autres valeurs
            self._data["repereLineaire"] = self.get_xml_tag("way_guidage", True)
            self._data["presenceIlot"] = bool(self.get_xml_tag("way_tra_ilot"))
            self._data["chausseeBombee"] = None # non disponible
            self._data["covisibilite"] = None # non disponible

            # clé étrangère
            self._data["idTroncon"] = self.get_id_troncon()

        def to_sql(self, schema):
            sql = self._lineaire.to_sql(schema)     
            return sql + "\n" + self.sql_insert_request("Traversee", schema, False)


        def is_valid_xml_entry(entry):
            return OSMUtil.get_xml_tag(entry, "way_tra_marq_id") != None

    # classe correspondant à un obstacle géostandard
    class Obstacle(PointDecorator):
        def __init__(self, decorated_point):
            PointDecorator.__init__(self, decorated_point)
            self._data["idObstacle"] = self.getIdentifiant("OBS")
            self._data["typeObstacle"] = None
            self._data["largeurUtile"] = None
            self._data["positionObstacle"] = None
            self._data["longueurObstacle"] = None
            self._data["rappelObstacle"] = None
            self._data["reperabiliteVisuelle"] = None
            self._data["largeurObstacle"] = None
            self._data["hauteurObsPoseSol"] = None
            self._data["hauteurSousObs"] = None

            self._data["geom"] = "POINT(" + str(self.lat) + " " + str(self.lng) + ")"
            # TODO: pas de tronçon à associer?

        def to_sql(self, schema):
            return self.sql_insert_request("Obstacle", schema, True)

        def is_valid_xml_entry(entry):
            return OSMUtil.get_xml_tag(entry, "node_type_id") == Geostandard.Noeud.node_types["objet"]

    class Entree(PointDecorator):

        def pays(num):
            if num == 100:
                return "France"
            else:
                return "no"

        def __init__(self, decorated_point):
            PointDecorator.__init__(self, decorated_point)
            self._data["idEntree"] = self.getIdentifiant("ENT", self.get_xml_tag("prt_id"))
            self._data["adresse"] = self.get_xml_tag("adr_txt") + " " + self.get_xml_tag("adr_cp") + \
                    " " + self.get_xml_tag("adr_ville") + " " + Geostandard.Entree.pays(self.get_xml_tag("adr_pays")) # TODO: utiliser le bâtiment rattaché ?
            self._data["type"] = self.get_xml_tag("ptr_acces_id")
            self._data["rampe"] = "01" if self.get_xml_tag("ptr_ramp") else "03" # manque rampe amovible
            self._data["rampeSonnette"] = None # non défini
            self._data["ascenseur"] = None # non défini
            self._data["escalierNbMarche"] = None # autre information proche: prt_esc_h_r
            self._data["escalierMainCourante"] = None
            self._data["reperabilite"] = None # non défini
            self._data["reperageEltsVitres"] = self.get_xml_tag("prt_vitre_id") in [ "1", "2", "3"] # deux bandes, ou une seule, à 160 ou à 110cm
            self._data["signaletique"] = None
            larg = self.get_xml_tag("prt_l140_id")
            self._data["largeurPassage"] = 140 if larg == "1" else 83 if larg == "2" else 77 if larg == "3" else None # comment coder inférieur à 77?
            self._data["controleAcces"] = self.get_xml_tag("prt_acces_id", True)
            self._data["entreeAccueilVisible"] = None
            self._data["eclairage"] = None # non défini
            self._data["typePorte"] = self.get_xml_tag("prt_ouvre_id", True) # TODO: mapping pas équivalent
            self._data["typeOuverture"] = None # TODO non défini complètement, utiliser self.get_xml_tag("prt_ouvre_id", True)
            eext = self.get_xml_tag("prt_ufr_ext")
            eint = self.get_xml_tag("prt_ufr_int")
            if eext:
                self._data["espaceManoeuvre"] = "04" if eint else "02"
            else:
                self._data["espaceManoeuvre"] = "03" if eint else "01"
            self._data["largManoeuvreExt"] = 9999 if eext else None
            self._data["longManoeuvreExt"] = 9999 if eext else None
            self._data["largManoeuvreInt"] = 9999 if eint else None
            self._data["longManoeuvreInt"] = 9999 if eint else None
            self._data["typePoignee"] = None # semblable mais différent à self.get_xml_tag("prt_pg_id")]
            self._data["effortOuverture"] = None

            # clé étrangère
            self._data["idNoeud"] = self.get_id_noeud()


        def to_sql(self, schema):
            sql = self._point.to_sql(schema)     
            return sql + "\n" + self.sql_insert_request("Entree", schema, False)


        def is_valid_xml_entry(entry):
            return OSMUtil.get_xml_tag(entry, "prt_id") != None


def generer_requetes_sql(noeuds, lignes, schema):
    result = "-- \n"
    result += "-- données au format Geostandard CNIG\n"
    result += "-- \n\n\n"

    result += "-- Données ponctuelles \n"
    for n in noeuds:
        result += noeuds[n].to_sql(schema)

    result += "\n\n\n-- Données linéaires \n"
    for l in lignes:
        result += lignes[l].to_sql(schema)

    return result

parser = argparse.ArgumentParser(description="Outil de conversion du format Wegoto au format PostGIS. \
Le format Wegoto reprend la structure des fichiers OSM (xml avec node et ways) \
en ajoutant des attributs spécifiques au format géostandard du CNIG. \
Le présent script réalise une conversion depuis le format OSM-wegoto vers \
un fichier SQL qui pourra être chargé dans les tables PostGIS.")

parser.add_argument('-i', '--input', required=True, help='Fichier source (.osm)', type=argparse.FileType('r'))
parser.add_argument('-s', '--schema', help='Nom du schema SQL à utiliser', default="geostandard")
parser.add_argument('-o', '--output', help='Fichier cible (.sql)', type=argparse.FileType('w'))

args = parser.parse_args()

# chargement du fichier osm
tree = ET.parse(args.input)
root = tree.getroot()


noeuds = {}


# on charge les noeuds
for child in root:
    if child.tag == "node":
        noeud = Point(child)
        if Geostandard.Noeud.is_valid_xml_entry(child):
            # c'est un noeud extrémité de tronçon de cheminement
            noeud = Geostandard.Noeud(noeud)
        
        if Geostandard.Obstacle.is_valid_xml_entry(child):
            # c'est un obstacle
            noeud = Geostandard.Obstacle(noeud)

        if Geostandard.Entree.is_valid_xml_entry(child):
            # c'est une entrée
            noeud = Geostandard.Entree(noeud)


        noeuds[child.attrib["id"]] = noeud

# on charge les lignes
lignes = {}
for child in root:
    if child.tag == "way":
        ligne = Lineaire(child, noeuds)

        if Geostandard.TronconCheminement.is_valid_xml_entry(child):
            # c'est un tronçon
            ligne = Geostandard.TronconCheminement(ligne)

        if Geostandard.Traversee.is_valid_xml_entry(child):
            # c'est une traversée
            ligne = Geostandard.Traversee(ligne)

        if Geostandard.Escalier.is_valid_xml_entry(child):
            # c'est un escalier
            ligne = Geostandard.Escalier(ligne)

        lignes[child.attrib["id"]] = ligne


sql = generer_requetes_sql(noeuds, lignes, args.schema)
if args.output:
    with open(args.output.name, 'w') as the_file:
        the_file.write(sql)
else:
    print(sql)

