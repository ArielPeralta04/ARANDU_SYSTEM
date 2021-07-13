package Dao;

import Controladores.Database;
import Controladores.OperacionesCompraPagoCuota;
import Modelos.CompraPagoCuota;
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
public class DAOCompraPagoCuota implements OperacionesCompraPagoCuota {

    //CONEXION A LAS CLASE DE MODELOS Y CONTROLADORES
    Database db = new Database();
    CompraPagoCuota cpc = new CompraPagoCuota();

    @Override
    public boolean agregar(Object obj) {
        cpc = (CompraPagoCuota) obj;
        String sql = "INSERT INTO compra_pago_cuota\n"
                + "(idpago, idcompra, numero, fechavencimiento, fechapago, monto, idcuenta, idusuario)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, cpc.getIdpago());
            ps.setInt(2, cpc.getIdcompra());
            ps.setInt(3, cpc.getNumero());
            ps.setDate(4, (Date) cpc.getFechavencimiento());
            ps.setDate(5, (Date) cpc.getFechapago());
            ps.setDouble(6, cpc.getMonto());
            ps.setInt(7, cpc.getIdcuenta());
            ps.setInt(8, cpc.getIdusuario());
            int filas = ps.executeUpdate();
            if (filas > 0) {
                con.close();
                JOptionPane.showMessageDialog(null, "REGISTRO DE PAGO EXITOSO", "EXITO", JOptionPane.INFORMATION_MESSAGE);
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
        cpc = (CompraPagoCuota) obj;
        String sql = "DELETE FROM compra_pago_cuota WHERE idpago=? AND idcompra=? AND numero=?;";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, cpc.getIdpago());
            ps.setInt(2, cpc.getIdcompra());
            ps.setInt(3, cpc.getNumero());
            int filas = ps.executeUpdate();
            if (filas > 0) {
                con.close();
                JOptionPane.showMessageDialog(null, "ELIMINACIÓN DEL PAGO EXITOSA", "EXITO", JOptionPane.INFORMATION_MESSAGE);
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
        String sql = "select idpago + 1 as proximo_cod_libre\n"
                + "  from (select 0 as idpago\n"
                + "         union all\n"
                + "        select idpago\n"
                + "          from compra_pago_cuota) t1\n"
                + " where not exists (select null\n"
                + "                     from compra_pago_cuota t2\n"
                + "                    where t2.idpago = t1.idpago + 1)\n"
                + " order by idpago\n"
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
    public ArrayList<Object[]> consultar(String criterio) {
        String sql = "SELECT * FROM compra_pago_cuota WHERE CONCAT(descripcion, idcaja) LIKE ? ORDER BY descripcion;";
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
        cpc = (CompraPagoCuota) obj;
        String sql = "SELECT * FROM caja WHERE idcaja = ?;";
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, cpc.getIdpago());
            rs = ps.executeQuery();
            if (rs.next()) {
                cpc.setIdpago(rs.getInt(1));
                con.close();
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "NO EXISTE CAJA CON EL CÓDIGO INGRESADO...", "ADVERTENCIA", JOptionPane.WARNING_MESSAGE);
                con.close();
                return false;
            }
        } catch (SQLException | ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, "HA OCURRIDO UN ERROR AL OBTENER EL REGISTRO SELECCIONADO \n" + e.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }

}
