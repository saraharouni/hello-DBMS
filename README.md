##
# **Projet Carbon Footprint Analyzer**

Ce projet vise à fournir une analyse des émissions de carbone liées à la production d'électricité dans différents pays, ainsi que des statistiques mondiales sur les sources d'énergie.

## **Configuration requise**

- Python 3.x
- Flask
- Flask-Migrate
- Flask-WTF
- SQLAlchemy

## **Installation**

- Clonez le référentiel sur votre machine locale.

```bash

git clone https://github.com/saraharouni/CarbonFootprintAnalyzer.git
```

- Accédez au répertoire du projet.

```bash

cd CarbonFootprintAnalyzer
```

- Installez les dépendances.

```bash

pip install -r requirements.txt
```

## **Configuration de la base de données**

- Ouvrez le fichier app.py.
- Modifiez le chemin d'accès à la base de données par votre chemin en local.

``` python

app.config['SQLALCHEMY\_DATABASE\_URI'] = 'sqlite:///C:/sqlite/b3\_flask/CarbonFootprint.db'

app.config['SQLALCHEMY\_TRACK\_MODIFICATIONS'] = False
```

- Initialisez la base de données.

``` bash

python app.py db init

python app.py db migrate

python app.py db upgrade
```

## **Utilisation**

- Exécutez l'application.

``` bash

python app.py
```

- Ouvrez votre navigateur et accédez à http://127.0.0.1:5000/.
- Explorez les statistiques sur les émissions de carbone par pays et les principales régions énergétiques.

## **Fonctionnalités**

- Page d'accueil (/) : Affiche les cinq principaux pays en termes d'émissions de carbone, avec des filtres pour afficher les détails par pays.
- Top des régions énergétiques (/top\_energy\_regions) : Présente les cinq principales régions énergétiques mondiales avec des détails sur les différentes sources d'énergie.


