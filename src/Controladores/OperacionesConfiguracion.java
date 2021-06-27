package Controladores;

import java.util.ArrayList;

/**
 *
 * @author armando
 */
public interface OperacionesConfiguracion {
    public boolean agregar(Object obj);
    public boolean modificar(Object obj);
    public boolean eliminar(Object obj);
    public int nuevoID();
    public ArrayList<Object[]> consultar(String criterio);
    public boolean consultarDatos(Object obj);
    public int verificarConfiguracion(int id);
}