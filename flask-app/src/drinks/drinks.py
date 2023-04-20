from flask import Blueprint, request, jsonify, make_response
import json
from src import db


drinks = Blueprint('drinks', __name__)

# Get all the products from the database
@drinks.route('/drinks', methods=['GET'])
def get_drinks():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT * from Drink')

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# Get information for specified drink
@drinks.route('/drinks/<drinkID>', methods = ['GET'])
def get_drinkID(drinkID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Drink where drink_id = {0}'.format(drinkID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response