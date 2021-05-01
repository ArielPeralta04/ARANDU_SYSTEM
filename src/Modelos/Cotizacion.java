package Modelos;

import java.util.Date;

/**
 *
 * @author armando
 */
public class Cotizacion {

    private int idmoneda;
    private Date fecha;
    private double tasa;

    public Cotizacion() {
    }

    public int getIdmoneda() {
        return idmoneda;
    }

    public void setIdmoneda(int idmoneda) {
        this.idmoneda = idmoneda;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public double getTasa() {
        return tasa;
    }

    public void setTasa(double tasa) {
        this.tasa = tasa;
    }
    
}
