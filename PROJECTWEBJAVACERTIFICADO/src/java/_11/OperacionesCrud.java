package _11;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OperacionesCrud {

    private Connection conexion;

    public OperacionesCrud(Connection conexion) {
        this.conexion = conexion;
    }

    public List<Alumno> getArrayListAlumnos() {
        List<Alumno> alumnos_al = new ArrayList<>();
        String query = "SELECT * FROM Alumno";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
               String codigo = rs.getString(1);
               String nombre = rs.getString(2);
               int edad = rs.getInt(3);
               double estatura = rs.getDouble(4);
               String foto = rs.getString(5);
               Alumno alumno = new Alumno(codigo,nombre,edad,estatura,foto);
               alumnos_al.add(alumno);
            }
        } catch (Exception e) {
            alumnos_al = null;
        }
        return alumnos_al;
    }

}
