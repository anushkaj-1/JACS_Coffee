from flask import Blueprint, Flask, request, jsonify, make_response, current_app
import json
from src import db
from datetime import date


customers = Blueprint('customers', __name__)

# Get all customers from the DB
@customers.route('/customers', methods=['GET'])
def get_customers():
    cursor = db.get_db().cursor()
    cursor.execute('select * from Customer')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
        the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get customer detail for customer with particular userID
@customers.route('/customers/<userID>', methods=['GET'])
def get_customer(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Customer where user_id = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Customers add themselves to the database
@customers.route('/makeAccount', methods = ['POST'])
def make_account():

    the_data = request.json
    current_app.logger.info(the_data)
    cursor = db.get_db().cursor()
    

    cst_name = the_data['customer_name']
    birthday = the_data['customer_birthday']
    cursor.execute('SELECT max(user_id) from Customer')
    user_id = cursor.fetchall()
    user_id = int((user_id[0])[0])+1

    query = 'INSERT INTO Customer (cst_name, birthday, points, user_id) values ("'
    query += cst_name +'", '
    query += "STR_TO_DATE('" + birthday + "' ,'%d,%m,%Y'), \""
    query += str(0) + '", "'
    query += str(user_id) +'")'
    current_app.logger.info(query)

    cursor2 = db.get_db().cursor()
    cursor2.execute(query)
    db.get_db().commit()
    return 'New customer:' + cst_name +', ' + birthday +', ' + str(user_id) +'.'

# Get the customer's order history
@customers.route('/orders/<userID>', methods=['GET'])
def get_order_history(userID):
    cursor = db.get_db().cursor()
    query = '''
        SELECT order_date, order_id, order_method, price, user_id
        FROM Orders NATURAL JOIN Drink
        where user_id = {0}'''.format(userID)
       
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


#Customers can place online orders
@customers.route('/placeOrder', methods = ['POST'])
def place_order():
    the_data = request.json
    current_app.logger.info(the_data)
    cursor = db.get_db().cursor()
    

    order_date = str(date.today())
    order_method = 'Online'
    drink_id = the_data['drink_id']
    user_id = the_data['user_id']
    cursor.execute('SELECT max(order_id) from Orders')
    order_id = cursor.fetchall()
    order_id = int((order_id[0])[0])+1

    query = 'INSERT INTO Orders (order_date, order_method, user_id, order_id) values ('
    query += "STR_TO_DATE('" + order_date + "' ,'%Y-%m-%d'), \""
    query += order_method + '",'
    query += str(user_id) +',"'
    query += str(order_id) +'")'
    current_app.logger.info(query)

    query2 = 'INSERT INTO Drnk_Ord (order_id, drink_id) values ('
    query2 += str(order_id) +', '
    query2 += str(drink_id) + ')'
    current_app.logger.info(query2)

    cursor2 = db.get_db().cursor()
    cursor2.execute(query)
    cursor2.execute(query2)

    cursor3 = db.get_db().cursor()
    cursor4 = db.get_db().cursor()
    cursor5 = db.get_db().cursor()

    cursor3.execute('select points from Customer where user_id = "' + str(user_id) + '"')
    cursor4.execute('select point_value from Drink where drink_id = ' + str(drink_id))
    newPoints = cursor3.fetchall()
    addedPoints = cursor4.fetchall()
    newPoints = int((newPoints[0])[0]) + int((addedPoints[0])[0])
    cursor5.execute('UPDATE Customer SET points = "' + str(newPoints) + '" WHERE user_id = "' + str(user_id) +  '";')

    db.get_db().commit()
    return 'New customer:' + order_date +', ' + order_method + ', ' + str(user_id) + ', ' + str(drink_id) + ', ' + str(order_id) +'.'

#Get customers current points
@customers.route('/points/<userID>', methods = ['GET'])
def get_points(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select points from Customer where user_id = {0}'.format(userID))
    the_response = cursor.fetchall()
    return str(the_response[0][0])

#Access customers rewards
@customers.route('/rewards/<userID>', methods = ['GET', 'POST'])
def cst_rewards(userID):
    if request.method == 'GET':
        cursor = db.get_db().cursor()
        cursor.execute('select * from Rewards where user_id = {0}'.format(userID))
        row_headers = [x[0] for x in cursor.description]
        json_data = []
        theData = cursor.fetchall()
        for row in theData:
            json_data.append(dict(zip(row_headers, row)))
        the_response = make_response(jsonify(json_data))
        the_response.status_code = 200
        the_response.mimetype = 'application/json'
        return the_response
    else:
        the_data = request.json
        current_app.logger.info(the_data)
        cursor = db.get_db().cursor()
    

        discount = str(the_data['discount'])
        exp_date = str(the_data['exp_date'])
        item = the_data['item']
        user_id = userID
        pointValue = str(the_data['pointValue'])
        cursor.execute('SELECT max(reward_id) from Rewards')
        reward_id = cursor.fetchall()
        reward_id = int((reward_id[0])[0])+1

        cursor2 = db.get_db().cursor()
        cursor2.execute('select points from Customer where user_id = "' + user_id + '"')
        cstPoints = cursor2.fetchall()
        cstPoints = int((cstPoints[0])[0])

        if cstPoints < int(pointValue):
            return 'Not enough points to redeem reward'
        else:
            query = 'INSERT INTO Rewards (discount, exp_date, item, user_id, pointValue, reward_id) values ("'
            query += discount +'", '
            query += "STR_TO_DATE('" + exp_date + "' ,'%d-%m-%Y'), \""
            query += item +'", "'
            query += user_id +'", "'
            query += pointValue +'", "'
            query += str(reward_id) +'")'
            current_app.logger.info(query)

        cursor3 = db.get_db().cursor()
        cursor3.execute(query)
        db.get_db().commit()
        return 'New reward:' + discount +', ' + exp_date +', ' + item + ', ' + user_id + ', ' + pointValue + ', ' + str(reward_id) +'.'
    
    #gets all rewards in database
@customers.route('/allRewards', methods=['GET'])
def get_all_reward():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT * from Rewards')

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