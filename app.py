# app.py

from flask import Flask, render_template
from models import CountryModel, WorldModel, init_db, db
from flask_migrate import Migrate
from forms import FilterForm

from flask_wtf import FlaskForm
from wtforms import SelectField, SubmitField
from flask import request


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///C:/sqlite/b3_flask/CarbonFootprint.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config["SECRET_KEY"] = "thisisasecret!"

init_db(app)
#db = SQLAlchemy(app)
migrate = Migrate(app, db)

co2_emissions = {
    'coal': 820,
    'gas': 490,
    'oil': 740,
    'hydro': 24,
    'renewable': 41,
    'nuclear': 12
}

@app.route('/', methods=['GET','POST'])
def index():
    try:
        
        sql_query = db.session.query(CountryModel).limit(5)
        sql_query_coal = db.session.query(CountryModel.Country, CountryModel.Coal).filter(CountryModel.Coal.is_not(None)).order_by(CountryModel.Coal.desc()).limit(1)
        sql_query_gas = db.session.query(CountryModel.Country, CountryModel.Gas).filter(CountryModel.Gas.is_not(None)).order_by(CountryModel.Gas.desc()).limit(1)
        sql_query_oil = db.session.query(CountryModel.Country, CountryModel.Oil).filter(CountryModel.Oil.is_not(None)).order_by(CountryModel.Oil.desc()).limit(1)
        sql_query_hydro = db.session.query(CountryModel.Country, CountryModel.Hydro).order_by(CountryModel.Hydro.desc()).limit(1)
        sql_query_renewable = db.session.query(CountryModel.Country, CountryModel.Renewable).order_by(CountryModel.Renewable.desc()).limit(1)
        sql_query_nuclear = db.session.query(CountryModel.Country, CountryModel.Nuclear).order_by(CountryModel.Nuclear.desc()).limit(1)

        results = sql_query.all()
        results_coal = sql_query_coal.all()
        results_gas = sql_query_gas.all()
        results_oil = sql_query_oil.all()
        results_hydro = sql_query_hydro.all()
        results_renewable = sql_query_renewable.all()
        results_nuclear = sql_query_nuclear.all()

        query_results = [dict(result.__dict__) for result in results]
        query_results_coal = [{'Country': result.Country, 'Coal': result.Coal} for result in results_coal]
        query_results_gas = [{'Country': result.Country, 'Gas': result.Gas} for result in results_gas]
        query_results_oil = [{'Country': result.Country, 'Oil': result.Oil} for result in results_oil]
        query_results_hydro = [{'Country': result.Country, 'Hydro': result.Hydro} for result in results_hydro]
        query_results_renewable = [{'Country': result.Country, 'Renewable': result.Renewable} for result in results_renewable]
        query_results_nuclear = [{'Country': result.Country, 'Nuclear': result.Nuclear} for result in results_nuclear]
        
        
        form = FilterForm()
        form.country_table1.choices = CountryModel.get_countries()
        query_results_table1 = []

        selected_country_table1 = form.country_table1.data

        if request.method == 'POST':
            power_consumption = float(request.form.get('power_consumption'))
            
            country_model_result = CountryModel.query.filter_by(Country=selected_country_table1).first()

            if country_model_result and isinstance(country_model_result, CountryModel):
                query_results_table1 = country_model_result.calculate_contribution()
                total_emission_kgCO2_kWh = query_results_table1.get('Emission', 0)
                hours_in_a_year = 24 * 365
                total_annual_emission = total_emission_kgCO2_kWh * hours_in_a_year * power_consumption
                trees_needed = total_annual_emission / 25  
                form.trees_needed.data = round(trees_needed, 2)
                return render_template('index.html', form=form, query_results=query_results, query_results_coal=query_results_coal, query_results_gas=query_results_gas,
                                       query_results_oil=query_results_oil, query_results_hydro=query_results_hydro,
                                       query_results_renewable=query_results_renewable, query_results_nuclear=query_results_nuclear,
                                       query_results_table1=query_results_table1, selected_country=selected_country_table1,
                                       total_annual_emission=total_annual_emission, trees_needed=form.trees_needed.data)

        return render_template('index.html', form=form, query_results=query_results, query_results_coal=query_results_coal, query_results_gas=query_results_gas,
                               query_results_oil=query_results_oil, query_results_hydro=query_results_hydro,
                               query_results_renewable=query_results_renewable, query_results_nuclear=query_results_nuclear,
                               query_results_table1=query_results_table1)

    except Exception as e:
        return f"Une erreur s'est produite : {str(e)}"

    
@app.route('/top_energy_regions', methods=['GET','POST'])
def top_energy_regions():
    try:
        sql_query = db.session.query(WorldModel).limit(5)
        sql_query_coal = db.session.query(WorldModel.Country, WorldModel.Coal).filter(WorldModel.Coal.isnot(None)).order_by(WorldModel.Coal.desc()).limit(1)
        sql_query_gas = db.session.query(WorldModel.Country, WorldModel.Gas).filter(WorldModel.Gas.isnot(None)).order_by(WorldModel.Gas.desc()).limit(1)
        sql_query_oil = db.session.query(WorldModel.Country, WorldModel.Oil).filter(WorldModel.Oil.isnot(None)).order_by(WorldModel.Oil.desc()).limit(1)
        sql_query_hydro = db.session.query(WorldModel.Country, WorldModel.Hydro).order_by(WorldModel.Hydro.desc()).limit(1)
        sql_query_renewable = db.session.query(WorldModel.Country, WorldModel.Renewable).order_by(WorldModel.Renewable.desc()).limit(1)
        sql_query_nuclear = db.session.query(WorldModel.Country, WorldModel.Nuclear).order_by(WorldModel.Nuclear.desc()).limit(1)
        
        results = sql_query.all()
        results_coal = sql_query_coal.all()
        results_gas = sql_query_gas.all()
        results_oil = sql_query_oil.all()
        results_hydro = sql_query_hydro.all()
        results_renewable = sql_query_renewable.all()
        results_nuclear = sql_query_nuclear.all()

        query_results = [dict(result.__dict__) for result in results]
        query_results_coal = [{'Country': result.Country, 'Coal': result.Coal} for result in results_coal]
        query_results_gas = [{'Country': result.Country, 'Gas': result.Gas} for result in results_gas]
        query_results_oil = [{'Country': result.Country, 'Oil': result.Oil} for result in results_oil]
        query_results_hydro = [{'Country': result.Country, 'Hydro': result.Hydro} for result in results_hydro]
        query_results_renewable = [{'Country': result.Country, 'Renewable': result.Renewable} for result in results_renewable]
        query_results_nuclear = [{'Country': result.Country, 'Nuclear': result.Nuclear} for result in results_nuclear]
        
        form = FilterForm()
        form.country_table2.choices = WorldModel.get_countries()
        query_results_table2 = []

        selected_country_table2 = form.country_table2.data

        if request.method == 'POST':
            power_consumption = float(request.form.get('power_consumption'))
            
            world_model_result = WorldModel.query.filter_by(Country=selected_country_table2).first()

            if world_model_result and isinstance(world_model_result, WorldModel):
                query_results_table2 = world_model_result.calculate_contribution()
                total_emission_kgCO2_kWh = query_results_table2.get('Emission', 0)
                hours_in_a_year = 24 * 365
                total_annual_emission = total_emission_kgCO2_kWh * hours_in_a_year * power_consumption
                trees_needed = total_annual_emission / 25  
                form.trees_needed.data = round(trees_needed, 2)
                return render_template('top_energy_regions.html', form=form, query_results=query_results, query_results_coal=query_results_coal, query_results_gas=query_results_gas,
                                       query_results_oil=query_results_oil, query_results_hydro=query_results_hydro,
                                       query_results_renewable=query_results_renewable, query_results_nuclear=query_results_nuclear,
                                       query_results_table2=query_results_table2, selected_country=selected_country_table2,
                                       total_annual_emission=total_annual_emission, trees_needed=form.trees_needed.data)

        return render_template('top_energy_regions.html', form=form, query_results=query_results, query_results_coal=query_results_coal, query_results_gas=query_results_gas,
                               query_results_oil=query_results_oil, query_results_hydro=query_results_hydro,
                               query_results_renewable=query_results_renewable, query_results_nuclear=query_results_nuclear,
                               query_results_table2=query_results_table2)

    except Exception as e:
        return f"Une erreur s'est produite : {str(e)}"


if __name__ == '__main__':
    app.run(debug=True)
    
