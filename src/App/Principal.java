/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package App;

import Vistas.JFrmImpuesto;
import Vistas.JFrmLinea;
import Vistas.JFrmMarca;
import Vistas.JFrmPais;
import Vistas.JFrmSeccion;
import Vistas.JFrmTipoItem;
import com.formdev.flatlaf.FlatLightLaf;
import java.awt.Dimension;
import java.beans.PropertyVetoException;
import javax.swing.JOptionPane;

/**
 *
 * @author armando
 */
public class Principal extends javax.swing.JFrame {

    /**
     * Creates new form Principal
     */
    public Principal() {
        FlatLightLaf.install();
        initComponents();
        setExtendedState(MAXIMIZED_BOTH);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        panelInterno = new javax.swing.JDesktopPane();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        jMenu2 = new javax.swing.JMenu();
        menuMantenimientoCompras = new javax.swing.JMenu();
        itemMarca = new javax.swing.JMenuItem();
        itemLinea = new javax.swing.JMenuItem();
        itemSeccion = new javax.swing.JMenuItem();
        itemTipoItem = new javax.swing.JMenuItem();
        itemImpuesto = new javax.swing.JMenuItem();
        itemPais = new javax.swing.JMenuItem();
        jMenu3 = new javax.swing.JMenu();
        jMenu4 = new javax.swing.JMenu();
        jMenu5 = new javax.swing.JMenu();
        jMenu6 = new javax.swing.JMenu();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setBackground(new java.awt.Color(255, 255, 255));
        jLabel1.setFont(new java.awt.Font("SansSerif", 0, 11)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Arandu Systems - 2021. Desarrollado por Armando Ariel Peralta Martinez. Contacto: +595 975489075");
        jLabel1.setOpaque(true);

        javax.swing.GroupLayout panelInternoLayout = new javax.swing.GroupLayout(panelInterno);
        panelInterno.setLayout(panelInternoLayout);
        panelInternoLayout.setHorizontalGroup(
            panelInternoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );
        panelInternoLayout.setVerticalGroup(
            panelInternoLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 364, Short.MAX_VALUE)
        );

        jMenuBar1.setFont(new java.awt.Font("Calibri", 0, 12)); // NOI18N

        jMenu1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/icons8_switch_host_32px.png"))); // NOI18N
        jMenu1.setText("Principal");
        jMenu1.setFont(new java.awt.Font("SansSerif", 0, 20)); // NOI18N
        jMenuBar1.add(jMenu1);

        jMenu2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/icons8_open_box_32px.png"))); // NOI18N
        jMenu2.setText("Compras");
        jMenu2.setFont(new java.awt.Font("SansSerif", 0, 20)); // NOI18N

        menuMantenimientoCompras.setText("Mantenimientos");
        menuMantenimientoCompras.setFont(new java.awt.Font("SansSerif", 0, 14)); // NOI18N

        itemMarca.setFont(new java.awt.Font("SansSerif", 0, 14)); // NOI18N
        itemMarca.setText("Mantenimiento de Marcas");
        itemMarca.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                itemMarcaActionPerformed(evt);
            }
        });
        menuMantenimientoCompras.add(itemMarca);

        itemLinea.setFont(new java.awt.Font("SansSerif", 0, 14)); // NOI18N
        itemLinea.setText("Mantenimiento de Líneas");
        itemLinea.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                itemLineaActionPerformed(evt);
            }
        });
        menuMantenimientoCompras.add(itemLinea);

        itemSeccion.setFont(new java.awt.Font("SansSerif", 0, 14)); // NOI18N
        itemSeccion.setText("Mantenimiento de Secciones");
        itemSeccion.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                itemSeccionActionPerformed(evt);
            }
        });
        menuMantenimientoCompras.add(itemSeccion);

        itemTipoItem.setFont(new java.awt.Font("SansSerif", 0, 14)); // NOI18N
        itemTipoItem.setText("Mantenimiento de Tipos de Ìtems");
        itemTipoItem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                itemTipoItemActionPerformed(evt);
            }
        });
        menuMantenimientoCompras.add(itemTipoItem);

        itemImpuesto.setFont(new java.awt.Font("SansSerif", 0, 14)); // NOI18N
        itemImpuesto.setText("Mantenimiento de Impuestos");
        itemImpuesto.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                itemImpuestoActionPerformed(evt);
            }
        });
        menuMantenimientoCompras.add(itemImpuesto);

        itemPais.setFont(new java.awt.Font("SansSerif", 0, 14)); // NOI18N
        itemPais.setText("Mantenimiento de Países");
        itemPais.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                itemPaisActionPerformed(evt);
            }
        });
        menuMantenimientoCompras.add(itemPais);

        jMenu2.add(menuMantenimientoCompras);

        jMenuBar1.add(jMenu2);

        jMenu3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/icons8_money_bag_32px.png"))); // NOI18N
        jMenu3.setText("Ventas");
        jMenu3.setFont(new java.awt.Font("SansSerif", 0, 20)); // NOI18N
        jMenuBar1.add(jMenu3);

        jMenu4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/icons8_delivery_32px.png"))); // NOI18N
        jMenu4.setText("Producciónes");
        jMenu4.setFont(new java.awt.Font("SansSerif", 0, 20)); // NOI18N
        jMenuBar1.add(jMenu4);

        jMenu5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/icons8_cash_in_hand_32px.png"))); // NOI18N
        jMenu5.setText("Finanzas");
        jMenu5.setFont(new java.awt.Font("SansSerif", 0, 20)); // NOI18N
        jMenuBar1.add(jMenu5);

        jMenu6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/icons8_invoice_32px.png"))); // NOI18N
        jMenu6.setText("Informes");
        jMenu6.setFont(new java.awt.Font("SansSerif", 0, 20)); // NOI18N
        jMenuBar1.add(jMenu6);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, 878, Short.MAX_VALUE)
            .addComponent(panelInterno)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addComponent(panelInterno)
                .addGap(0, 0, 0)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void itemMarcaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_itemMarcaActionPerformed
        JFrmMarca fm = new JFrmMarca();
        panelInterno.add(fm);
        Dimension desktopSize = panelInterno.getSize();
        Dimension frameSize = fm.getSize();
        fm.setLocation((desktopSize.width - frameSize.width) / 2, (desktopSize.height - frameSize.height) / 2);
        try {
            fm.setSelected(true);
        } catch (PropertyVetoException e) {
            JOptionPane.showMessageDialog(null, "ERROR AL ABRIR EL FORMULARIO: " + fm.getTitle(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        fm.show();
    }//GEN-LAST:event_itemMarcaActionPerformed

    private void itemLineaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_itemLineaActionPerformed
        JFrmLinea fm = new JFrmLinea();
        panelInterno.add(fm);
        Dimension desktopSize = panelInterno.getSize();
        Dimension frameSize = fm.getSize();
        fm.setLocation((desktopSize.width - frameSize.width) / 2, (desktopSize.height - frameSize.height) / 2);
        try {
            fm.setSelected(true);
        } catch (PropertyVetoException e) {
            JOptionPane.showMessageDialog(null, "ERROR AL ABRIR EL FORMULARIO: " + fm.getTitle(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        fm.show();
    }//GEN-LAST:event_itemLineaActionPerformed

    private void itemSeccionActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_itemSeccionActionPerformed
        JFrmSeccion fm = new JFrmSeccion();
        panelInterno.add(fm);
        Dimension desktopSize = panelInterno.getSize();
        Dimension frameSize = fm.getSize();
        fm.setLocation((desktopSize.width - frameSize.width) / 2, (desktopSize.height - frameSize.height) / 2);
        try {
            fm.setSelected(true);
        } catch (PropertyVetoException e) {
            JOptionPane.showMessageDialog(null, "ERROR AL ABRIR EL FORMULARIO: " + fm.getTitle(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        fm.show();
    }//GEN-LAST:event_itemSeccionActionPerformed

    private void itemTipoItemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_itemTipoItemActionPerformed
        JFrmTipoItem fm = new JFrmTipoItem();
        panelInterno.add(fm);
        Dimension desktopSize = panelInterno.getSize();
        Dimension frameSize = fm.getSize();
        fm.setLocation((desktopSize.width - frameSize.width) / 2, (desktopSize.height - frameSize.height) / 2);
        try {
            fm.setSelected(true);
        } catch (PropertyVetoException e) {
            JOptionPane.showMessageDialog(null, "ERROR AL ABRIR EL FORMULARIO: " + fm.getTitle(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        fm.show();
    }//GEN-LAST:event_itemTipoItemActionPerformed

    private void itemImpuestoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_itemImpuestoActionPerformed
        JFrmImpuesto fm = new JFrmImpuesto();
        panelInterno.add(fm);
        Dimension desktopSize = panelInterno.getSize();
        Dimension frameSize = fm.getSize();
        fm.setLocation((desktopSize.width - frameSize.width) / 2, (desktopSize.height - frameSize.height) / 2);
        try {
            fm.setSelected(true);
        } catch (PropertyVetoException e) {
            JOptionPane.showMessageDialog(null, "ERROR AL ABRIR EL FORMULARIO: " + fm.getTitle(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        fm.show();
    }//GEN-LAST:event_itemImpuestoActionPerformed

    private void itemPaisActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_itemPaisActionPerformed
        JFrmPais fm = new JFrmPais();
        panelInterno.add(fm);
        Dimension desktopSize = panelInterno.getSize();
        Dimension frameSize = fm.getSize();
        fm.setLocation((desktopSize.width - frameSize.width) / 2, (desktopSize.height - frameSize.height) / 2);
        try {
            fm.setSelected(true);
        } catch (PropertyVetoException e) {
            JOptionPane.showMessageDialog(null, "ERROR AL ABRIR EL FORMULARIO: " + fm.getTitle(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        fm.show();
    }//GEN-LAST:event_itemPaisActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Principal().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JMenuItem itemImpuesto;
    private javax.swing.JMenuItem itemLinea;
    private javax.swing.JMenuItem itemMarca;
    private javax.swing.JMenuItem itemPais;
    private javax.swing.JMenuItem itemSeccion;
    private javax.swing.JMenuItem itemTipoItem;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenu jMenu3;
    private javax.swing.JMenu jMenu4;
    private javax.swing.JMenu jMenu5;
    private javax.swing.JMenu jMenu6;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenu menuMantenimientoCompras;
    private javax.swing.JDesktopPane panelInterno;
    // End of variables declaration//GEN-END:variables
}