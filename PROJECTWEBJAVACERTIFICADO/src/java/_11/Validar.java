package _11;

public class Validar {

    public static boolean nombreYApellido(String na) {
        return na.matches("[a-zA-ZñÑáéíóú\\s]+");
    }

    public static boolean estatura(String nr) {
        return nr.matches("([0-9]+\\.[0-9]+)||[0-9]+");
    }

    public static boolean edad(String ne) {
        return ne.matches("[0-9]{2}");
    }

    /*
    public static boolean codigo(String c) {
        return c.matches("A[0-9]{2}");
    }*/
    
    public static boolean foto(String f) {
        return f.matches("[0-9]{2}\\.png");
    }
}
