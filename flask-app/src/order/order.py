from flask import Blueprint, request, jsonify, make_response
import json
from src import db


order = Blueprint('order', __name__)

# Get all orders from the DB
@order.route('/order', methods=['GET'])
def get_orders():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT size, type, milk, topping, cst_name FROM Drnk_Ord JOIN Drink USING (drink_id) JOIN Orders USING (order_id) JOIN Toppings USING (order_id) JOIN Customer USING (user_id)')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
