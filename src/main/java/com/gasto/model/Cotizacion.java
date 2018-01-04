package com.gasto.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "cotizacion")
public class Cotizacion {
    private int id;
    private int monto;
    private int tipo;
    private Liquidacion liquidacion;
    private Collection<CotizacionPago> cotizacionPagos;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "tipo", nullable = false)
    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Cotizacion that = (Cotizacion) o;

        if (id != that.id) return false;
        if (monto != that.monto) return false;
        if (tipo != that.tipo) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + monto;
        result = 31 * result + tipo;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "liquidacion_id", referencedColumnName = "id", nullable = false)
    public Liquidacion getLiquidacion() {
        return liquidacion;
    }

    public void setLiquidacion(Liquidacion liquidacion) {
        this.liquidacion = liquidacion;
    }

    @OneToMany(mappedBy = "cotizacion")
    public Collection<CotizacionPago> getCotizacionPagos() {
        return cotizacionPagos;
    }

    public void setCotizacionPagos(Collection<CotizacionPago> cotizacionPagos) {
        this.cotizacionPagos = cotizacionPagos;
    }
}
