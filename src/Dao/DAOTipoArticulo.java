package Dao;

import Controladores.Database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import Modelos.TipoArticulo;
import Controladores.OperacionesTipoArticulo;

/**
 *
 * @author armando
 */
public class DAOTipoArticulo implements OperacionesTipoArticulo {

    //CONEXION A LAS CLASE DE MODELOS Y CONTROLADORES
    Database db = new Database();
    TipoArticulo ti = new TipoArticulo();

    @Override
    public boolean agregar(Object obj) {
        ti = (TipoArticulo) obj;
        String sql = "INSERT INTO TIPO_ARTICULO VALUES(?, ?);";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, ti.getIdtipo());
            ps.setString(2, ti.getDescripcion());
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
        ti = (TipoArticulo) obj;
        String sql = "UPDATE TIPO_ARTICULO SET descripcion = ? WHERE idtipo = ?;";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setString(1, ti.getDescripcion());
            ps.setInt(2, ti.getIdtipo());
            ps.executeUpdate();
            int filas = ps.executeUpdate();
            if (filas > 0) {
                con.close();
                JOptionPane.showMessageDialog(null, "ACTUALIZACIÓN EXITOSA","EXITO",JOptionPane.INFORMATION_MESSAGE);
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
        ti = (TipoArticulo) obj;
        String sql = "DELETE FROM TIPO_ARTICULO WHERE idtipo = ?;";
        Connection con;
        PreparedStatement ps;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, ti.getIdtipo());
            ps.executeUpdate();
            int filas = ps.executeUpdate();
            if (filas == 0) {
                con.close();
                JOptionPane.showMessageDialog(null, "ELIMINACIÓN EXITOSA","EXITO",JOptionPane.INFORMATION_MESSAGE);
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
        String sql = "select idtipo + 1 as proximo_cod_libre\n"
                + "  from (select 0 as idtipo\n"
                + "         union all\n"
                + "        select idtipo\n"
                + "          from TIPO_ARTICULO) t1\n"
                + " where not exists (select null\n"
                + "                     from TIPO_ARTICULO t2\n"
                + "                    where t2.idtipo = t1.idtipo + 1)\n"
                + " order by idtipo\n"
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
        String sql = "SELECT * FROM TIPO_ARTICULO WHERE CONCAT(descripcion, idtipo) LIKE ? ORDER BY descripcion;";
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

}