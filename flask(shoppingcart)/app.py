from flask import Flask, render_template, request, session, redirect, url_for
from flask_mysqldb import MySQL
from werkzeug.utils import secure_filename
import os
import base64

app = Flask(__name__)
app.secret_key = 'mysecretkey'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'shop1'

mysql = MySQL(app)
UPLOAD_FOLDER = 'static/images'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER


@app.route('/')
def home():
    return render_template('main.html')


@app.route('/signa', methods=['POST', 'GET'])
def about():
    return render_template('signa.html')


@app.route('/logina', methods=['POST', 'GET'])
def logina():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        password = request.form['password']
        
        cur = mysql.connection.cursor()
        sql = "INSERT INTO admin (name, email, password) VALUES (%s, %s, %s)"
        values = (name, email, password)
        cur.execute(sql, values)
        mysql.connection.commit()
        cur.close()
        
        return render_template('logina.html')

    return render_template('logina.html')


@app.route('/logina1', methods=['POST', 'GET'])
def logina1():
    return render_template('logina.html')


@app.route('/signu', methods=['POST', 'GET'])
def signu():
    return render_template('signu.html')


@app.route('/loginu', methods=['POST', 'GET'])
def loginu():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        password = request.form['password']
        
        cur = mysql.connection.cursor()
        sql = "INSERT INTO users (name, email, password) VALUES (%s, %s, %s)"
        values = (name, email, password)
        cur.execute(sql, values)
        mysql.connection.commit()
        cur.close()
        
        return render_template('loginu.html')

    return render_template('loginu.html')


@app.route('/search', methods=['POST', 'GET'])
def search():
    if request.method == 'POST':
        category = request.form['j']
        
        cur = mysql.connection.cursor()
        sql = "SELECT * FROM product WHERE category = %s"
        value = (category,)
        cur.execute(sql, value)
        data = cur.fetchall()
        cur.close()
        
        return render_template('home1.html', data=data)

    return redirect(url_for('home'))


@app.route('/d')
def d():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM product")
    data = cur.fetchall()
    cur.close()
    
    return render_template('home1.html', data=data)


@app.route('/view', methods=['POST', 'GET'])
def view():
    return render_template('view.html')

@app.route('/loginu1', methods=['POST','GET'])
def form():
    if request.method == "POST":
        name = request.form['name']
        email = request.form['email']
        mycursor = mysql.connection.cursor()
        sql = "SELECT * FROM users WHERE email = %s AND name = %s"
        val = (email, name)
        mycursor.execute(sql, val)
        user = mycursor.fetchone()
        if user:
            session['username'] = name
            session['email'] = email
            return redirect(url_for('d'))
        else:
            return render_template('loginu.html')
    else:
      
        return render_template('loginu.html')
    
#@app.route('/add_to_cart', methods=['POST'])
#def add_to_cart():
 #   if 'username' not in session:
  #      return redirect(url_for('home'))

   # if request.method == 'POST':
    #    photo = request.files['photo']
     #   price = request.form['price']
      #  user_id = session['username']

        # Save the image file to the file system
       # filename = secure_filename(photo.name)
        #photo.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))

        #cur = mysql.connection.cursor()
        #sql = "INSERT INTO cart (photo, price, name) VALUES (%s, %s, %s)"
        #values = (filename, price, user_id)
        #cur.execute(sql, values)
        #mysql.connection.commit()
        #cur.close()
        #return redirect(url_for('d'))
    
    #return "Invalid request method"


#@app.route('/view_cart', methods=['POST'])
#def view_cart():
 #   if 'username' not in session:
  #      return redirect(url_for('display1'))

   # cursor = mysql.connection.cursor()
    #cursor.execute("SELECT * FROM cart")
    #data = cursor.fetchall()
    #cursor.close()

    #return render_template('view_cart.html', data=data)





    # Create a new list with modified items
    
    # return render_template('i.html', data=data)



    # id = session['username']

    # mycursor = mydb.cursor()
    # sql = "SELECT price,id FROM cart WHERE id = %s"
    # val = (id,)
    # mycursor.execute(sql, val)
    # data = mycursor.fetchall()
    # return render_template('cart1.html',data=data)
    # return render_template('cart.html', cart_items=cart)
    # return "view"

@app.route('/add_to_cart', methods=['POST','GET'])
def add_to_cart():
    if 'username' not in session:
        return redirect(url_for('home'))

    if request.method == 'POST':
        photo = request.form['photo']
        price = request.form['price']
        user_id = session['username']

        cur = mysql.connection.cursor()
        sql = "INSERT INTO cart (photo, price, name) VALUES (%s, %s, %s)"
        values = (photo, price, user_id)
        cur.execute(sql, values)
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('d'))
        #return render_template('home1.html')

    return "Invalid request method"



import base64

# @app.route('/view_cart', methods=['POST'])
# def view_cart():
#     if 'username' not in session:
#         return redirect(url_for('display1'))
    
#     cursor = mydb.cursor()
   

#     cursor.execute("SELECT * FROM cart ")
#     data = cursor.fetchall()

#     return render_template('i.html',data=data)
#import base64
import logging

@app.route('/view_cart', methods=['POST'])
def view_cart():
    if 'username' not in session:
       return redirect(url_for('display1'))

    #cursor = mysql.connection.cursor()
    #cursor.execute("SELECT * FROM cart")
    #data = cursor.fetchall()
    #cursor.close()

    return render_template('view_cart.html')


@app.route('/display1')
def display1():
    return render_template('display1.html')
@app.route('/submit', methods=['POST','get'])
def submit():
    photo = request.files['photo']
    name = request.form['name']
    price = request.form['price']
    category = request.form['category']
    descr = request.form['description']
    qua = request.form['quantity']

    cursor = mysql.connection.cursor()

    sql = "INSERT INTO product (photo, name, price, category, descr, qua) VALUES (%s, %s, %s, %s, %s, %s)"
    val = (photo.read(), name, price, category, descr, qua)

    # cursor.execute(sql, val)
    # val = (photo.filename,name,price, category,descr,qua)
    # cursor.execute(sql, val)
    # #sql=  f"INSERT INTO {category} (path,name,price,descr,qua) VALUES (%s,%s, %s, %s, %s)"
    # val=(photo.filename,name,price,descr,qua)
    cursor.execute(sql, val)

    mysql.connection.commit()

    return 'Product added successfully'
# @app.route('/remove_from_cart/<int:cart_id>')
# def remove_from_cart(cart_id):
#     if 'user_id' not in session:
#         return redirect(url_for('login'))

#     user_id = session['user_id']

#     mycursor = mydb.cursor()
#     sql = "DELETE FROM cart WHERE cart_id = %s AND user_id = %s"
#     val = (cart_id, user_id)
#     mycursor.execute(sql, val)
#     mydb.commit()

#     return redirect(url_for('view_cart'))

@app.route('/see')
def see():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM product")
    data = cursor.fetchall()


    return render_template('see.html',data=data)

@app.template_filter('b64encode')
def base64_encode(value):
    return base64.b64encode(value).decode('utf-8')




# @app.route('/ho', methods=['POST','GET'])
# def ho():
#     return render_template('up.html')
# @app.route('/upp',methods=['POST','GET'])
# def upp():
#     file=request.files['file']
#     file.save(os.path.join('static/images',file.filename))
#     return redirect('display')
# @app.route('/display')
# def display():
#     images=os.listdir('static/images/')
#     #images=images[::-1]
#     return render_template('display.html',images=images)

if __name__=="__main__":
    app.run(debug=True)