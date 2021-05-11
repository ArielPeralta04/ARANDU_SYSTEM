package Dao;

import Controladores.Database;
import Controladores.OperacionesUsuarioPrograma;
import Modelos.UsuarioPrograma;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author armando
 */
public class DAOUsuarioPrograma implements OperacionesUsuarioPrograma {

    //CONEXION A LAS CLASE DE MODELOS Y CONTROLADORES
    Database db = new Database();
    UsuarioPrograma up = new UsuarioPrograma();

    @Override
    public boolean agregar(Object obj) {
        up = (UsuarioPrograma) obj;
        String sql = "INSERT INTO USUARIO_PROGRAMA VALUES(?, ?);";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, up.getIdusuario());
            ps.setInt(2, up.getIdprograma());
            int filas = ps.executeUpdate();
            if (filas > 0) {
                con.close();
                JOptionPane.showMessageDialog(null, "REGISTRO EXITOSO", "EXITO", JOptionPane.INFORMATION_MESSAGE);
                return true;
            } else {
                con.close();
                return false;
            }
        } catch (SQLException | ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, "HA OCURRIDO UN ERROR AL INSERTAR LOS DATOS \n" + e.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }

    @Override
    public boolean eliminar(Object obj) {
        up = (UsuarioPrograma) obj;
        String sql = "DELETE FROM USUARIO_PROGRAMA WHERE idusuario = ? and idprograma = ?;";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, up.getIdusuario());
            ps.setInt(2, up.getIdprograma());
            int filas = ps.executeUpdate();
            if (filas > 0) {
                con.close();
                JOptionPane.showMessageDialog(null, "ELIMINACIÓN EXITOSA", "EXITO", JOptionPane.INFORMATION_MESSAGE);
                return true;
            } else {
                con.close();
                return false;
            }
        } catch (SQLException | ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, "HA OCURRIDO UN ERROR AL ELIMINAR LOS DATOS \n" + e.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }

    @Override
    public ArrayList<Object[]> consultar(String criterio) {
        String sql = "SELECT \n"
                + "UP.idusuario, \n"
                + "CONCAT(U.nombre,' ',U.apellido) AS usuario,\n"
                + "UP.idprograma,\n"
                + "P.descripcion\n"
                + "FROM usuario_programa AS UP\n"
                + "INNER JOIN USUARIO AS U ON U.idusuario = UP.idusuario\n"
                + "INNER JOIN PROGRAMA AS P ON P.idprograma = UP.idprograma\n"
                + "WHERE CONCAT(U.nombre, U.apellido, U.alias, P.descripcion) LIKE ?\n"
                + "ORDER BY U.nombre;";
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        ArrayList<Object[]> datos = new ArrayList<>();
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + criterio + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Object[] fila = new Object[4];
                fila[0] = rs.getInt(1);
                fila[1] = rs.getString(2);
                fila[2] = rs.getInt(3);
                fila[3] = rs.getString(4);
                datos.add(fila);
            }
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, "HA OCURRIDO UN ERROR AL OBTENER LA LISTA DE LOS DATOS \n" + e.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return datos;
    }

    @Override
    public boolean consultarDatos(Object obj) {
        up = (UsuarioPrograma) obj;
        String sql = "SELECT * FROM USUARIO_PROGRAMA WHERE idusuario = ? and idprograma = ?;";
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, up.getIdusuario());
            ps.setInt(2, up.getIdprograma());
            rs = ps.executeQuery();
            if (rs.next()) {
                up.setIdusuario(rs.getInt(1));
                up.setIdprograma(rs.getInt(2));
                con.close();
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "EL USUARIO INGRESADO NO TIENE PERMISOS PARA ACCEDER AL PROGRAMA...", "ADVERTENCIA", JOptionPane.WARNING_MESSAGE);
                con.close();
                return false;
            }
        } catch (SQLException | ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, "HA OCURRIDO UN ERROR AL OBTENER EL REGISTRO SELECCIONADO \n" + e.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }

}
