##
# **Projet Carbon Footprint **

Ce projet consiste à créer une base de données SQL et une application Flask afin de pouvoir observer les émissions de carbone produites par chaque pays ou région en fonction des types d'énergies utilisés pour créer de l'électricité.

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

- **Page d'accueil (/) :** Cette page présente le projet de l'application : un calculateur d'empreinte carbone qui permet d'obtenir des informations sur l'utilisation des différentes sources d'énergie dans le monde.
Elle contient un formulaire qui permet à l'utilisateur de sélectionner un pays, d'entrer sa consommation électrique et d'afficher les émissions annuelles de CO2 et le nombre d'arbres nécessaires pour compenser ces émissions.
Puis un aperçu de la table qui a servi à réaliser ce projet, une section mettant en avant les 'top pays' classé par type d'énergie, et enfin, un lien vers une autre page pour filtrer les résultats par région.

- **Top des régions énergétiques (/top\_energy\_regions) :** Cette page et semblable à la page d'accueil mais affiche des informations à l'échelle régionale.


