package com.gasto.model;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "boleta_pago")
public class BoletaPago {
    private int id;
    private Timestamp fecha;
    private int cuota;
    private int monto;
    private Gastocomun gastocomun;
    private Boleta boleta;

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
    @Column(name = "cuota", nullable = false)
    public int getCuota() {
        return cuota;
    }

    public void setCuota(int cuota) {
        this.cuota = cuota;
    }

    @Basic
    @Column(name = "monto", nullable = false)
    public int getMonto() {
        return monto;
    }

    public void setMonto(int monto) {
        this.monto = monto;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BoletaPago that = (BoletaPago) o;

        if (id != that.id) return false;
        if (cuota != that.cuota) return false;
        if (monto != that.monto) return false;
        if (fecha != null ? !fecha.equals(that.fecha) : that.fecha != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (fecha != null ? fecha.hashCode() : 0);
        result = 31 * result + cuota;
        result = 31 * result + monto;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "gastocomun_id", referencedColumnName = "id")
    public Gastocomun getGastocomun() {
        return gastocomun;
    }

    public void setGastocomun(Gastocomun gastocomun) {
        this.gastocomun = gastocomun;
    }

    @ManyToOne
    @JoinColumn(name = "boleta_id", referencedColumnName = "id", nullable = false)
    public Boleta getBoleta() {
        return boleta;
    }

    public void setBoleta(Boleta boleta) {
        this.boleta = boleta;
    }
}
