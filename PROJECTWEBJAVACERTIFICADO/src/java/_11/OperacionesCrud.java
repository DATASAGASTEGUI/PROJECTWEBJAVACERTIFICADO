package _11;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OperacionesCrud {

    private Connection conexion;

    public OperacionesCrud(Connection conexion) {
        this.conexion = conexion;
    }

    public OperacionesCrud() {
    }

    public List<Alumno> getArrayListAlumnos() {
        List<Alumno> alumnos_al = new ArrayList<>();
        String query = "SELECT * FROM Alumno";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String codigo = rs.getString(1);
                String nombre = rs.getString(2);
                int edad = rs.getInt(3);
                double estatura = rs.getDouble(4);
                String foto = rs.getString(5);
                Alumno alumno = new Alumno(codigo, nombre, edad, estatura, foto);
                alumnos_al.add(alumno);
            }
        } catch (Exception e) {
            alumnos_al = null;
        }
        return alumnos_al;
    }

    public Map<String, Alumno> getHashMapAlumno() {
        Map<String, Alumno> alumnos_hm = new HashMap<>();

        List<Alumno> alumnos_al = getArrayListAlumnos();

        for (Alumno a : alumnos_al) {
            alumnos_hm.put(a.getCodigo(), a);
        }
        return alumnos_hm;
    }

    public boolean eliminarAlumno(String codigo) {
        String query = "DELETE FROM Alumno WHERE codigo = ?";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, codigo);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean actualizarAlumno(Alumno alumno) {
        String query = "UPDATE Alumno SET nombre = ?, edad = ?, estatura = ? WHERE codigo = ?";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, alumno.getNombre());
            ps.setInt(2, alumno.getEdad());
            ps.setDouble(3, alumno.getEstatura());
            ps.setString(4, alumno.getCodigo());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean insertarAlumno(Alumno alumno) {
        String query = "INSERT INTO Alumno(codigo,nombre,edad,estatura,foto) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, alumno.getCodigo());
            ps.setString(2, alumno.getNombre());
            ps.setInt(3, alumno.getEdad());
            ps.setDouble(4, alumno.getEstatura());
            ps.setString(5, alumno.getFoto());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public void insertarAlumno1(Alumno alumno) {
        String query = "INSERT INTO Alumno(codigo,nombre,edad,estatura,foto) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, alumno.getCodigo());
            ps.setString(2, alumno.getNombre());
            ps.setInt(3, alumno.getEdad());
            ps.setDouble(4, alumno.getEstatura());
            ps.setString(5, alumno.getFoto());
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public boolean existeAlumno(String idAlumno) {
        boolean existe = false;
        String query = "SELECT * FROM Alumno WHERE codigo = ?";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, idAlumno);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                existe = true;
            }

        } catch (Exception e) {
            existe = false;
        }
        return existe;
    }

    public String generarCodigo() {
        String query = "SELECT codigo FROM Alumno ORDER by codigo DESC LIMIT 1";
        String codigo = "";
        int numero = 0;
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                codigo = rs.getString(1); //A10
            }

            numero = Integer.parseInt(codigo.substring(1)) + 1; //11
            System.out.println(numero);

        } catch (Exception e) {

        }
        return "A" + numero; //A11
    }

    //ORDENAR POR EL ATRIBUTO NOMBRE (ASCENDENTE)
    public void ordenarArrayListPorNombre(List<Alumno> alumnos_al) {
        Collections.sort(alumnos_al, new Comparator<Alumno>() {
            @Override
            public int compare(Alumno a1, Alumno a2) {
                return a1.getNombre().compareTo(a2.getNombre());
            }
        });
    }

    //ORDENAR POR EL ATRIBUTO EDAD (ASCENDENTE)
    public void ordenarArrayListPorEdad(List<Alumno> alumnos_al) {
        Collections.sort(alumnos_al, new Comparator<Alumno>() {
            @Override
            public int compare(Alumno a1, Alumno a2) {
                return String.valueOf(a1.getEdad()).compareTo(String.valueOf(a2.getEdad()));
            }
        });
    }

    //ORDENAR POR EL ATRIBUTO ESTATURA (ASCENDENTE)
    public void ordenarArrayListPorEstatura(List<Alumno> alumnos_al) {
        Collections.sort(alumnos_al, new Comparator<Alumno>() {
            @Override
            public int compare(Alumno a1, Alumno a2) {
                return String.valueOf(a1.getEstatura()).compareTo(String.valueOf(a2.getEstatura()));
            }
        });
    }
}
