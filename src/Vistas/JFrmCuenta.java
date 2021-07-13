package Vistas;

import Dao.DAOBanco;
import Dao.DAOCuenta;
import Dao.DAOMoneda;
import Modelos.Banco;
import Modelos.Cuenta;
import Modelos.Moneda;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author armando
 */
public class JFrmCuenta extends javax.swing.JInternalFrame {

    Cuenta c = new Cuenta();
    Banco b = new Banco();
    Moneda m = new Moneda();

    DAOCuenta dao = new DAOCuenta();
    DAOBanco daoBanco = new DAOBanco();
    DAOMoneda daoMoneda = new DAOMoneda();

    ArrayList<Object[]> datos = new ArrayList<>();
    ArrayList<Object[]> datosBanco = new ArrayList<>();
    ArrayList<Object[]> datosMoneda = new ArrayList<>();

    //VARIABLE QUE MANEJA QUE TIPOS DE OPERACIONES SE REALIZARAN: SI VA A SER ALTA, BAJA O MODIFICACION DEL REGISTRO
    String operacion = "";

    /**
     * Creates new form JFrmCuenta
     */
    public JFrmCuenta() {
        setTitle("JFrmCuenta");
        initComponents();
        cargar();
    }

    public void cargar() {
        DefaultTableModel modelo = (DefaultTableModel) tablaDatos.getModel();
        modelo.setRowCount(0);
        datos = dao.consultarDescripcion(txtCriterio.getText());
        for (Object[] obj : datos) {
            modelo.addRow(obj);
        }
        this.tablaDatos.setModel(modelo);
    }

    public void cargarBanco() {
        DefaultTableModel modelo = (DefaultTableModel) tablaDatosBanco.getModel();
        modelo.setRowCount(0);
        datosBanco = daoBanco.consultar(txtCriterioBanco.getText());
        for (Object[] obj : datosBanco) {
            modelo.addRow(obj);
        }
        this.tablaDatosBanco.setModel(modelo);
    }

    public void cargarMoneda() {
        DefaultTableModel modelo = (DefaultTableModel) tablaDatosMonedas.getModel();
        modelo.setRowCount(0);
        datosMoneda = daoMoneda.consultar(txtCriterioMoneda.getText());
        for (Object[] obj : datosMoneda) {
            modelo.addRow(obj);
        }
        this.tablaDatosMonedas.setModel(modelo);
    }

    public void habilitarCampos(String accion) {
        switch (accion) {
            case "NUEVO":
                //CAMPOS
                txtCodigo.setEnabled(false);
                txtDescripcion.setEnabled(true);
                txtCodigoBanco.setEnabled(true);
                txtCodigoMoneda.setEnabled(true);
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
                txtCodigoBanco.setEnabled(true);
                txtCodigoMoneda.setEnabled(true);
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
                txtCodigoBanco.setEnabled(false);
                txtCodigoMoneda.setEnabled(false);
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
                txtCodigoBanco.setEnabled(false);
                txtCodigoMoneda.setEnabled(false);
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
                txtCodigoBanco.setEnabled(false);
                txtCodigoMoneda.setEnabled(false);
                //BOTONES
                btnNuevo.setEnabled(true);
                btnConfirmar.setEnabled(false);
                btnCancelar.setEnabled(false);
                //REDIRECIONAMOS
                btnNuevo.grabFocus();
                break;
            default:
                JOptionPane.showMessageDialog(null, "HA OCURRIDO UN ERROR EN LA HABILITACIÓN DE LOS CAMPOS. AVISE AL ADMINISTRADOR", "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void limpiarCampos() {
        txtCriterio.setText(null);
        txtCriterioBanco.setText(null);
        txtCodigo.setText(null);
        txtDescripcion.setText(null);
        txtCodigoBanco.setText(null);
        txtDescripcionPais.setText(null);
        txtCodigoMoneda.setText(null);
        txtDescripcionMoneda.setText(null);
        operacion = "";
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
        int codigoBanco = Integer.parseInt(txtCodigoBanco.getText());
        int codigoMoneda = Integer.parseInt(txtCodigoMoneda.getText());
        switch (accion) {
            case "NUEVO":
                if (descripcion.isEmpty()) {
                    error += "NO PUEDE DEJAR EL CAMPO DE DESCRIPCIÓN VACIO.\n";
                }
                if (codigoBanco == 0) {
                    error += "NO HA SELECCIONADO UN BANCO.\n";
                }
                if (codigoMoneda == 0) {
                    error += "NO HA SELECCIONADO UNA MONEDA.\n";
                }

                if (error.isEmpty()) {
                    c.setIdcuenta(id);
                    c.setDescripcion(descripcion);
                    c.setIdbanco(codigoBanco);
                    c.setIdmoneda(codigoMoneda);
                    dao.agregar(c);
                    cargar();
                } else {
                    JOptionPane.showMessageDialog(null, error, "ERRORES", JOptionPane.ERROR_MESSAGE);
                }
                break;
            case "MODIFICAR":
                if (descripcion.isEmpty()) {
                    error += "NO PUEDE DEJAR EL CAMPO DE DESCRIPCIÓN VACIO.\n";
                }
                if (codigoBanco == 0) {
                    error += "NO HA SELECCIONADO UN BANCO.\n";
                }
                if (codigoMoneda == 0) {
                    error += "NO HA SELECCIONADO UNA MONEDA.\n";
                }
                if (error.isEmpty()) {
                    c.setDescripcion(descripcion);
                    c.setIdbanco(codigoBanco);
                    c.setIdmoneda(codigoMoneda);
                    c.setIdcuenta(id);
                    dao.modificar(c);
                    cargar();
                } else {
                    JOptionPane.showMessageDialog(null, error, "ERRORES", JOptionPane.ERROR_MESSAGE);
                }
                break;
            case "ELIMINAR":
                if (error.isEmpty()) {
                    c.setIdcuenta(id);
                    dao.eliminar(c);
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
            String idbanco = tablaDatos.getValueAt(fila, 2).toString();
            String banco = tablaDatos.getValueAt(fila, 3).toString();
            String idmoneda = tablaDatos.getValueAt(fila, 4).toString();
            String moneda = tablaDatos.getValueAt(fila, 5).toString();
            txtCodigo.setText(id);
            txtDescripcion.setText(descripcion);
            txtCodigoBanco.setText(idbanco);
            txtDescripcionPais.setText(banco);
            txtCodigoMoneda.setText(idmoneda);
            txtDescripcionMoneda.setText(moneda);
            habilitarCampos(operacion);
        } else {
            JOptionPane.showMessageDialog(null, "SELECCIONE UNA FILA", "ADVERTENCIA", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void buscarBanco() {
        cargarBanco();
        BuscadorPais.setModal(true);
        BuscadorPais.setSize(540, 285);
        BuscadorPais.setLocationRelativeTo(this);
        BuscadorPais.setVisible(true);
        int fila = tablaDatosBanco.getSelectedRow();
        if (fila >= 0) {
            txtCodigoBanco.setText(tablaDatosBanco.getValueAt(fila, 0).toString());
            txtDescripcionPais.setText(tablaDatosBanco.getValueAt(fila, 1).toString());
        } else {
            txtCodigoBanco.setText(null);
            txtDescripcionPais.setText(null);
        }
    }

    private void buscarMoneda() {
        cargarMoneda();
        BuscadorMoneda.setModal(true);
        BuscadorMoneda.setSize(540, 285);
        BuscadorMoneda.setLocationRelativeTo(this);
        BuscadorMoneda.setVisible(true);
        int fila = tablaDatosMonedas.getSelectedRow();
        if (fila >= 0) {
            txtCodigoMoneda.setText(tablaDatosMonedas.getValueAt(fila, 0).toString());
            txtDescripcionMoneda.setText(tablaDatosMonedas.getValueAt(fila, 1).toString());
        } else {
            txtCodigoMoneda.setText(null);
            txtDescripcionMoneda.setText(null);
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
        BuscadorPais = new javax.swing.JDialog();
        jPanel3 = new javax.swing.JPanel();
        jLabel5 = new javax.swing.JLabel();
        txtCriterioBanco = new org.jdesktop.swingx.JXTextField();
        jScrollPane2 = new javax.swing.JScrollPane();
        tablaDatosBanco = new javax.swing.JTable();
        BuscadorMoneda = new javax.swing.JDialog();
        jPanel4 = new javax.swing.JPanel();
        jLabel7 = new javax.swing.JLabel();
        txtCriterioMoneda = new org.jdesktop.swingx.JXTextField();
        jScrollPane3 = new javax.swing.JScrollPane();
        tablaDatosMonedas = new javax.swing.JTable();
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
        txtCodigoBanco = new org.jdesktop.swingx.JXTextField();
        txtDescripcionPais = new org.jdesktop.swingx.JXTextField();
        jLabel6 = new javax.swing.JLabel();
        txtCodigoMoneda = new org.jdesktop.swingx.JXTextField();
        txtDescripcionMoneda = new org.jdesktop.swingx.JXTextField();

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

        jPanel3.setBackground(new java.awt.Color(255, 255, 255));

        jLabel5.setBackground(new java.awt.Color(50, 104, 151));
        jLabel5.setFont(new java.awt.Font("SansSerif", 1, 12)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(255, 255, 255));
        jLabel5.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel5.setText("BUSCADOR DE BANCOS");
        jLabel5.setOpaque(true);

        txtCriterioBanco.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        txtCriterioBanco.setPrompt("Aqui puede ingresar los filtros para la busqueda..");
        txtCriterioBanco.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtCriterioBancoActionPerformed(evt);
            }
        });
        txtCriterioBanco.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txtCriterioBancoKeyPressed(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtCriterioBancoKeyTyped(evt);
            }
        });

        tablaDatosBanco.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        tablaDatosBanco.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "<html><p style=\"text-align:center\"><span style=\"color:#000066\"><span style=\"font-family:SansSerif\"><span style=\"font-size:10px\">Código</span></span></span></p></html> ", "<html><p style=\"text-align:right\"><span style=\"color:#000066\"><span style=\"font-family:SansSerif\"><span style=\"font-size:10px\">Descripción</span></span></span></p></html> "
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tablaDatosBanco.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tablaDatosBancoMouseClicked(evt);
            }
        });
        jScrollPane2.setViewportView(tablaDatosBanco);
        if (tablaDatosBanco.getColumnModel().getColumnCount() > 0) {
            tablaDatosBanco.getColumnModel().getColumn(0).setMinWidth(60);
            tablaDatosBanco.getColumnModel().getColumn(0).setPreferredWidth(60);
            tablaDatosBanco.getColumnModel().getColumn(0).setMaxWidth(60);
        }

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel5, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(txtCriterioBanco, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 511, Short.MAX_VALUE)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 511, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtCriterioBanco, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 180, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout BuscadorPaisLayout = new javax.swing.GroupLayout(BuscadorPais.getContentPane());
        BuscadorPais.getContentPane().setLayout(BuscadorPaisLayout);
        BuscadorPaisLayout.setHorizontalGroup(
            BuscadorPaisLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        BuscadorPaisLayout.setVerticalGroup(
            BuscadorPaisLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        jPanel4.setBackground(new java.awt.Color(255, 255, 255));

        jLabel7.setBackground(new java.awt.Color(50, 104, 151));
        jLabel7.setFont(new java.awt.Font("SansSerif", 1, 12)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(255, 255, 255));
        jLabel7.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel7.setText("BUSCADOR DE MONEDAS");
        jLabel7.setOpaque(true);

        txtCriterioMoneda.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        txtCriterioMoneda.setPrompt("Aqui puede ingresar los filtros para la busqueda..");
        txtCriterioMoneda.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtCriterioMonedaActionPerformed(evt);
            }
        });
        txtCriterioMoneda.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txtCriterioMonedaKeyPressed(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtCriterioMonedaKeyTyped(evt);
            }
        });

        tablaDatosMonedas.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        tablaDatosMonedas.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "<html><p style=\"text-align:center\"><span style=\"color:#000066\"><span style=\"font-family:SansSerif\"><span style=\"font-size:10px\">Código</span></span></span></p></html> ", "<html><p style=\"text-align:right\"><span style=\"color:#000066\"><span style=\"font-family:SansSerif\"><span style=\"font-size:10px\">Descripción</span></span></span></p></html> "
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tablaDatosMonedas.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tablaDatosMonedasMouseClicked(evt);
            }
        });
        jScrollPane3.setViewportView(tablaDatosMonedas);
        if (tablaDatosMonedas.getColumnModel().getColumnCount() > 0) {
            tablaDatosMonedas.getColumnModel().getColumn(0).setMinWidth(60);
            tablaDatosMonedas.getColumnModel().getColumn(0).setPreferredWidth(60);
            tablaDatosMonedas.getColumnModel().getColumn(0).setMaxWidth(60);
        }

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel7, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(txtCriterioMoneda, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 511, Short.MAX_VALUE)
                    .addComponent(jScrollPane3, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 511, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtCriterioMoneda, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 180, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout BuscadorMonedaLayout = new javax.swing.GroupLayout(BuscadorMoneda.getContentPane());
        BuscadorMoneda.getContentPane().setLayout(BuscadorMonedaLayout);
        BuscadorMonedaLayout.setHorizontalGroup(
            BuscadorMonedaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        BuscadorMonedaLayout.setVerticalGroup(
            BuscadorMonedaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        setClosable(true);
        setIconifiable(true);

        jPanel1.setBackground(new java.awt.Color(50, 104, 151));

        jLabel1.setFont(new java.awt.Font("SansSerif", 0, 14)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("Mantenimiento de Cuentas");

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
                "<html><p style=\"text-align:center\"><span style=\"color:#000066\"><span style=\"font-family:SansSerif\"><span style=\"font-size:10px\">Código</span></span></span></p></html> ", "<html><p style=\"text-align:right\"><span style=\"color:#000066\"><span style=\"font-family:SansSerif\"><span style=\"font-size:10px\">Descripción</span></span></span></p></html> ", "<html><p style=\"text-align:right\"><span style=\"color:#000066\"><span style=\"font-family:SansSerif\"><span style=\"font-size:10px\">Cod. Banco</span></span></span></p></html> ", "<html><p style=\"text-align:right\"><span style=\"color:#000066\"><span style=\"font-family:SansSerif\"><span style=\"font-size:10px\">Banco</span></span></span></p></html> ", "<html><p style=\"text-align:right\"><span style=\"color:#000066\"><span style=\"font-family:SansSerif\"><span style=\"font-size:10px\">Cod. Moneda</span></span></span></p></html> ", "<html><p style=\"text-align:right\"><span style=\"color:#000066\"><span style=\"font-family:SansSerif\"><span style=\"font-size:10px\">Moneda</span></span></span></p></html> "
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.Integer.class, java.lang.String.class, java.lang.Integer.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false
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
            tablaDatos.getColumnModel().getColumn(2).setMinWidth(0);
            tablaDatos.getColumnModel().getColumn(2).setPreferredWidth(0);
            tablaDatos.getColumnModel().getColumn(2).setMaxWidth(0);
            tablaDatos.getColumnModel().getColumn(3).setMinWidth(150);
            tablaDatos.getColumnModel().getColumn(3).setPreferredWidth(150);
            tablaDatos.getColumnModel().getColumn(3).setMaxWidth(150);
            tablaDatos.getColumnModel().getColumn(4).setMinWidth(0);
            tablaDatos.getColumnModel().getColumn(4).setPreferredWidth(0);
            tablaDatos.getColumnModel().getColumn(4).setMaxWidth(0);
            tablaDatos.getColumnModel().getColumn(5).setMinWidth(150);
            tablaDatos.getColumnModel().getColumn(5).setPreferredWidth(150);
            tablaDatos.getColumnModel().getColumn(5).setMaxWidth(150);
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
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 252, Short.MAX_VALUE)
                .addContainerGap())
        );

        pestanha.addTab("Listado", pestanhaLista);

        pestanhaABM.setBackground(new java.awt.Color(255, 255, 255));

        txtDescripcion.setEnabled(false);
        txtDescripcion.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        txtDescripcion.setPrompt("Nombre o descripción...");
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
        jLabel2.setText("Código:");

        jLabel3.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        jLabel3.setText("Descripción:");

        txtCodigo.setEnabled(false);
        txtCodigo.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        txtCodigo.setPrompt("Código interno...");

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
        jLabel4.setText("Banco:");

        txtCodigoBanco.setEnabled(false);
        txtCodigoBanco.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        txtCodigoBanco.setPrompt("Cód. Banco");
        txtCodigoBanco.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtCodigoBancoActionPerformed(evt);
            }
        });
        txtCodigoBanco.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txtCodigoBancoKeyPressed(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtCodigoBancoKeyTyped(evt);
            }
        });

        txtDescripcionPais.setEnabled(false);
        txtDescripcionPais.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        txtDescripcionPais.setPrompt("Descripción o nombre del pais...");
        txtDescripcionPais.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtDescripcionPaisActionPerformed(evt);
            }
        });
        txtDescripcionPais.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtDescripcionPaisKeyTyped(evt);
            }
        });

        jLabel6.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        jLabel6.setText("Moneda:");

        txtCodigoMoneda.setEnabled(false);
        txtCodigoMoneda.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        txtCodigoMoneda.setPrompt("Cód. Mon.");
        txtCodigoMoneda.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtCodigoMonedaActionPerformed(evt);
            }
        });
        txtCodigoMoneda.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txtCodigoMonedaKeyPressed(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtCodigoMonedaKeyTyped(evt);
            }
        });

        txtDescripcionMoneda.setEnabled(false);
        txtDescripcionMoneda.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        txtDescripcionMoneda.setPrompt("Descripción o nombre de la moneda...");
        txtDescripcionMoneda.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtDescripcionMonedaActionPerformed(evt);
            }
        });
        txtDescripcionMoneda.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                txtDescripcionMonedaKeyTyped(evt);
            }
        });

        javax.swing.GroupLayout pestanhaABMLayout = new javax.swing.GroupLayout(pestanhaABM);
        pestanhaABM.setLayout(pestanhaABMLayout);
        pestanhaABMLayout.setHorizontalGroup(
            pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(pestanhaABMLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel6, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel4, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel3, javax.swing.GroupLayout.DEFAULT_SIZE, 72, Short.MAX_VALUE))
                .addGap(18, 18, 18)
                .addGroup(pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(pestanhaABMLayout.createSequentialGroup()
                        .addComponent(txtCodigo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(pestanhaABMLayout.createSequentialGroup()
                        .addGroup(pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txtDescripcion, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addGroup(pestanhaABMLayout.createSequentialGroup()
                                    .addComponent(txtCodigoMoneda, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(txtDescripcionMoneda, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                                .addGroup(pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, pestanhaABMLayout.createSequentialGroup()
                                        .addComponent(btnNuevo, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                        .addComponent(btnConfirmar)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                        .addComponent(btnCancelar, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, pestanhaABMLayout.createSequentialGroup()
                                        .addComponent(txtCodigoBanco, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                        .addComponent(txtDescripcionPais, javax.swing.GroupLayout.PREFERRED_SIZE, 405, javax.swing.GroupLayout.PREFERRED_SIZE)))))
                        .addContainerGap())))
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
                    .addComponent(txtCodigoBanco, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtDescripcionPais, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(txtCodigoMoneda, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtDescripcionMoneda, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 139, Short.MAX_VALUE)
                .addGroup(pestanhaABMLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnCancelar, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnConfirmar, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnNuevo, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        pestanha.addTab("Operaciónes", pestanhaABM);

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
            txtCodigoBanco.grabFocus();
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
        int res = JOptionPane.showConfirmDialog(null, "¿ESTA SEGURO DE CONFIRMAR LOS CAMBIOS?", "ADVERTENCIA", JOptionPane.YES_NO_OPTION);
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

    private void txtCodigoBancoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtCodigoBancoActionPerformed
        if (txtCodigoBanco.getText().isEmpty()) {
            JOptionPane.showMessageDialog(null, "NO PUEDE DEJAR EL CAMPO DE BANCO VACIO", "ADVERTENCIA", JOptionPane.WARNING_MESSAGE);
        } else {
            int idbanco = Integer.parseInt(txtCodigoBanco.getText());
            b.setIdbanco(idbanco);
            boolean resultado = daoBanco.consultarDatos(b);
            if (resultado == true) {
                txtDescripcionPais.setText(b.getDescripcion());
                txtCodigoMoneda.grabFocus();
            } else {
                txtCodigoBanco.setText(null);
                txtDescripcionPais.setText(null);
                txtCodigoBanco.grabFocus();
            }
        }
    }//GEN-LAST:event_txtCodigoBancoActionPerformed

    private void txtCodigoBancoKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtCodigoBancoKeyTyped
        char c = evt.getKeyChar();
        if (Character.isLetter(c)) {
            getToolkit().beep();
            evt.consume();
        }
        if (txtCodigoBanco.getText().length() == 10) {
            evt.consume();
        }
    }//GEN-LAST:event_txtCodigoBancoKeyTyped

    private void txtDescripcionPaisActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtDescripcionPaisActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtDescripcionPaisActionPerformed

    private void txtDescripcionPaisKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtDescripcionPaisKeyTyped
        // TODO add your handling code here:
    }//GEN-LAST:event_txtDescripcionPaisKeyTyped

    private void txtCriterioBancoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtCriterioBancoActionPerformed
        cargarBanco();
    }//GEN-LAST:event_txtCriterioBancoActionPerformed

    private void txtCriterioBancoKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtCriterioBancoKeyTyped
        char c = evt.getKeyChar();
        if (Character.isLowerCase(c)) {
            evt.setKeyChar(Character.toUpperCase(c));
        }
        if (txtCriterio.getText().length() == 100) {
            evt.consume();
        }
    }//GEN-LAST:event_txtCriterioBancoKeyTyped

    private void txtCriterioBancoKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtCriterioBancoKeyPressed
        if (evt.VK_ESCAPE == evt.getKeyCode()) {
            txtCodigoBanco.setText(null);
            txtDescripcionPais.setText(null);
            txtCodigoBanco.grabFocus();
            BuscadorPais.dispose();
        }
    }//GEN-LAST:event_txtCriterioBancoKeyPressed

    private void tablaDatosBancoMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tablaDatosBancoMouseClicked
        if (evt.getClickCount() == 2) {
            if (tablaDatosBanco.getSelectedRowCount() == 0) {
                JOptionPane.showMessageDialog(null, "SELECCIONE UNA FILA");
            } else {
                txtCriterioBanco.setText(null);
                BuscadorPais.dispose();
            }
        }
    }//GEN-LAST:event_tablaDatosBancoMouseClicked

    private void txtCodigoBancoKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtCodigoBancoKeyPressed
        if (evt.VK_F1 == evt.getKeyCode()) {
            buscarBanco();
        }
    }//GEN-LAST:event_txtCodigoBancoKeyPressed

    private void txtCodigoMonedaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtCodigoMonedaActionPerformed
        if (txtCodigoMoneda.getText().isEmpty()) {
            JOptionPane.showMessageDialog(null, "NO PUEDE DEJAR EL CAMPO DE MONEDA VACIO", "ADVERTENCIA", JOptionPane.WARNING_MESSAGE);
        } else {
            int idmoneda = Integer.parseInt(txtCodigoMoneda.getText());
            m.setIdmoneda(idmoneda);
            boolean resultado = daoMoneda.consultarDatos(m);
            if (resultado == true) {
                txtDescripcionMoneda.setText(m.getDescripcion());
                btnConfirmar.grabFocus();
            } else {
                txtCodigoMoneda.setText(null);
                txtDescripcionMoneda.setText(null);
                txtCodigoMoneda.grabFocus();
            }
        }
    }//GEN-LAST:event_txtCodigoMonedaActionPerformed

    private void txtCodigoMonedaKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtCodigoMonedaKeyPressed
        if (evt.VK_F1 == evt.getKeyCode()) {
            buscarMoneda();
        }
    }//GEN-LAST:event_txtCodigoMonedaKeyPressed

    private void txtCodigoMonedaKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtCodigoMonedaKeyTyped
        char c = evt.getKeyChar();
        if (Character.isLetter(c)) {
            getToolkit().beep();
            evt.consume();
        }
        if (txtCodigoMoneda.getText().length() == 10) {
            evt.consume();
        }
    }//GEN-LAST:event_txtCodigoMonedaKeyTyped

    private void txtDescripcionMonedaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtDescripcionMonedaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtDescripcionMonedaActionPerformed

    private void txtDescripcionMonedaKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtDescripcionMonedaKeyTyped
        // TODO add your handling code here:
    }//GEN-LAST:event_txtDescripcionMonedaKeyTyped

    private void txtCriterioMonedaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtCriterioMonedaActionPerformed
        cargarMoneda();
    }//GEN-LAST:event_txtCriterioMonedaActionPerformed

    private void txtCriterioMonedaKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtCriterioMonedaKeyPressed
        if (evt.VK_ESCAPE == evt.getKeyCode()) {
            txtCodigoMoneda.setText(null);
            txtDescripcionMoneda.setText(null);
            txtCodigoMoneda.grabFocus();
            BuscadorMoneda.dispose();
        }
    }//GEN-LAST:event_txtCriterioMonedaKeyPressed

    private void txtCriterioMonedaKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtCriterioMonedaKeyTyped
        char c = evt.getKeyChar();
        if (Character.isLowerCase(c)) {
            evt.setKeyChar(Character.toUpperCase(c));
        }
        if (txtCriterio.getText().length() == 100) {
            evt.consume();
        }
    }//GEN-LAST:event_txtCriterioMonedaKeyTyped

    private void tablaDatosMonedasMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tablaDatosMonedasMouseClicked
        if (evt.getClickCount() == 2) {
            if (tablaDatosMonedas.getSelectedRowCount() == 0) {
                JOptionPane.showMessageDialog(null, "SELECCIONE UNA FILA");
            } else {
                txtCriterioMoneda.setText(null);
                BuscadorMoneda.dispose();
            }
        }
    }//GEN-LAST:event_tablaDatosMonedasMouseClicked


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JDialog BuscadorMoneda;
    private javax.swing.JDialog BuscadorPais;
    private javax.swing.JMenuItem Eliminar;
    private javax.swing.JMenuItem Modificar;
    private javax.swing.JButton btnCancelar;
    private javax.swing.JButton btnConfirmar;
    private javax.swing.JButton btnNuevo;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JPopupMenu menuDesplegable;
    private javax.swing.JTabbedPane pestanha;
    private javax.swing.JPanel pestanhaABM;
    private javax.swing.JPanel pestanhaLista;
    private javax.swing.JTable tablaDatos;
    private javax.swing.JTable tablaDatosBanco;
    private javax.swing.JTable tablaDatosMonedas;
    private org.jdesktop.swingx.JXTextField txtCodigo;
    private org.jdesktop.swingx.JXTextField txtCodigoBanco;
    private org.jdesktop.swingx.JXTextField txtCodigoMoneda;
    private org.jdesktop.swingx.JXTextField txtCriterio;
    private org.jdesktop.swingx.JXTextField txtCriterioBanco;
    private org.jdesktop.swingx.JXTextField txtCriterioMoneda;
    private org.jdesktop.swingx.JXTextField txtDescripcion;
    private org.jdesktop.swingx.JXTextField txtDescripcionMoneda;
    private org.jdesktop.swingx.JXTextField txtDescripcionPais;
    // End of variables declaration//GEN-END:variables
}
