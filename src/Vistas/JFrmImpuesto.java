package Vistas;

import Dao.DAOImpuesto;
import Modelos.Impuesto;
import java.text.DecimalFormat;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author armando
 */
public class JFrmImpuesto extends javax.swing.JInternalFrame {

    Impuesto i = new Impuesto();
    DAOImpuesto dao = new DAOImpuesto();
    ArrayList<Object[]> datos = new ArrayList<>();
    Double valorMonto = 0.0;

    //VARIABLE QUE MANEJA QUE TIPOS DE OPERACIONES SE REALIZARAN: SI VA A SER ALTA, BAJA O MODIFICACION DEL REGISTRO
    String operacion = "";

    /**
     * Creates new form JFrmImpuesto
     */
    public JFrmImpuesto() {
        setTitle("JFrmImpuesto");
        initComponents();
        cargar();
    }

    public void cargar() {
        DefaultTableModel modelo = (DefaultTableModel) tablaDatos.getModel();
        modelo.setRowCount(0);
        datos = dao.consultar(txtCriterio.getText());
        for (Object[] obj : datos) {
            modelo.addRow(obj);
        }
        this.tablaDatos.setModel(modelo);
    }

    public void habilitarCampos(String accion) {
        switch (accion) {
            case "NUEVO":
                //CAMPOS
                txtCodigo.setEnabled(false);
                txtDescripcion.setEnabled(true);
                txtPorcentaje.setEnabled(true);
                //BOTONES
                btnNuevo.setEnabled(false);
                btnConfirmar.setEnabled(true);
                btnCancelar.setEnabled(true);
                //REDIRECIONAMOS
                txtDescripcion.grabFocus();
                break;
            case "MODIFICAR":
                //CAMPOS
                txtCodigo.setEnabled(false);
                txtDescripcion.setEnabled(true);
                txtPorcentaje.setEnabled(true);
                //BOTONES
                btnNuevo.setEnabled(false);
                btnConfirmar.setEnabled(true);
                btnCancelar.setEnabled(true);
                //REDIRECIONAMOS
                pestanha.setSelectedIndex(1);
                txtDescripcion.grabFocus();
                break;
            case "ELIMINAR":
                //CAMPOS
                txtCodigo.setEnabled(false);
                txtDescripcion.setEnabled(false);
                txtPorcentaje.setEnabled(false);
                //BOTONES
                btnNuevo.setEnabled(false);
                btnConfirmar.setEnabled(true);
                btnCancelar.setEnabled(true);
                //REDIRECIONAMOS
                pestanha.setSelectedIndex(1);
                btnConfirmar.grabFocus();
                break;
            case "CANCELAR":
                //CAMPOS
                txtCodigo.setEnabled(false);
                txtDescripcion.setEnabled(false);
                txtPorcentaje.setEnabled(false);
                //BOTONES
                btnNuevo.setEnabled(true);
                btnConfirmar.setEnabled(false);
                btnCancelar.setEnabled(false);
                //REDIRECIONAMOS
                pestanha.setSelectedIndex(0);
                txtCriterio.grabFocus();
                break;
            case "GUARDAR":
                //CAMPOS
                txtCodigo.setEnabled(false);
                txtDescripcion.setEnabled(false);
                txtPorcentaje.setEnabled(false);
                //BOTONES
                btnNuevo.setEnabled(true);
                btnConfirmar.setEnabled(false);
                btnCancelar.setEnabled(false);
                //REDIRECIONAMOS
                btnNuevo.grabFocus();
                break;
            default:
                JOptionPane.showMessageDialog(null, "HA OCURRIDO UN ERROR EN LA HABILITACI??N DE LOS CAMPOS. AVISE AL ADMINISTRADOR", "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void limpiarCampos() {
        txtCriterio.setText(null);
        txtCodigo.setText(null);
        txtDescripcion.setText(null);
        txtPorcentaje.setText(null);
        operacion = "";
        valorMonto = 0.0;
    }

    public void guardar(String accion) {
        //CAPTURA Y VALIDACIONES DE LOS DATOS RECIBIDOS
        String error = "";
        int id = 0;
        if (accion.equals("NUEVO")) {
            id = dao.nuevoID();
        } else {
            if (txtCodigo.getText().isEmpty()) {
                id = 0;
            } else {
                id = Integer.parseInt(txtCodigo.getText());
            }
        }
        String descripcion = txtDescripcion.getText();
        Double porcentaje = valorMonto;
        switch (accion) {
            case "NUEVO":
                if (descripcion.isEmpty()) {
                    error += "NO PUEDE DEJAR EL CAMPO DE DESCRIPCI??N VACIO.\n";
                }
                if (porcentaje == null) {
                    error += "NO HA CARGADO EL PORCENTAJE.\n";
                } else {
                    if (porcentaje < 0) {
                        error += "EL PORCENTAJE NO PUEDE SER MENOR A 0.\n";
                    }
                }
                if (error.isEmpty()) {
                    i.setIdimpuesto(id);
                    i.setDescripcion(descripcion);
                    i.setPorcentaje(porcentaje);
                    dao.agregar(i);
                    cargar();
                } else {
                    JOptionPane.showMessageDialog(null, error, "ERRORES", JOptionPane.ERROR_MESSAGE);
                }
                break;
            case "MODIFICAR":
                if (descripcion.isEmpty()) {
                    error += "NO PUEDE DEJAR EL CAMPO DE DESCRIPCI??N VACIO.\n";
                }
                if (porcentaje == null) {
                    error += "NO HA CARGADO EL PORCENTAJE.\n";
                } else {
                    if (porcentaje < 0) {
                        error += "EL PORCENTAJE NO PUEDE SER MENOR A 0.\n";
                    }
                }
                if (error.isEmpty()) {
                    i.setIdimpuesto(id);
                    i.setDescripcion(descripcion);
                    i.setPorcentaje(porcentaje);
                    dao.modificar(i);
                    cargar();
                } else {
                    JOptionPane.showMessageDialog(null, error, "ERRORES", JOptionPane.ERROR_MESSAGE);
                }
                break;
            case "ELIMINAR":
                if (error.isEmpty()) {
                    i.setIdimpuesto(id);
                    dao.eliminar(i);
                    cargar();
                }
                break;
            default:
                JOptionPane.showMessageDialog(null, "HA OCURRIDO UN ERROR EN LA OPERACION PARA LA BASE DE DATOS. AVISE AL ADMINISTRADOR", "ERROR", JOptionPane.ERROR_MESSAGE);
        }

    }

    public void recuperarDatos() {
        int fila = tablaDatos.getSelectedRow();
        if (fila >= 0) {
            String id = tablaDatos.getValueAt(fila, 0).toString();
            String descripcion = tablaDatos.getValueAt(fila, 1).toString();
            Double porcentaje = Double.parseDouble(tablaDatos.getValueAt(fila, 2).toString());
            txtCodigo.setText(id);
            txtDescripcion.setText(descripcion);
            valorMonto = porcentaje;
            DecimalFormat formateador = new DecimalFormat("#,###.00");
            txtPorcentaje.setText(formateador.format(valorMonto).replace(".", "").replace(",", "."));
            habilitarCampos(operacion);
        } else {
            JOptionPane.showMessageDialog(null, "SELECCIONE UNA FILA", "ADVERTENCIA", JOptionPane.ERROR_MESSAGE);
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        menuDesplegable = new javax.swing.JPopupMenu();
        Modificar = new javax.swing.JMenuItem();
        Eliminar = new javax.swing.JMenuItem();
        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        pestanha = new javax.swing.JTabbedPane();
        pestanhaLista = new javax.swing.JPanel();
        txtCriterio = new org.jdesktop.swingx.JXTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        tablaDatos = new javax.swing.JTable();
        pestanhaABM = new javax.swing.JPanel();
        txtDescripcion = new org.jdesktop.swingx.JXTextField();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        txtCodigo = new org.jdesktop.swingx.JXTextField();
        btnCancelar = new javax.swing.JButton();
        btnConfirmar = new javax.swing.JButton();
        btnNuevo = new javax.swing.JButton();
        jLabel4 = new javax.swing.JLabel();
        txtPorcentaje = new org.jdesktop.swingx.JXTextField();

        Modificar.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        Modificar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/icons8_edit_file_16px.png"))); // NOI18N
        Modificar.setText("Modificar");
        Modificar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ModificarActionPerformed(evt);
            }
        });
        menuDesplegable.add(Modificar);

        Eliminar.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        Eliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/icons8_delete_file_16px.png"))); // NOI18N
        Eliminar.setText("Eliminar");
        Eliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                EliminarActionPerformed(evt);
            }
        });
        menuDesplegable.add(Eliminar);

        setClosable(true);
        setIconifiable(true);

        jPanel1.setBackground(new java.awt.Color(50, 104, 151));

        jLabel1.setFont(new java.awt.Font("SansSerif", 0, 14)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("Mantenimiento de Impuestos");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel2.setBackground(new java.awt.Color(255, 255, 255));

        pestanha.setBackground(new java.awt.Color(255, 255, 255));
        pestanha.setFont(new java.awt.Font("SansSerif", 0, 11)); // NOI18N
        pestanha.setOpaque(true);

        pestanhaLista.setBackground(new java.awt.Color(255, 255, 255));

        txtCriterio.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        txtCriterio.setPrompt("Aqui puede ingresar los filtros para la busqueda..");
        txtCriterio.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtCriterioActionPerformed(evt);
            }
        });
        txtCriterio.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtCriterioKeyTyped(evt);
            }
        });

        tablaDatos.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        tablaDatos.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "<html><p style=\"text-align:center\"><span style=\"color:#000066\"><span style=\"font-family:SansSerif\"><span style=\"font-size:10px\">C??digo</span></span></span></p></html> ", "<html><p style=\"text-align:right\"><span style=\"color:#000066\"><span style=\"font-family:SansSerif\"><span style=\"font-size:10px\">Descripci??n</span></span></span></p></html> ", "<html><p style=\"text-align:right\"><span style=\"color:#000066\"><span style=\"font-family:SansSerif\"><span style=\"font-size:10px\">%</span></span></span></p></html> "
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.Double.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tablaDatos.setComponentPopupMenu(menuDesplegable);
        jScrollPane1.setViewportView(tablaDatos);
        if (tablaDatos.getColumnModel().getColumnCount() > 0) {
            tablaDatos.getColumnModel().getColumn(0).setMinWidth(60);
            tablaDatos.getColumnModel().getColumn(0).setPreferredWidth(60);
            tablaDatos.getColumnModel().getColumn(0).setMaxWidth(60);
            tablaDatos.getColumnModel().getColumn(2).setMinWidth(50);
            tablaDatos.getColumnModel().getColumn(2).setPreferredWidth(50);
            tablaDatos.getColumnModel().getColumn(2).setMaxWidth(50);
        }

        javax.swing.GroupLayout pestanhaListaLayout = new javax.swing.GroupLayout(pestanhaLista);
        pestanhaLista.setLayout(pestanhaListaLayout);
        pestanhaListaLayout.setHorizontalGroup(
            pestanhaListaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pestanhaListaLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(pestanhaListaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(txtCriterio, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 571, Short.MAX_VALUE))
                .addContainerGap())
        );
        pestanhaListaLayout.setVerticalGroup(
            pestanhaListaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pestanhaListaLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(txtCriterio, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 228, Short.MAX_VALUE)
                .addContainerGap())
        );

        pestanha.addTab("Listado", pestanhaLista);

        pestanhaABM.setBackground(new java.awt.Color(255, 255, 255));

        txtDescripcion.setEnabled(false);
        txtDescripcion.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        txtDescripcion.setPrompt("Nombre o descripci??n...");
        txtDescripcion.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtDescripcionActionPerformed(evt);
            }
        });
        txtDescripcion.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtDescripcionKeyTyped(evt);
            }
        });

        jLabel2.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        jLabel2.setText("C??digo:");

        jLabel3.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        jLabel3.setText("Descripci??n:");

        txtCodigo.setEnabled(false);
        txtCodigo.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        txtCodigo.setPrompt("C??digo interno...");

        btnCancelar.setBackground(new java.awt.Color(255, 204, 204));
        btnCancelar.setFont(new java.awt.Font("SansSerif", 0, 11)); // NOI18N
        btnCancelar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/icons8_cancel_16px.png"))); // NOI18N
        btnCancelar.setText("Cancelar");
        btnCancelar.setEnabled(false);
        btnCancelar.setOpaque(false);
        btnCancelar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCancelarActionPerformed(evt);
            }
        });

        btnConfirmar.setBackground(new java.awt.Color(204, 255, 255));
        btnConfirmar.setFont(new java.awt.Font("SansSerif", 0, 11)); // NOI18N
        btnConfirmar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/icons8_checked_16px_1.png"))); // NOI18N
        btnConfirmar.setText("Confirmar");
        btnConfirmar.setEnabled(false);
        btnConfirmar.setOpaque(false);
        btnConfirmar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnConfirmarActionPerformed(evt);
            }
        });

        btnNuevo.setBackground(new java.awt.Color(197, 255, 226));
        btnNuevo.setFont(new java.awt.Font("SansSerif", 0, 11)); // NOI18N
        btnNuevo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/icons8_add_16px.png"))); // NOI18N
        btnNuevo.setText("Nuevo");
        btnNuevo.setOpaque(false);
        btnNuevo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnNuevoActionPerformed(evt);
            }
        });

        jLabel4.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        jLabel4.setText("%:");

        txtPorcentaje.setEnabled(false);
        txtPorcentaje.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        txtPorcentaje.setPrompt("Porcentaje del iva...");
        txtPorcentaje.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtPorcentajeActionPerformed(evt);
            }
        });
        txtPorcentaje.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtPorcentajeKeyTyped(evt);
            }
        });

        javax.swing.GroupLayout pestanhaABMLayout = new javax.swing.GroupLayout(pestanhaABM);
        pestanhaABM.setLayout(pestanhaABMLayout);
        pestanhaABMLayout.setHorizontalGroup(
            pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pestanhaABMLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(pestanhaABMLayout.createSequentialGroup()
                        .addGap(0, 262, Short.MAX_VALUE)
                        .addComponent(btnNuevo, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnConfirmar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnCancelar, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap())
                    .addGroup(pestanhaABMLayout.createSequentialGroup()
                        .addGroup(pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(jLabel4, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jLabel2, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jLabel3, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addGap(18, 18, 18)
                        .addGroup(pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(pestanhaABMLayout.createSequentialGroup()
                                .addComponent(txtCodigo, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(0, 0, Short.MAX_VALUE))
                            .addGroup(pestanhaABMLayout.createSequentialGroup()
                                .addGroup(pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(txtDescripcion, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addGroup(pestanhaABMLayout.createSequentialGroup()
                                        .addComponent(txtPorcentaje, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(0, 0, Short.MAX_VALUE)))
                                .addContainerGap())))))
        );
        pestanhaABMLayout.setVerticalGroup(
            pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, pestanhaABMLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(txtCodigo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(txtDescripcion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(txtPorcentaje, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 143, Short.MAX_VALUE)
                .addGroup(pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnCancelar, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnConfirmar, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnNuevo, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        pestanha.addTab("Operaci??nes", pestanhaABM);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(pestanha)
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(pestanha)
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, 0)
                .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(0, 0, 0))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txtCriterioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtCriterioActionPerformed
        cargar();
    }//GEN-LAST:event_txtCriterioActionPerformed

    private void txtCriterioKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtCriterioKeyTyped
        char c = evt.getKeyChar();
        if (Character.isLowerCase(c)) {
            evt.setKeyChar(Character.toUpperCase(c));
        }
        if (txtCriterio.getText().length() == 100) {
            evt.consume();
        }
    }//GEN-LAST:event_txtCriterioKeyTyped

    private void txtDescripcionKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtDescripcionKeyTyped
        char c = evt.getKeyChar();
        if (Character.isLowerCase(c)) {
            evt.setKeyChar(Character.toUpperCase(c));
        }
        if (txtDescripcion.getText().length() == 100) {
            evt.consume();
        }
    }//GEN-LAST:event_txtDescripcionKeyTyped

    private void txtDescripcionActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtDescripcionActionPerformed
        if (txtDescripcion.getText().isEmpty()) {
            JOptionPane.showMessageDialog(null, "NO PUEDE DEJAR EL CAMPO VACIO", "ADVERTENCIA", JOptionPane.WARNING_MESSAGE);
        } else {
            txtPorcentaje.grabFocus();
        }
    }//GEN-LAST:event_txtDescripcionActionPerformed

    private void btnNuevoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnNuevoActionPerformed
        limpiarCampos();
        operacion = "NUEVO";
        habilitarCampos(operacion);
    }//GEN-LAST:event_btnNuevoActionPerformed

    private void btnCancelarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCancelarActionPerformed
        operacion = "CANCELAR";
        habilitarCampos(operacion);
        limpiarCampos();
    }//GEN-LAST:event_btnCancelarActionPerformed

    private void btnConfirmarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnConfirmarActionPerformed
        int res = JOptionPane.showConfirmDialog(null, "??ESTA SEGURO DE CONFIRMAR LOS CAMBIOS?", "ADVERTENCIA", JOptionPane.YES_NO_OPTION);
        if (res != 1) {
            guardar(operacion);
            habilitarCampos("GUARDAR");
            limpiarCampos();
        }
    }//GEN-LAST:event_btnConfirmarActionPerformed

    private void ModificarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ModificarActionPerformed
        operacion = "MODIFICAR";
        recuperarDatos();
    }//GEN-LAST:event_ModificarActionPerformed

    private void EliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_EliminarActionPerformed
        operacion = "ELIMINAR";
        recuperarDatos();
    }//GEN-LAST:event_EliminarActionPerformed

    private void txtPorcentajeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtPorcentajeActionPerformed
        if (txtPorcentaje.getText().isEmpty()) {
            JOptionPane.showMessageDialog(null, "NO PUEDE DEJAR EL CAMPO DE PORCENTAJE VACIO","ADVERTENCIA",JOptionPane.WARNING_MESSAGE);
        } else {
            String number = txtPorcentaje.getText();
            double monto = Double.parseDouble(number);
            if (monto < 0.0) {
                JOptionPane.showMessageDialog(null, "EL PORCENTAJE NO PUEDE SER MENOR A 0","ADVERTENCIA",JOptionPane.WARNING_MESSAGE);
            } else {
                valorMonto = monto;
                DecimalFormat formateador = new DecimalFormat("#,###.00");
                txtPorcentaje.setText(formateador.format(valorMonto));
                btnConfirmar.grabFocus();
            }
        }
    }//GEN-LAST:event_txtPorcentajeActionPerformed

    private void txtPorcentajeKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtPorcentajeKeyTyped
        char c = evt.getKeyChar();
        if (Character.isLetter(c)) {
            getToolkit().beep();
            evt.consume();
        }
        if (c == ',') {
            evt.consume();
        }
        if (txtPorcentaje.getText().length() == 10) {
            evt.consume();
        }
    }//GEN-LAST:event_txtPorcentajeKeyTyped


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JMenuItem Eliminar;
    private javax.swing.JMenuItem Modificar;
    private javax.swing.JButton btnCancelar;
    private javax.swing.JButton btnConfirmar;
    private javax.swing.JButton btnNuevo;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JPopupMenu menuDesplegable;
    private javax.swing.JTabbedPane pestanha;
    private javax.swing.JPanel pestanhaABM;
    private javax.swing.JPanel pestanhaLista;
    private javax.swing.JTable tablaDatos;
    private org.jdesktop.swingx.JXTextField txtCodigo;
    private org.jdesktop.swingx.JXTextField txtCriterio;
    private org.jdesktop.swingx.JXTextField txtDescripcion;
    private org.jdesktop.swingx.JXTextField txtPorcentaje;
    // End of variables declaration//GEN-END:variables
}
