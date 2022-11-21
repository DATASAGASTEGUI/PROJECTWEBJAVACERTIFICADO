package _15;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.bson.Document;

public class OperacionesCrud {

    private Connection conexionmy;
    private MongoDatabase conexionmo;

    MongoCollection<Document> coleccion;

    public OperacionesCrud(int x) { //x=1 MONGODB   x=2 MYSQL
        if (x == 1) {
            MongoClient cliente = new MongoClient("localhost", 27017);
            conexionmo = cliente.getDatabase("colegio");
            coleccion = conexionmo.getCollection("alumno");
        }

        if (x == 2) {
            String url = "jdbc:mysql://localhost:3306/colegio";
            String usuario = "root";
            String clave = "12345678";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conexionmy = DriverManager.getConnection(url, usuario, clave);
            } catch (Exception e) {
                System.out.println("Error: " + e);
                conexionmy = null;
            }
        }

    }

    public Map<String, Alumno> getHashMapAlumno(int x) {
        Map<String, Alumno> alumnos_hm = new HashMap<>();

        if (x == 1) {
            MongoCursor<Document> cursor = coleccion.find().iterator();

            while (cursor.hasNext()) {
                Document documento = cursor.next();
                
                List lista = new ArrayList(documento.values());//Object
                
                String codigo = (String) lista.get(1);
                String nombre = (String) lista.get(2);
                int edad = (int) lista.get(3);
                double estatura = (double) lista.get(4);
                String foto = (String) lista.get(5);
                
                Alumno alumno = new Alumno(codigo, nombre, edad, estatura, foto);

                alumnos_hm.put(alumno.getIdAlumno(), alumno);
            }
        }

        /*
        if (x == 1) {
            MongoCursor<Document> cursor = coleccion.find().iterator();

            while (cursor.hasNext()) {
                Document documento = cursor.next();
                
                
                
                
                Alumno alumno = new Alumno(documento);
                alumnos_hm.put(alumno.getIdAlumno(), alumno);
            }
        }

         */
        if (x == 2) {
            String query = "SELECT * FROM Alumno";
            try {
                PreparedStatement ps = conexionmy.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String codigo = rs.getString(1);
                    String nombre = rs.getString(2);
                    int edad = rs.getInt(3);
                    double estatura = rs.getDouble(4);
                    String foto = rs.getString(5);
                    Alumno alumno = new Alumno(codigo, nombre, edad, estatura, foto);
                    alumnos_hm.put(alumno.getIdAlumno(), alumno);
                }
            } catch (Exception e) {
                alumnos_hm = null;
            }

        }

        return alumnos_hm;
    }

}
