package com.gasto.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
@Table(name = "gastocomun")
public class Gastocomun {
    private int id;
    private Timestamp fecha;
    private Timestamp fechaVencimiento;
    private Collection<BoletaPago> boletaPagos;
    private Collection<Liquidacion> liquidaciones;
    private Collection<MapaGastocomunDepartamento> mapaGastocomunDepartamentos;

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
    @Column(name = "fecha_vencimiento", nullable = false)
    public Timestamp getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(Timestamp fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Gastocomun that = (Gastocomun) o;

        if (id != that.id) return false;
        if (fecha != null ? !fecha.equals(that.fecha) : that.fecha != null) return false;
        if (fechaVencimiento != null ? !fechaVencimiento.equals(that.fechaVencimiento) : that.fechaVencimiento != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (fecha != null ? fecha.hashCode() : 0);
        result = 31 * result + (fechaVencimiento != null ? fechaVencimiento.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "gastocomun")
    public Collection<BoletaPago> getBoletaPagos() {
        return boletaPagos;
    }

    public void setBoletaPagos(Collection<BoletaPago> boletaPagos) {
        this.boletaPagos = boletaPagos;
    }

    @OneToMany(mappedBy = "gastocomun")
    public Collection<Liquidacion> getLiquidaciones() {
        return liquidaciones;
    }

    public void setLiquidaciones(Collection<Liquidacion> liquidaciones) {
        this.liquidaciones = liquidaciones;
    }

    @OneToMany(mappedBy = "gastocomun")
    public Collection<MapaGastocomunDepartamento> getMapaGastocomunDepartamentos() {
        return mapaGastocomunDepartamentos;
    }

    public void setMapaGastocomunDepartamentos(Collection<MapaGastocomunDepartamento> mapaGastocomunDepartamentos) {
        this.mapaGastocomunDepartamentos = mapaGastocomunDepartamentos;
    }
}
