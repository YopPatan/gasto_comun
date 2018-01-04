package com.gasto.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
@Table(name = "liquidacion")
public class Liquidacion {
    private int id;
    private Timestamp fecha;
    private String adjunto;
    private Collection<Cotizacion> cotizaciones;
    private Gastocomun gastocomun;
    private Collection<PersonalContable> personalContables;

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
    @Column(name = "adjunto", nullable = false, length = 255)
    public String getAdjunto() {
        return adjunto;
    }

    public void setAdjunto(String adjunto) {
        this.adjunto = adjunto;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Liquidacion that = (Liquidacion) o;

        if (id != that.id) return false;
        if (fecha != null ? !fecha.equals(that.fecha) : that.fecha != null) return false;
        if (adjunto != null ? !adjunto.equals(that.adjunto) : that.adjunto != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (fecha != null ? fecha.hashCode() : 0);
        result = 31 * result + (adjunto != null ? adjunto.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "liquidacion")
    public Collection<Cotizacion> getCotizaciones() {
        return cotizaciones;
    }

    public void setCotizaciones(Collection<Cotizacion> cotizaciones) {
        this.cotizaciones = cotizaciones;
    }

    @ManyToOne
    @JoinColumn(name = "gastocomun_id", referencedColumnName = "id")
    public Gastocomun getGastocomun() {
        return gastocomun;
    }

    public void setGastocomun(Gastocomun gastocomun) {
        this.gastocomun = gastocomun;
    }

    @OneToMany(mappedBy = "liquidacion")
    public Collection<PersonalContable> getPersonalContables() {
        return personalContables;
    }

    public void setPersonalContables(Collection<PersonalContable> personalContables) {
        this.personalContables = personalContables;
    }
}
