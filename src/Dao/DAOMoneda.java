package Dao;

import Controladores.Database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import Controladores.OperacionesMoneda;
import Modelos.Moneda;

/**
 *
 * @author armando
 */
public class DAOMoneda implements OperacionesMoneda {

    //CONEXION A LAS CLASE DE MODELOS Y CONTROLADORES
    Database db = new Database();
    Moneda m = new Moneda();

    @Override
    public boolean agregar(Object obj) {
        m = (Moneda) obj;
        String sql = "INSERT INTO moneda VALUES(?, ?, ?);";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, m.getIdmoneda());
            ps.setString(2, m.getDescripcion());
            ps.setString(3, m.getSimbolo());
            int filas = ps.executeUpdate();
            if (filas > 0) {
                con.close();
                JOptionPane.showMessageDialog(null, "REGISTRO EXITOSO","EXITO",JOptionPane.INFORMATION_MESSAGE);
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
    public boolean modificar(Object obj) {
        m = (Moneda) obj;
        String sql = "UPDATE moneda SET descripcion = ?, simbolo = ? WHERE idmoneda = ?;";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setString(1, m.getDescripcion());
            ps.setString(2, m.getSimbolo());
            ps.setInt(3, m.getIdmoneda());
            int filas = ps.executeUpdate();
            if (filas > 0) {
                con.close();
                JOptionPane.showMessageDialog(null, "ACTUALIZACI??N EXITOSA","EXITO",JOptionPane.INFORMATION_MESSAGE);
                return true;
            } else {
                con.close();
                return false;
            }
        } catch (SQLException | ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, "HA OCURRIDO UN ERROR AL MODIFICAR LOS DATOS \n" + e.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }

    @Override
    public boolean eliminar(Object obj) {
        m = (Moneda) obj;
        String sql = "DELETE FROM moneda WHERE idmoneda = ?;";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, m.getIdmoneda());
            int filas = ps.executeUpdate();
            if (filas > 0) {
                con.close();
                JOptionPane.showMessageDialog(null, "ELIMINACI??N EXITOSA","EXITO",JOptionPane.INFORMATION_MESSAGE);
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
    public int nuevoID() {
        String sql = "select idmoneda + 1 as proximo_cod_libre\n"
                + "  from (select 0 as idmoneda\n"
                + "         union all\n"
                + "        select idmoneda\n"
                + "          from moneda) t1\n"
                + " where not exists (select null\n"
                + "                     from moneda t2\n"
                + "                    where t2.idmoneda = t1.idmoneda + 1)\n"
                + " order by idmoneda\n"
                + " LIMIT 1;";
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        int id = 0;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, "HA OCURRIDO UN ERROR AL OBTENER UN NUEVO C??DIGO \n" + e.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return id;
    }

    @Override
    public ArrayList<Object[]> consultar(String criterio) {
        String sql = "SELECT * FROM moneda WHERE CONCAT(descripcion, simbolo, idmoneda) LIKE ? ORDER BY descripcion;";
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
                Object[] fila = new Object[3];
                fila[0] = rs.getInt(1);
                fila[1] = rs.getString(2);
                fila[2] = rs.getString(3);
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
        m = (Moneda) obj;
        String sql = "SELECT * FROM moneda WHERE idmoneda = ?;";
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, m.getIdmoneda());
            rs = ps.executeQuery();
            if (rs.next()) {
                m.setIdmoneda(rs.getInt(1));
                m.setDescripcion(rs.getString(2));
                con.close();
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "NO EXISTE MONEDA CON EL C??DIGO INGRESADO...", "ADVERTENCIA", JOptionPane.WARNING_MESSAGE);
                con.close();
                return false;
            }
        } catch (SQLException | ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, "HA OCURRIDO UN ERROR AL OBTENER EL REGISTRO SELECCIONADO \n" + e.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }

}
