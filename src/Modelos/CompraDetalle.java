package Modelos;

import java.util.Date;

/**
 *
 * @author armando
 */
public class CompraDetalle {
    private int idcompra;
    private int idarticulo;
    private double costo;
    private double cantidad;
    private double porcentajeiva;

    public CompraDetalle() {
    }

    public int getIdcompra() {
        return idcompra;
    }

    public void setIdcompra(int idcompra) {
        this.idcompra = idcompra;
    }

    public int getIdarticulo() {
        return idarticulo;
    }

    public void setIdarticulo(int idarticulo) {
        this.idarticulo = idarticulo;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public double getCantidad() {
        return cantidad;
    }

    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }

    public double getPorcentajeiva() {
        return porcentajeiva;
    }

    public void setPorcentajeiva(double porcentajeiva) {
        this.porcentajeiva = porcentajeiva;
    }
    
}
