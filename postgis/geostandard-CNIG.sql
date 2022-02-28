--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: geostandard; Type: SCHEMA; Schema: -; 
--

CREATE SCHEMA IF NOT EXISTS geostandard;

--
-- TOC entry 4095 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA geostandard; Type: COMMENT; Schema: -; 
--

COMMENT ON SCHEMA geostandard IS 'standard geostandard schema';

SET search_path TO 'geostandard';

CREATE EXTENSION IF NOT EXISTS postgis;

--
-- TOC entry 1459 (class 1247 OID 99850)
-- Name: charenum; Type: TYPE; Schema: geostandard; 
--

CREATE TYPE geostandard.charenum AS ENUM (
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18'
);




--
-- TOC entry 1468 (class 1247 OID 99966)
-- Name: enum18; Type: TYPE; Schema: geostandard; 
--

CREATE TYPE geostandard.enum18 AS ENUM (
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '00',
    '99',
    '88'
);




--
-- TOC entry 1471 (class 1247 OID 100004)
-- Name: enum20; Type: TYPE; Schema: geostandard; 
--

CREATE TYPE geostandard.enum20 AS ENUM (
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '99',
    '00',
    '88'
);




--
-- TOC entry 1477 (class 1247 OID 100060)
-- Name: enum3; Type: TYPE; Schema: geostandard; 
--

CREATE TYPE geostandard.enum3 AS ENUM (
    '01',
    '02',
    '03',
    '99',
    '00',
    '88'
);




--
-- TOC entry 1486 (class 1247 OID 100096)
-- Name: enum4; Type: TYPE; Schema: geostandard; 
--

CREATE TYPE geostandard.enum4 AS ENUM (
    '01',
    '02',
    '03',
    '04',
    '00',
    '99',
    '88'
);




--
-- TOC entry 1483 (class 1247 OID 100084)
-- Name: enum5; Type: TYPE; Schema: geostandard; 
--

CREATE TYPE geostandard.enum5 AS ENUM (
    '01',
    '02',
    '03',
    '04',
    '05',
    '99',
    '00',
    '77',
    '88'
);




--
-- TOC entry 1474 (class 1247 OID 100046)
-- Name: enum6; Type: TYPE; Schema: geostandard; 
--

CREATE TYPE geostandard.enum6 AS ENUM (
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '99',
    '00',
    '88'
);




--
-- TOC entry 1480 (class 1247 OID 100068)
-- Name: enum7; Type: TYPE; Schema: geostandard; 
--

CREATE TYPE geostandard.enum7 AS ENUM (
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '99',
    '00',
    '88'
);




--
-- TOC entry 1492 (class 1247 OID 100130)
-- Name: enum8; Type: TYPE; Schema: geostandard; 
--

CREATE TYPE geostandard.enum8 AS ENUM (
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '99',
    '00',
    '88'
);




--
-- TOC entry 1489 (class 1247 OID 100106)
-- Name: enum98; Type: TYPE; Schema: geostandard; 
--

CREATE TYPE geostandard.enum98 AS ENUM (
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '98',
    '99',
    '00',
    '88'
);




--
-- TOC entry 1465 (class 1247 OID 99952)
-- Name: liststatutvoie; Type: TYPE; Schema: geostandard; 
--

CREATE TYPE geostandard.liststatutvoie AS ENUM (
    '01',
    '02',
    '03',
    '04',
    '05',
    '06'
);




--
-- TOC entry 1495 (class 1247 OID 100148)
-- Name: listtypeerp; Type: TYPE; Schema: geostandard; 
--

CREATE TYPE geostandard.listtypeerp AS ENUM (
    'J',
    'L',
    'M',
    'N',
    'O',
    'P',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'PA',
    'SG',
    'PS',
    'GA',
    'OA',
    'REF',
    '99',
    '00'
);




--
-- TOC entry 1462 (class 1247 OID 99902)
-- Name: listtypetroncon; Type: TYPE; Schema: geostandard; 
--

CREATE TYPE geostandard.listtypetroncon AS ENUM (
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '00',
    '88',
    '99'
);




SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 99442)
-- Name: Ascenceur; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard."Ascenceur" (
    "idAscenseur" integer NOT NULL,
    "largeurUtile" real,
    "diamZoneManoeuvre" real,
    "largeurCabine" real,
    "touchesEnRelief" geostandard.enum3,
    "signalSonore" boolean,
    "equipBim" boolean,
    miroir boolean,
    eclairage integer,
    "voyantAlerte" geostandard.enum4,
    "annonceEtage" geostandard.enum8,
    "typeOuverture" geostandard.enum4,
    "barreAppui" geostandard.enum5,
    "hauteurBarreAppui" real,
    "etatRevetement" character(20),
    supervision boolean,
    "autrePorteSortie" character(20),
    geom geostandard.geometry(Point,4326) NOT NULL
);




--
-- TOC entry 224 (class 1259 OID 99477)
-- Name: ERP; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard."ERP" (
    "idERP" integer NOT NULL,
    nom text,
    adresse text,
    "codePostal" character(20),
    "erpCategorie" geostandard.enum5,
    "dataMiseAJour" date,
    "sourceMiseAJour" text,
    "stationnementERP" boolean DEFAULT false,
    "stationnementPMR" integer DEFAULT 0,
    "accueilPersonnel" geostandard.enum3,
    "accueilBIM" boolean,
    "accueilBIMPortative" boolean,
    "accueilSF" boolean,
    "accueilST" boolean,
    "accueilAideAudition" boolean,
    "accueilPrestations" text,
    "sanitaireERP" boolean DEFAULT false,
    "sanitairesAdaptes" integer DEFAULT 0,
    telephone character(20),
    "siteWeb" character varying(255),
    "SIRET" character(20),
    latitude real,
    longitude real,
    "erpActivite" character(20),
    geom geostandard.geometry(MultiPolygon,4326) NOT NULL,
    erptype geostandard.listtypeerp
);




--
-- TOC entry 221 (class 1259 OID 99452)
-- Name: Entree; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard."Entree" (
    "idEntree" integer NOT NULL,
    adresse text,
    type geostandard.enum3,
    rampe geostandard.enum3,
    "rampeSonnette" boolean DEFAULT false,
    ascenseur boolean DEFAULT false,
    "escalierNbMarche" integer DEFAULT 0,
    "escalierMainCourante" boolean DEFAULT false,
    reperabilite boolean,
    "reperageEltsVitres" boolean,
    signaletique boolean,
    "largeurPassage" real,
    "controleAcces" geostandard.enum5,
    "entreeAccueilVisible" boolean,
    eclairage integer,
    "typePorte" geostandard.enum7,
    "typeOuverture" geostandard.enum4,
    "espaceManoeuvre" geostandard.enum4,
    "largManoeuvreExt" real,
    "longManoeuvreExt" real,
    "largManoeuvreInt" real,
    "longManoeuvreInt" real,
    "typePoignee" geostandard.enum7,
    "effortOuverture" integer,
    geom geostandard.geometry(Point,4326) NOT NULL
);




--
-- TOC entry 210 (class 1259 OID 99372)
-- Name: Noeud; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard."Noeud" (
    "idNoeud" bigint NOT NULL,
    altitude real,
    "bandeEveilVigilance" geostandard.enum5,
    "hauteurRessault" real,
    "abaissePente" integer,
    "controleBEV" geostandard.enum7,
    "bandeInterception" boolean,
    geom geostandard.geometry(Point,4326) NOT NULL
);




--
-- TOC entry 211 (class 1259 OID 99380)
-- Name: Obstacle; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard."Obstacle" (
    "idObstacle" bigint NOT NULL,
    "typeObstacle" geostandard.enum98,
    "largeurPassageUtile" real,
    "positionObstacle" geostandard.enum3,
    "longueurObstacle" real,
    "rappelObstacle" geostandard.enum3,
    "reperabiliteVisuelle" boolean,
    "largeurObstacle" real,
    "hauteurObsPoseSol" real,
    "hauteurSousObs" real,
    geom geostandard.geometry(Point,4326) NOT NULL,
    idtroncon bigint
);


--
-- TOC entry 209 (class 1259 OID 99367)
-- Name: cheminement; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard.cheminement (
    "idCheminement" integer NOT NULL,
    nom character varying(255),
    geom geostandard.geometry(LineString,4326) NOT NULL
);




--
-- TOC entry 225 (class 1259 OID 99485)
-- Name: cheminementERP; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard."cheminementERP" (
    "idChemERP" integer NOT NULL,
    "departChemStat" boolean,
    "arriveeChemAcc" boolean,
    "typeSol" geostandard.charenum,
    "largeurMini" real,
    "hauteurRessault" real DEFAULT 0,
    rampe geostandard.enum3,
    "rampeSonnette" boolean DEFAULT false,
    ascenceur boolean DEFAULT false,
    "escalierNbMarche" integer DEFAULT 0,
    "escalierMainCourante" boolean DEFAULT false,
    "escalierDescendant" integer,
    "penteCourte" real,
    "penteMoyenne" real,
    "penteLongue" real,
    devers integer,
    "reperageEltsVitres" boolean,
    "sysGuidVisuel" boolean,
    "sysGuidTactile" boolean,
    "sysGuidSonore" boolean,
    exterieur boolean,
    geom geostandard.geometry(LineString,4326) NOT NULL
);




--
-- TOC entry 226 (class 1259 OID 99511)
-- Name: cheminement_tronconCheminement; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard."cheminement_tronconCheminement" (
    id integer NOT NULL
);




--
-- TOC entry 213 (class 1259 OID 99397)
-- Name: circulation; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard.circulation (
    "idCirculation" integer NOT NULL,
    "typeSol" geostandard.charenum,
    "largeurPassageUtile" real,
    "etatRevetement" geostandard.enum5,
    eclairage geostandard.enum3,
    transition geostandard.enum4,
    "typePassage" geostandard.enum5,
    "repereLineaire" geostandard.enum6,
    couvert geostandard.enum3,
    geom geostandard.geometry(LineString,4326) NOT NULL
);




--
-- TOC entry 220 (class 1259 OID 99447)
-- Name: elevateur; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard.elevateur (
    "idElevateur" integer NOT NULL,
    "largeurUtile" real,
    "touchesEnRelief" character(20),
    "typeOuverture" geostandard.enum4,
    "largeurPlateforme" real,
    "longueurPlateforme" real,
    "utilisableAutonomie" boolean,
    "chargeMax" integer,
    accompagnateur geostandard.enum3,
    "etatRevetement" character(20),
    supervision boolean,
    "autrePorteSortie" geostandard.enum5,
    geom geostandard.geometry(Point,4326) NOT NULL
);




--
-- TOC entry 229 (class 1259 OID 99608)
-- Name: entree_ERP; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard."entree_ERP" (
    id integer NOT NULL
);




--
-- TOC entry 228 (class 1259 OID 99606)
-- Name: entree_ERP_id_seq; Type: SEQUENCE; Schema: geostandard; 
--

CREATE SEQUENCE geostandard."entree_ERP_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- TOC entry 4098 (class 0 OID 0)
-- Dependencies: 228
-- Name: entree_ERP_id_seq; Type: SEQUENCE OWNED BY; Schema: geostandard; 
--

ALTER SEQUENCE geostandard."entree_ERP_id_seq" OWNED BY geostandard."entree_ERP".id;


--
-- TOC entry 230 (class 1259 OID 99624)
-- Name: entree_cheminementERP; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard."entree_cheminementERP" (
    id integer NOT NULL
);




--
-- TOC entry 216 (class 1259 OID 99418)
-- Name: escalator; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard.escalator (
    "idEscalator" integer NOT NULL,
    sens geostandard.enum4,
    "dispositifVigilance" geostandard.enum5,
    "largeurUtile" real,
    detecteur boolean,
    surpervision boolean,
    geom geostandard.geometry(LineString,4326) NOT NULL
);




--
-- TOC entry 215 (class 1259 OID 99410)
-- Name: escalier; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard.escalier (
    "idEscalier" integer NOT NULL,
    "etatRevetement" geostandard.enum5,
    "mainCourante" character(20),
    "dispositifVigilance" character(20),
    "dispositifMarche" character(20),
    "largeurUtile" real,
    "mainCouranteContinue" geostandard.enum5,
    "prlongMainCourante" character(20),
    "nbMarches" integer,
    "nbVoleeMarches" integer,
    "hauteurMarche" real,
    giron real,
    geom geostandard.geometry(LineString,4326) NOT NULL
);




--
-- TOC entry 227 (class 1259 OID 99586)
-- Name: noeud_StationnementPMR; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard."noeud_StationnementPMR" (
    id integer NOT NULL
);




--
-- TOC entry 222 (class 1259 OID 99460)
-- Name: passageSelectif; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard."passageSelectif" (
    "idPassageSelectif" integer NOT NULL,
    "passageMecanique" boolean,
    "largeurUtile" real,
    profondeur real,
    "contrasteVisuel" boolean,
    geom geostandard.geometry(Point,4326) NOT NULL
);




--
-- TOC entry 218 (class 1259 OID 99434)
-- Name: quai; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard.quai (
    "idQuai" integer NOT NULL,
    "etatRevetement" geostandard.enum5,
    hauteur real,
    "largeurPassage" real,
    "signalisationPorte" geostandard.enum8,
    "dispositifVigilance" character(20),
    "diamZoneManoeuvre" real,
    geom geostandard.geometry(LineString,4326) NOT NULL
);




--
-- TOC entry 214 (class 1259 OID 99402)
-- Name: rampeAcces; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard."rampeAcces" (
    "idRampe" integer NOT NULL,
    "etatRevetement" geostandard.enum5,
    "largeurUtile" real,
    "mainCourante" geostandard.enum5,
    "distPalierRepos" real,
    "chasseRoue" character(20),
    "aireRotation" geostandard.enum4,
    "poidsSupporte" integer,
    geom geostandard.geometry(LineString,4326) NOT NULL
);




--
-- TOC entry 223 (class 1259 OID 99469)
-- Name: stationnementPMR; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard."stationnementPMR" (
    "idStationnement" integer NOT NULL,
    "typeStationnement" geostandard.enum3,
    "etatRevetement" geostandard.enum5,
    "largeurStat" real,
    "longueurStat" real,
    "bandLatSecurite" boolean,
    "surLongueur" real,
    "signalPMR" boolean,
    "marquageSol" boolean,
    pente integer,
    devers integer,
    "typeSol" character(20),
    geom geostandard.geometry(Point,4326) NOT NULL
);




--
-- TOC entry 217 (class 1259 OID 99426)
-- Name: tapisRoulant; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard."tapisRoulant" (
    "idTapis" integer NOT NULL,
    sens geostandard.enum3,
    "dispositifVigilance" character(20),
    "largeurUtile" real,
    detecteur boolean,
    geom geostandard.geometry(LineString,4326) NOT NULL
);




--
-- TOC entry 208 (class 1259 OID 91118)
-- Name: traversee; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard.traversee (
    etatrevetement character varying,
    marquagesol character varying,
    eclairage geostandard.enum3,
    feulumineux boolean,
    feusonore character varying,
    reperelineaire geostandard.enum6,
    presenceilot boolean,
    chausseebombee boolean,
    covisibilite geostandard.enum6,
    idtraversee integer NOT NULL,
    geom geostandard.geometry(LineString,2154) NOT NULL
);




--
-- TOC entry 212 (class 1259 OID 99388)
-- Name: tronconCheminement; Type: TABLE; Schema: geostandard; 
--

CREATE TABLE geostandard."tronconCheminement" (
    "idTroncon" bigint NOT NULL,
    "from" bigint,
    "to" bigint,
    distance integer,
    "typeTroncon" geostandard.listtypetroncon,
    "statutVoie" geostandard.enum6,
    pente integer,
    devers integer,
    "accessibiliteGlobale" geostandard.enum3,
    geom geostandard.geometry(LineString,4326) NOT NULL
);





--
-- TOC entry 3860 (class 2604 OID 99611)
-- Name: entree_ERP id; Type: DEFAULT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."entree_ERP" ALTER COLUMN id SET DEFAULT nextval('geostandard."entree_ERP_id_seq"'::regclass);


--
-- TOC entry 3889 (class 2606 OID 99446)
-- Name: Ascenceur Ascenceur_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."Ascenceur"
    ADD CONSTRAINT "Ascenceur_pkey" PRIMARY KEY ("idAscenseur");


--
-- TOC entry 3899 (class 2606 OID 99484)
-- Name: ERP ERP_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."ERP"
    ADD CONSTRAINT "ERP_pkey" PRIMARY KEY ("idERP");


--
-- TOC entry 3893 (class 2606 OID 99459)
-- Name: Entree Entree_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."Entree"
    ADD CONSTRAINT "Entree_pkey" PRIMARY KEY ("idEntree");


--
-- TOC entry 3870 (class 2606 OID 100762)
-- Name: Noeud Noeud_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."Noeud"
    ADD CONSTRAINT "Noeud_pkey" PRIMARY KEY ("idNoeud");


--
-- TOC entry 3872 (class 2606 OID 100991)
-- Name: Obstacle Obstacle_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."Obstacle"
    ADD CONSTRAINT "Obstacle_pkey" PRIMARY KEY ("idObstacle");

--
-- TOC entry 3901 (class 2606 OID 99489)
-- Name: cheminementERP cheminementERP_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."cheminementERP"
    ADD CONSTRAINT "cheminementERP_pkey" PRIMARY KEY ("idChemERP");


--
-- TOC entry 3868 (class 2606 OID 99371)
-- Name: cheminement cheminement_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard.cheminement
    ADD CONSTRAINT cheminement_pkey PRIMARY KEY ("idCheminement");


--
-- TOC entry 3903 (class 2606 OID 99515)
-- Name: cheminement_tronconCheminement cheminement_tronconCheminement_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."cheminement_tronconCheminement"
    ADD CONSTRAINT "cheminement_tronconCheminement_pkey" PRIMARY KEY (id);


--
-- TOC entry 3877 (class 2606 OID 99401)
-- Name: circulation circulation_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard.circulation
    ADD CONSTRAINT circulation_pkey PRIMARY KEY ("idCirculation");


--
-- TOC entry 3891 (class 2606 OID 99451)
-- Name: elevateur elevateur_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard.elevateur
    ADD CONSTRAINT elevateur_pkey PRIMARY KEY ("idElevateur");


--
-- TOC entry 3907 (class 2606 OID 99613)
-- Name: entree_ERP entree_ERP_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."entree_ERP"
    ADD CONSTRAINT "entree_ERP_pkey" PRIMARY KEY (id);


--
-- TOC entry 3909 (class 2606 OID 99628)
-- Name: entree_cheminementERP entree_cheminementERP_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."entree_cheminementERP"
    ADD CONSTRAINT "entree_cheminementERP_pkey" PRIMARY KEY (id);


--
-- TOC entry 3883 (class 2606 OID 99422)
-- Name: escalator escalator_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard.escalator
    ADD CONSTRAINT escalator_pkey PRIMARY KEY ("idEscalator");


--
-- TOC entry 3881 (class 2606 OID 99414)
-- Name: escalier escalier_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard.escalier
    ADD CONSTRAINT escalier_pkey PRIMARY KEY ("idEscalier");


--
-- TOC entry 3905 (class 2606 OID 99590)
-- Name: noeud_StationnementPMR noeud_StationnementPMR_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."noeud_StationnementPMR"
    ADD CONSTRAINT "noeud_StationnementPMR_pkey" PRIMARY KEY (id);


--
-- TOC entry 3895 (class 2606 OID 99464)
-- Name: passageSelectif passageSelectif_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."passageSelectif"
    ADD CONSTRAINT "passageSelectif_pkey" PRIMARY KEY ("idPassageSelectif");


--
-- TOC entry 3887 (class 2606 OID 99438)
-- Name: quai quai_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard.quai
    ADD CONSTRAINT quai_pkey PRIMARY KEY ("idQuai");


--
-- TOC entry 3879 (class 2606 OID 99406)
-- Name: rampeAcces rampeAcces_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."rampeAcces"
    ADD CONSTRAINT "rampeAcces_pkey" PRIMARY KEY ("idRampe");


--
-- TOC entry 3897 (class 2606 OID 99473)
-- Name: stationnementPMR stationnementPMR_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."stationnementPMR"
    ADD CONSTRAINT "stationnementPMR_pkey" PRIMARY KEY ("idStationnement");


--
-- TOC entry 3885 (class 2606 OID 99430)
-- Name: tapisRoulant tapisRoulant_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."tapisRoulant"
    ADD CONSTRAINT "tapisRoulant_pkey" PRIMARY KEY ("idTapis");


--
-- TOC entry 3866 (class 2606 OID 91125)
-- Name: traversee traversee_pk; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard.traversee
    ADD CONSTRAINT traversee_pk PRIMARY KEY (idtraversee);


--
-- TOC entry 3875 (class 2606 OID 100915)
-- Name: tronconCheminement tronconCheminement_pkey; Type: CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."tronconCheminement"
    ADD CONSTRAINT "tronconCheminement_pkey" PRIMARY KEY ("idTroncon");


--
-- TOC entry 3873 (class 1259 OID 99659)
-- Name: sidx_tronconCheminement_geom; Type: INDEX; Schema: geostandard; 
--

CREATE INDEX "sidx_tronconCheminement_geom" ON geostandard."tronconCheminement" USING gist (geom);


--
-- TOC entry 3924 (class 2606 OID 99516)
-- Name: cheminement_tronconCheminement cheminement_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."cheminement_tronconCheminement"
    ADD CONSTRAINT cheminement_fk FOREIGN KEY (id) REFERENCES geostandard.cheminement("idCheminement");


--
-- TOC entry 3931 (class 2606 OID 99634)
-- Name: entree_cheminementERP cheminementerp_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."entree_cheminementERP"
    ADD CONSTRAINT cheminementerp_fk FOREIGN KEY (id) REFERENCES geostandard."cheminementERP"("idChemERP");


--
-- TOC entry 3928 (class 2606 OID 99614)
-- Name: entree_ERP entree_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."entree_ERP"
    ADD CONSTRAINT entree_fk FOREIGN KEY (id) REFERENCES geostandard."Entree"("idEntree");


--
-- TOC entry 3930 (class 2606 OID 99629)
-- Name: entree_cheminementERP entree_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."entree_cheminementERP"
    ADD CONSTRAINT entree_fk FOREIGN KEY (id) REFERENCES geostandard."Entree"("idEntree");


--
-- TOC entry 3923 (class 2606 OID 99601)
-- Name: cheminementERP erp_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."cheminementERP"
    ADD CONSTRAINT erp_fk FOREIGN KEY ("idChemERP") REFERENCES geostandard."ERP"("idERP");


--
-- TOC entry 3929 (class 2606 OID 99619)
-- Name: entree_ERP erp_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."entree_ERP"
    ADD CONSTRAINT erp_fk FOREIGN KEY (id) REFERENCES geostandard."ERP"("idERP");


--
-- TOC entry 3920 (class 2606 OID 100931)
-- Name: escalator escalator_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard.escalator
    ADD CONSTRAINT escalator_fk FOREIGN KEY ("idEscalator") REFERENCES geostandard."tronconCheminement"("idTroncon");


--
-- TOC entry 3919 (class 2606 OID 100936)
-- Name: escalier escalier_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard.escalier
    ADD CONSTRAINT escalier_fk FOREIGN KEY ("idEscalier") REFERENCES geostandard."tronconCheminement"("idTroncon");


--
-- TOC entry 3915 (class 2606 OID 100964)
-- Name: tronconCheminement from_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."tronconCheminement"
    ADD CONSTRAINT from_fk FOREIGN KEY ("from") REFERENCES geostandard."Noeud"("idNoeud");


--
-- TOC entry 3927 (class 2606 OID 100773)
-- Name: noeud_StationnementPMR noeud_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."noeud_StationnementPMR"
    ADD CONSTRAINT noeud_fk FOREIGN KEY (id) REFERENCES geostandard."Noeud"("idNoeud");


--
-- TOC entry 3914 (class 2606 OID 101497)
-- Name: Obstacle obstacle_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."Obstacle"
    ADD CONSTRAINT obstacle_fk FOREIGN KEY (idtroncon) REFERENCES geostandard."tronconCheminement"("idTroncon");


--
-- TOC entry 3922 (class 2606 OID 100941)
-- Name: quai quai_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard.quai
    ADD CONSTRAINT quai_fk FOREIGN KEY ("idQuai") REFERENCES geostandard."tronconCheminement"("idTroncon");


--
-- TOC entry 3918 (class 2606 OID 100946)
-- Name: rampeAcces rampeacces_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."rampeAcces"
    ADD CONSTRAINT rampeacces_fk FOREIGN KEY ("idRampe") REFERENCES geostandard."tronconCheminement"("idTroncon");


--
-- TOC entry 3926 (class 2606 OID 99596)
-- Name: noeud_StationnementPMR stationnementpmr_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."noeud_StationnementPMR"
    ADD CONSTRAINT stationnementpmr_fk FOREIGN KEY (id) REFERENCES geostandard."stationnementPMR"("idStationnement");


--
-- TOC entry 3921 (class 2606 OID 100951)
-- Name: tapisRoulant tapisroulant_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."tapisRoulant"
    ADD CONSTRAINT tapisroulant_fk FOREIGN KEY ("idTapis") REFERENCES geostandard."tronconCheminement"("idTroncon");


--
-- TOC entry 3916 (class 2606 OID 100977)
-- Name: tronconCheminement to_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."tronconCheminement"
    ADD CONSTRAINT to_fk FOREIGN KEY ("to") REFERENCES geostandard."Noeud"("idNoeud");


--
-- TOC entry 3925 (class 2606 OID 100916)
-- Name: cheminement_tronconCheminement tronconcheminement_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard."cheminement_tronconCheminement"
    ADD CONSTRAINT tronconcheminement_fk FOREIGN KEY (id) REFERENCES geostandard."tronconCheminement"("idTroncon");


--
-- TOC entry 3917 (class 2606 OID 100926)
-- Name: circulation tronconcheminement_fk; Type: FK CONSTRAINT; Schema: geostandard; 
--

ALTER TABLE ONLY geostandard.circulation
    ADD CONSTRAINT tronconcheminement_fk FOREIGN KEY ("idCirculation") REFERENCES geostandard."tronconCheminement"("idTroncon");


--
-- PostgreSQL database dump complete
--

