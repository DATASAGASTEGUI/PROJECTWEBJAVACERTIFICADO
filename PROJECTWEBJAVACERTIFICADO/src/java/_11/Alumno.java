package _11;

public class Alumno {

    private String codigo;
    private String nombre;
    private int edad;
    private double estatura;
    private String foto;

    public Alumno() {
    }

    public Alumno(String codigo, String nombre, int edad, double estatura, String foto) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.edad = edad;
        this.estatura = estatura;
        this.foto = foto;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public double getEstatura() {
        return estatura;
    }

    public void setEstatura(double estatura) {
        this.estatura = estatura;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    @Override
    public String toString() {
        return "Alumno{" + "codigo=" + codigo + ", nombre=" + nombre + ", edad=" + edad + ", estatura=" + estatura + ", foto=" + foto + '}';
    }

}
