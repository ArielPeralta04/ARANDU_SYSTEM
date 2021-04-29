package Controladores;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;

public class combo {

    public static void cargarDatos(JComboBox cbo, String sql, Statement db) {
        try {
            ResultSet query = db.executeQuery(sql);
            while (query.next()) {
                ItemCombo item = new ItemCombo(
                        query.getInt(1), query.getString(2));
                cbo.addItem(item);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error al cargar Combos" + ex.getMessage());
        }
    }

    public static int obtenerIdSeleccionado(JComboBox cbo) {
        int idSeleccionado;
        try {
            ItemCombo itemSeleccionado = (ItemCombo) cbo.getSelectedItem();
            idSeleccionado = itemSeleccionado.getId();
        } catch (Exception e) {
            idSeleccionado = 0;
        }
        return idSeleccionado;
    }

    public static void seleccionarId(JComboBox cbo, int id) {
        for (int i = 0; i < cbo.getItemCount(); i++) {
            ItemCombo item = (ItemCombo) cbo.getItemAt(i);
            int xid = item.getId();
            if (xid == id) {
                cbo.setSelectedIndex(i);
                break;
            }
        }
    }
}
