from flask_wtf import FlaskForm
from wtforms import SelectField, SubmitField,FloatField

class FilterForm(FlaskForm):
    country_table1 = SelectField( choices=[], coerce=str)
    unit_table1 = SelectField('kw',coerce=float)
    submit = SubmitField('Filter')
    trees_needed = FloatField('Nombre d\'arbres nécessaires', render_kw={'readonly': True})
    country_table2 = SelectField( choices=[], coerce=str)
    unit_table2 = SelectField('kw',coerce=float)
    submit2 = SubmitField('Filter')
    