from flask import Flask, render_template, jsonify, request, redirect, url_for, session
from flask_mysqldb import MySQL
app = Flask(__name__)
db = 'sistemaregistro'
host = 'localhost'
usdb = 'root'
psdb =  ''
app.config['MYSQL_DB'] = db
app.config['MYSQL_HOST'] = "localhost"
app.config['MYSQL_USER'] = "root"
app.config['MYSQL_PASSWORD'] = ""
mysql = MySQL(app)


idu = ""
tip = ""
nom = ""
ape = ""
use = ""
nomape = ""


@app.route('/', methods=["GET","POST"])
def index():
    if request.method == "GET":
        return render_template("login.html")
    elif request.method == "POST":
        cur = mysql.connection.cursor()
        user = request.form['username']
        psw = request.form['password']
        cur.execute("SELECT * FROM usuario WHERE idUsuario=" + user + " AND password='" + psw+ "'")
        imon = cur.fetchone()
        print(imon)
        if imon:
            print(imon)
        if imon[1] == ('admin'):
            #return redirect(url_for("admin"))
            nomape = imon[2] + " " + imon[3]
            idu = imon[0]
            tip = imon[1]
            nom = imon[2]
            ape = imon[3]
            use = imon[4]

            return render_template('admin.html', idu = idu, username = use, ape = nom, nomape = nomape)
        elif imon[1] == ("cliente"):
            #return render_template("colab.html")
            return redirect(url_for("table"))

@app.route('/admin', methods=["GET", "POST"])
def admin():
    if request.method == "GET":
        return render_template('admin.html')


@app.route('/agregar_reporte', methods=["POST"])
def aggreporte():
    if request.method == "POST":
        fecha_inspeccion = request.form['fecha_inspeccion']
        fecha_ingreso = request.form['fecha_ingreso']
        fecha_cot = request.form['fecha_cot']
        fecha_salida = request.form['fecha_salida']
        UsuarioCreador = request.form['UsuarioCreador']
        Planta = request.form['Planta']
        Cliente = request.form['Cliente']
        Serie = request.form['Serie']
        Marca = request.form['Marca']
        Medida = request.form['Medida']
        Modelo = request.form['Modelo']
        TipoCompuesto = request.form['TipoCompuesto']
        GRemanente = request.form['GRemanente']
        MaquinaTrabajo = request.form['MaquinaTrabajo']

        # Establece la conexión a la base de datos

        cursor = mysql.connection.cursor()

        # Ejecuta la consulta SQL para insertar los datos en la tabla
        sql = """INSERT INTO idot (fecha_inspeccion, fecha_ingreso, fecha_cot, fecha_salida, UsuarioCreador,
                         Planta, Cliente, Serie, Marca, Medida, Modelo, TipoCompuesto, GRemanente, MaquinaTrabajo)
                         VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""

        values = (fecha_inspeccion, fecha_ingreso, fecha_cot, fecha_salida, UsuarioCreador, Planta, Cliente,
                  Serie, Marca, Medida, Modelo, TipoCompuesto, GRemanente, MaquinaTrabajo)

        cursor.execute(sql, values)
        # Guarda los cambios en la base de datos
        mysql.connection.commit()

        # Cierra la conexión
        cursor.close()
        return redirect(url_for("table"))

@app.route("/tabla")
def table():
    # Realizar la consulta SQL
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM idot")
    result = cursor.fetchall()
    cursor.close()

    # Renderizar la plantilla HTML con los datos
    return render_template("tabla.html", result=result)

@app.route('/eliminar/<int:id>', methods=["POST"])
def eliminar(id):
    if request.method == "POST":
        # Eliminar la entrada de la tabla
        cursor = mysql.connection.cursor()
        cursor.execute("DELETE FROM idot WHERE iddot = %s", (id,))
        mysql.connection.commit()
        cursor.close()
        return redirect(url_for("table"))
        #return "Entrada eliminada exitosamente."

if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True)