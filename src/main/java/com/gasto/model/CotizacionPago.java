package com.gasto.model;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "cotizacion_pago")
public class CotizacionPago {
    private int id;
    private Timestamp fecha;
    private int monto;
    private int cuota;
    private Cotizacion cotizacion;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "fecha", nullable = false)
    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }

    @Basic
    @Column(name = "monto", nullable = false)
    public int getMonto() {
        return monto;
    }

    public void setMonto(int monto) {
        this.monto = monto;
    }

    @Basic
    @Column(name = "cuota", nullable = false)
    public int getCuota() {
        return cuota;
    }

    public void setCuota(int cuota) {
        this.cuota = cuota;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CotizacionPago that = (CotizacionPago) o;

        if (id != that.id) return false;
        if (monto != that.monto) return false;
        if (cuota != that.cuota) return false;
        if (fecha != null ? !fecha.equals(that.fecha) : that.fecha != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (fecha != null ? fecha.hashCode() : 0);
        result = 31 * result + monto;
        result = 31 * result + cuota;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "cotizacion_id", referencedColumnName = "id", nullable = false)
    public Cotizacion getCotizacion() {
        return cotizacion;
    }

    public void setCotizacion(Cotizacion cotizacion) {
        this.cotizacion = cotizacion;
    }
}
