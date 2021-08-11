package Dao;

import Controladores.Database;
import Controladores.OperacionesCompraAnulado;
import Modelos.CompraAnulado;
import java.sql.Connection;
import java.sql.Date;
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
public class DAOCompraAnulado implements OperacionesCompraAnulado {

    //CONEXION A LAS CLASE DE MODELOS Y CONTROLADORES
    Database db = new Database();
    CompraAnulado ca = new CompraAnulado();

    @Override
    public boolean agregar(Object obj) {
        ca = (CompraAnulado) obj;
        String sql = "INSERT INTO compra_anulado\n"
                + "(idcompraanulado, fechahoraanulado, observacionanulado, \n"
                + "idmotivo, idusuarioanulado, idcompra, numerodocumento, \n"
                + "numerotimbrado, fecha, observacion, idmoneda, \n"
                + "iddeposito, idtipomovimiento, idproveedor, idusuario, \n"
                + "totalneto, totaliva, idcuenta)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, ca.getIdcompraanulado());
            ps.setTimestamp(2, ca.getFechahoranulado());
            ps.setString(3, ca.getObservacionanulado());
            ps.setInt(4, ca.getIdmotivo());
            ps.setInt(5, ca.getIdusuarioanulado());
            ps.setInt(6, ca.getIdcompra());
            ps.setString(7, ca.getNumerodocumento());
            ps.setInt(8, ca.getNumerotimbrado());
            ps.setDate(9, (Date) ca.getFecha());
            ps.setString(10, ca.getObservacion());
            ps.setInt(11, ca.getIdmoneda());
            ps.setInt(12, ca.getIddeposito());
            ps.setInt(13, ca.getIdtipomovimiento());
            ps.setInt(14, ca.getIdproveedor());
            ps.setInt(15, ca.getIdusuario());
            ps.setDouble(16, ca.getTotalneto());
            ps.setDouble(17, ca.getTotaliva());
            ps.setInt(18, ca.getIdcuenta());
            int filas = ps.executeUpdate();
            if (filas > 0) {
                con.close();
                JOptionPane.showMessageDialog(null, "REGISTRO DE ANULACIÓN DE COMPRA EXITOSA", "EXITO", JOptionPane.INFORMATION_MESSAGE);
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
        ca = (CompraAnulado) obj;
        String sql = "DELETE FROM compra_anulado WHERE idcompraanulacion=?;";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, ca.getIdcompraanulado());
            int filas = ps.executeUpdate();
            if (filas > 0) {
                con.close();
                JOptionPane.showMessageDialog(null, "ELIMINACIÓN DE LA ANULACIÓN DE COMPRA EXITOSA", "EXITO", JOptionPane.INFORMATION_MESSAGE);
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
        String sql = "select idcompraanulado + 1 as proximo_cod_libre\n"
                + "  from (select 0 as idcompraanulado\n"
                + "         union all\n"
                + "        select idcompraanulado\n"
                + "          from compra_anulado) t1\n"
                + " where not exists (select null\n"
                + "                     from compra_anulado t2\n"
                + "                    where t2.idcompraanulado = t1.idcompraanulado + 1)\n"
                + " order by idcompraanulado\n"
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
    public boolean consultarDatos(Object obj) {
        ca = (CompraAnulado) obj;
        String sql = "SELECT * FROM compra_anulado WHERE idcompraanulado = ?;";
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, ca.getIdcompraanulado());
            rs = ps.executeQuery();
            if (rs.next()) {
                ca.setIdcompraanulado(rs.getInt(1));
                con.close();
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "NO EXISTE ANULACIÓN DE COMPRA CON EL CÓDIGO INGRESADO...", "ADVERTENCIA", JOptionPane.WARNING_MESSAGE);
                con.close();
                return false;
            }
        } catch (SQLException | ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, "HA OCURRIDO UN ERROR AL OBTENER EL REGISTRO SELECCIONADO \n" + e.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }

    @Override
    public ArrayList<Object[]> consultar(String criterio) {
        String sql = "SELECT \n"
                + "CA.idcompraanulado, \n"
                + "DATE_FORMAT(CA.fechahoraanulado, '%d/%m/%Y %H:%i:%s') AS Fecha_hora_anulado, \n"
                + "CA.observacionanulado, \n"
                + "CA.idmotivo, \n"
                + "MA.descripcion AS Motivo,\n"
                + "CA.idusuarioanulado, \n"
                + "CONCAT(U.nombre,' ',U.apellido) AS Usuario_anulacion,\n"
                + "CA.idcompra, \n"
                + "CA.numerodocumento, \n"
                + "CA.numerotimbrado, \n"
                + "DATE_FORMAT(CA.fecha, '%d/%m/%Y') AS Fecha_comprobante, \n"
                + "CA.observacion, \n"
                + "CA.idmoneda, \n"
                + "M.descripcion AS Moneda,\n"
                + "CA.iddeposito, \n"
                + "D.descripcion AS Deposito,\n"
                + "CA.idtipomovimiento, \n"
                + "TM.abreviacion AS Tipo_movimiento,\n"
                + "CA.idproveedor, \n"
                + "P.razonsocial AS Proveedor,\n"
                + "CA.idusuario, \n"
                + "CONCAT(U.nombre,' ',U.apellido) AS Usuario,\n"
                + "CA.totalneto, \n"
                + "CA.totaliva, \n"
                + "CA.idcuenta,\n"
                + "C.descripcion AS Cuenta\n"
                + "FROM compra_anulado AS CA\n"
                + "INNER JOIN motivo_anulacion AS MA ON MA.idmotivo = CA.idmotivo\n"
                + "INNER JOIN usuario AS UA ON UA.idusuario = CA.idusuarioanulado\n"
                + "INNER JOIN moneda AS M ON M.idmoneda = CA.idmoneda\n"
                + "INNER JOIN deposito AS D ON D.iddeposito = CA.iddeposito\n"
                + "INNER JOIN tipo_movimiento AS TM ON TM.idtipomovimiento = CA.idtipomovimiento\n"
                + "INNER JOIN proveedor AS P ON P.idproveedor = CA.idproveedor\n"
                + "INNER JOIN usuario AS U ON U.idusuario = CA.idusuario\n"
                + "INNER JOIN cuenta AS C ON C.idcuenta = CA.idcuenta\n"
                + "WHERE CONCAT(CA.numerodocumento, CA.numerotimbrado, DATE_FORMAT(CA.fecha, '%d/%m/%Y')) LIKE ?\n"
                + "ORDER BY CA.numerodocumento;";
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
                Object[] fila = new Object[26];
                fila[0] = rs.getInt(1);
                fila[1] = rs.getString(2);
                fila[2] = rs.getString(3);
                fila[3] = rs.getInt(4);
                fila[4] = rs.getString(5);
                fila[5] = rs.getInt(6);
                fila[6] = rs.getString(7);
                fila[7] = rs.getInt(8);
                fila[8] = rs.getString(9);
                fila[9] = rs.getInt(10);
                fila[10] = rs.getString(11);
                fila[11] = rs.getString(12);
                fila[12] = rs.getInt(13);
                fila[13] = rs.getString(14);
                fila[14] = rs.getInt(15);
                fila[15] = rs.getString(16);
                fila[16] = rs.getInt(17);
                fila[17] = rs.getString(18);
                fila[18] = rs.getInt(19);
                fila[19] = rs.getString(20);
                fila[20] = rs.getInt(21);
                fila[21] = rs.getString(22);
                fila[22] = rs.getDouble(23);
                fila[23] = rs.getDouble(24);
                fila[24] = rs.getInt(25);
                fila[25] = rs.getString(26);
                datos.add(fila);
            }
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, "HA OCURRIDO UN ERROR AL OBTENER LA LISTA DE LOS DATOS \n" + e.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return datos;
    }

}
