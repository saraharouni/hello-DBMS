from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

co2_emissions = {
    'coal': 820,
    'gas': 490,
    'oil': 740,
    'hydro': 24,
    'renewable': 41,
    'nuclear': 12
}

class CountryModel(db.Model):
    __tablename__ = 'Country'

    Country = db.Column(db.String(255), primary_key=True, nullable=False)
    Coal = db.Column(db.Float)
    Gas = db.Column(db.Float)
    Oil = db.Column(db.Float)
    Hydro = db.Column(db.Float)
    Renewable = db.Column(db.Float)
    Nuclear = db.Column(db.Float)
   
    @classmethod
    def get_countries(cls):
        return [(country.Country, country.Country) for country in cls.query.all()]
    
    def calculate_contribution(self):
        total_emission = 0.01*(
            self.Coal * co2_emissions['coal'] +
            self.Gas * co2_emissions['gas'] +
            self.Oil * co2_emissions['oil'] +
            self.Hydro * co2_emissions['hydro'] +
            self.Renewable * co2_emissions['renewable'] +
            self.Nuclear * co2_emissions['nuclear']
        )
        
        if total_emission == 0:
            return {
                'coal': 0,
                'gas': 0,
                'oil': 0,
                'hydro': 0,
                'renewable': 0,
                'nuclear': 0
            }
        
        return {
           'coal': round((self.Coal * co2_emissions['coal']) /  100, 2),
           'gaz': round((self.Gas * co2_emissions['gas']) / 100, 2),
           'oil': round((self.Oil * co2_emissions['oil']) /  100, 2),
           'hydro': round((self.Hydro * co2_emissions['hydro']) / 100, 2),
           'renewable': round((self.Renewable * co2_emissions['renewable']) /  100, 2),
           'nuclear': round((self.Nuclear * co2_emissions['nuclear']) /  100, 2),
           'Emission': round(total_emission,2)
           }
    
   
class WorldModel(db.Model):
    __tablename__ = 'World'

    Country = db.Column(db.String(255), primary_key=True, nullable=False)
    Coal = db.Column(db.Float)
    Gas = db.Column(db.Float)
    Oil = db.Column(db.Float)
    Hydro = db.Column(db.Float)
    Renewable = db.Column(db.Float)
    Nuclear = db.Column(db.Float)

    @classmethod
    def get_countries(cls):
        return [(country.Country, country.Country) for country in cls.query.all()]
    
    def calculate_contribution(self):
        total_emission = 0.01*(
            self.Coal * co2_emissions['coal'] +
            self.Gas * co2_emissions['gas'] +
            self.Oil * co2_emissions['oil'] +
            self.Hydro * co2_emissions['hydro'] +
            self.Renewable * co2_emissions['renewable'] +
            self.Nuclear * co2_emissions['nuclear']
        )
        
        if total_emission == 0:
            return {
                'coal': 0,
                'gas': 0,
                'oil': 0,
                'hydro': 0,
                'renewable': 0,
                'nuclear': 0
            }
        
        return {
           'coal': round((self.Coal * co2_emissions['coal']) /  100, 2),
           'gaz': round((self.Gas * co2_emissions['gas']) / 100, 2),
           'oil': round((self.Oil * co2_emissions['oil']) /  100, 2),
           'hydro': round((self.Hydro * co2_emissions['hydro']) / 100, 2),
           'renewable': round((self.Renewable * co2_emissions['renewable']) /  100, 2),
           'nuclear': round((self.Nuclear * co2_emissions['nuclear']) /  100, 2),
           'Emission': round(total_emission,2)
           }
        

def init_db(app):
    with app.app_context():
        db.init_app(app)
        db.create_all()