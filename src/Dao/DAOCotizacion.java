package Dao;

import Controladores.Database;
import Controladores.OperacionesCotizacion;
import Modelos.Cotizacion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author armando
 */
public class DAOCotizacion implements OperacionesCotizacion {

    //CONEXION A LAS CLASE DE MODELOS Y CONTROLADORES
    Database db = new Database();
    Cotizacion c = new Cotizacion();

    @Override
    public boolean agregar(Object obj) {
        c = (Cotizacion) obj;
        String sql = "INSERT INTO COTIZACION VALUES(?, ?, ?);";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, c.getIdmoneda());
            ps.setDate(2, (Date) c.getFecha());
            ps.setDouble(3, c.getTasa());
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
    public boolean modificar(Object obj) {
        c = (Cotizacion) obj;
        String sql = "UPDATE COTIZACION SET tasa = ? WHERE idmoneda = ? AND fecha = ?;";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setDouble(1, c.getTasa());
            ps.setInt(2, c.getIdmoneda());
            ps.setDate(3, (Date) c.getFecha());
            int filas = ps.executeUpdate();
            if (filas > 0) {
                con.close();
                JOptionPane.showMessageDialog(null, "ACTUALIZACIÓN EXITOSA", "EXITO", JOptionPane.INFORMATION_MESSAGE);
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
        c = (Cotizacion) obj;
        String sql = "DELETE FROM COTIZACION WHERE idmoneda = ? AND fecha = ?;";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, c.getIdmoneda());
            ps.setDate(2, (Date) c.getFecha());
            int filas = ps.executeUpdate();
            if (filas == 0) {
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
                + "C.idmoneda,\n"
                + "M.descripcion AS Descripcion,\n"
                + "DATE_FORMAT(C.fecha,'%d/%m/%Y') AS Fecha,\n"
                + "C.tasa\n"
                + "FROM cotizacion AS C\n"
                + "INNER JOIN moneda AS M ON M.idmoneda = C.idmoneda\n"
                + "WHERE CONCAT(DATE_FORMAT(C.fecha,'%d/%m/%Y'), M.descripcion) LIKE ?\n"
                + "ORDER BY C.fecha DESC;";
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
                Object[] fila = new Object[2];
                fila[0] = rs.getInt(1);
                fila[1] = rs.getString(2);
                fila[2] = rs.getString(3);
                fila[3] = rs.getDouble(4);
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public java.util.Date parseFecha(String cadena) {
        SimpleDateFormat formateo = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date fecha = null;
        try {
            fecha = formateo.parse(cadena);
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        return fecha;
    }

}
