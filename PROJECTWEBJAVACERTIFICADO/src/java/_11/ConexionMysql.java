package _11;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionMysql {

    private Connection conexion;

    public ConexionMysql(String db) {
        setConexion(db);
    }

    public void setConexion(String db) {
        String url = "jdbc:mysql://localhost:3306/" + db;
        String usuario = "root";
        String clave = "12345678";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (Exception e) {
            System.out.println("Error: " + e);
            conexion = null;
        }

    }

    public Connection getConexion() {
        return conexion;
    }
}
