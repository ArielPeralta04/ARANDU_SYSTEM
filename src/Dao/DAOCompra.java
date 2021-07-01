package Dao;

import Controladores.Database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import Controladores.OperacionesCompra;
import Modelos.Compra;
import java.sql.Date;

/**
 *
 * @author armando
 */
public class DAOCompra implements OperacionesCompra {

    //CONEXION A LAS CLASE DE MODELOS Y CONTROLADORES
    Database db = new Database();
    Compra c = new Compra();

    @Override
    public boolean agregar(Object obj) {
        c = (Compra) obj;
        String sql = "INSERT INTO compra\n"
                + "(idcompra, numerodocumento, numerotimbrado, fecha, \n"
                + "observacion, idmoneda, iddeposito, idtipomovimiento, idproveedor, idusuario, totalneto, totaliva)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, c.getIdcompra());
            ps.setString(2, c.getNumerodocumento());
            ps.setInt(3, c.getNumerotimbrado());
            ps.setDate(4, (Date) c.getFecha());
            ps.setString(5, c.getObservacion());
            ps.setInt(6, c.getIdmoneda());
            ps.setInt(7, c.getIddeposito());
            ps.setInt(8, c.getIdtipomovimiento());
            ps.setInt(9, c.getIdproveedor());
            ps.setInt(10, c.getIdusuario());
            ps.setDouble(11, c.getTotalneto());
            ps.setDouble(12, c.getTotaliva());
            int filas = ps.executeUpdate();
            if (filas > 0) {
                con.close();
                //JOptionPane.showMessageDialog(null, "COMPRA REGISTRADA EXITOSAMENTE", "EXITO", JOptionPane.INFORMATION_MESSAGE);
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
        c = (Compra) obj;
        String sql = "UPDATE compra\n"
                + "	SET\n"
                + "		numerodocumento=?,\n"
                + "		numerotimbrado=?,\n"
                + "		fecha=?,\n"
                + "		observacion=?,\n"
                + "		idmoneda=?,\n"
                + "		iddeposito=?,\n"
                + "		idtipomovimiento=?,\n"
                + "		idproveedor=?,\n"
                + "		idusuario=?\n"
                + "		totalneto=?\n"
                + "		totaliva=?\n"
                + "	WHERE idcompra=?;";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, c.getIdcompra());
            ps.setString(2, c.getNumerodocumento());
            ps.setInt(3, c.getNumerotimbrado());
            ps.setDate(4, (Date) c.getFecha());
            ps.setString(5, c.getObservacion());
            ps.setInt(6, c.getIdmoneda());
            ps.setInt(7, c.getIddeposito());
            ps.setInt(8, c.getIdtipomovimiento());
            ps.setInt(9, c.getIdproveedor());
            ps.setInt(10, c.getIdusuario());
            ps.setDouble(11, c.getTotalneto());
            ps.setDouble(12, c.getTotaliva());
            int filas = ps.executeUpdate();
            if (filas > 0) {
                con.close();
                JOptionPane.showMessageDialog(null, "COMPRA ACTUALIZADA EXITOSAMENTE", "EXITO", JOptionPane.INFORMATION_MESSAGE);
                return true;
            } else {
                con.close();
                return false;
            }
        } catch (SQLException | ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, "HA OCURRIDO UN ERROR AL ACTUALIZAR LOS DATOS \n" + e.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }

    @Override
    public boolean eliminar(Object obj) {
        c = (Compra) obj;
        String sql = "DELETE FROM compra WHERE idcompra = ?;";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, c.getIdcompra());
            int filas = ps.executeUpdate();
            if (filas > 0) {
                con.close();
                JOptionPane.showMessageDialog(null, "COMPRA ELIMINADA EXITOSAMENTE", "EXITO", JOptionPane.INFORMATION_MESSAGE);
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
        String sql = "select idcompra + 1 as proximo_cod_libre\n"
                + "  from (select 0 as idcompra\n"
                + "         union all\n"
                + "        select idcompra\n"
                + "          from compra) t1\n"
                + " where not exists (select null\n"
                + "                     from compra t2\n"
                + "                    where t2.idcompra = t1.idcompra + 1)\n"
                + " order by idcompra\n"
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
            JOptionPane.showMessageDialog(null, "HA OCURRIDO UN ERROR AL OBTENER UN NUEVO CÓDIGO \n" + e.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return id;
    }

    @Override
    public boolean verificarExistenciaCompra(String numerodocumento, int numerotimbrado) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
