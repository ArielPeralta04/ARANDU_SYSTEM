package Modelos;

/**
 *
 * @author armando
 */
public class CompraConfiguracion {
    private int idempresa;
    private int idsucursal;
    private int compracontadomov;
    private int compracreditomov;
    private int maximocantidadarticulo;
    private int notacreditomov;
    private int notadebitomov;

    public CompraConfiguracion() {
    }

    public int getIdempresa() {
        return idempresa;
    }

    public void setIdempresa(int idempresa) {
        this.idempresa = idempresa;
    }

    public int getIdsucursal() {
        return idsucursal;
    }

    public void setIdsucursal(int idsucursal) {
        this.idsucursal = idsucursal;
    }

    public int getCompracontadomov() {
        return compracontadomov;
    }

    public void setCompracontadomov(int compracontadomov) {
        this.compracontadomov = compracontadomov;
    }

    public int getCompracreditomov() {
        return compracreditomov;
    }

    public void setCompracreditomov(int compracreditomov) {
        this.compracreditomov = compracreditomov;
    }

    public int getMaximocantidadarticulo() {
        return maximocantidadarticulo;
    }

    public void setMaximocantidadarticulo(int maximocantidadarticulo) {
        this.maximocantidadarticulo = maximocantidadarticulo;
    }

    public int getNotacreditomov() {
        return notacreditomov;
    }

    public void setNotacreditomov(int notacreditomov) {
        this.notacreditomov = notacreditomov;
    }

    public int getNotadebitomov() {
        return notadebitomov;
    }

    public void setNotadebitomov(int notadebitomov) {
        this.notadebitomov = notadebitomov;
    }
    
}
