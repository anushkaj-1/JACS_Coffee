from flask import Blueprint, request, jsonify, make_response
import json
from src import db


employees = Blueprint('employees', __name__)

# Get all employees from the DB
@employees.route('/employees', methods=['GET'])
def get_employees():
    cursor = db.get_db().cursor()
    cursor.execute('select first_name, last_name, employee_id from Employee')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get detailed information for one emplyee
@employees.route('/employees/<employeeID>', methods=['GET'])
def get_employee(employeeID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Employee where employee_id = {0}'.format(employeeID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get all orders from the DB given method
@employees.route('/pendingOrders/<method>')
def get_order(method):
    cursor = db.get_db().cursor()
    query ='select * from Orders where order_method =  "'
    query += method
    query += '"' 
    cursor.execute(query)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#get all orders with name, size, milk, topping, and drink type (method doesn't matter)
@employees.route('/allOrders', methods = ['GET'])
def get_orders():
    cursor = db.get_db().cursor()
    query = '''
        SELECT size, type, milk, topping, cst_name 
        FROM Drnk_Ord JOIN Drink USING (drink_id) JOIN 
        Orders USING (order_id) JOIN Toppings USING (order_id) 
        JOIN Customer USING (user_id)
    '''
    cursor.execute(query)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Update Employee Information
@employees.route('/employees/<employeeID>', methods=['PUT'])
def update_employee_info(employeeID):
    # access json data from reqeuest body
    # current_app.logger.info('Processing form data')
    req_data = request.get_json()
    # current_app.logger.info(req_data)

    firstname = req_data['first_name']
    lastname = req_data['last_name']

    # constuct statement

    query = 'UPDATE Employee Set first_name = "{0}", last_name = "{1}" where employee_id = {2}'.format(firstname, lastname, employeeID)

    #execute query
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    return "Success"

#delete an order
@employees.route('/orders/<orderID>', methods=['DELETE'])
def delete_order(orderID):
    # constuct statement

    query = 'DELETE from Orders WHERE order_id = {0}'.format(orderID)

    #execute query
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    return "Success"

#add new employee
@employees.route('/add employee', methods = ['POST'])
def addemployee(firstname, lastname):
    cursor = db.get_db().cursor()
    query = '''
        INSERT INTO Employee(employee_id,first_name,last_name,employee_role) VALUES ("'
    '''
    cursor.execute('SELECT max(employee_id) from Customer')
    employee_id = cursor.fetchall()
    employee_id = int((employee_id[0])[0])+1

    query += employee_id + '", "' +firstname+ '", "' + lastname+ '", "Barista")'

    cursor.execute(query)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

'''
# Get customer detail for customer with particular userID
@employees.route('/employees/<userID>', methods=['GET'])
def get_customer(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from customers where id = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
    '''