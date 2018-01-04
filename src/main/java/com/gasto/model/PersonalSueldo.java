package com.gasto.model;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "personal_sueldo")
public class PersonalSueldo {
    private int id;
    private Timestamp fecha;
    private int montoBruto;
    private int estado;
    private String adjunto;
    private int montoMovilizacion;
    private int montoColacion;
    private Personal personalByPersonalId;

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
    @Column(name = "monto_bruto", nullable = false)
    public int getMontoBruto() {
        return montoBruto;
    }

    public void setMontoBruto(int montoBruto) {
        this.montoBruto = montoBruto;
    }

    @Basic
    @Column(name = "estado", nullable = false)
    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    @Basic
    @Column(name = "adjunto", nullable = false, length = 255)
    public String getAdjunto() {
        return adjunto;
    }

    public void setAdjunto(String adjunto) {
        this.adjunto = adjunto;
    }

    @Basic
    @Column(name = "monto_movilizacion", nullable = false)
    public int getMontoMovilizacion() {
        return montoMovilizacion;
    }

    public void setMontoMovilizacion(int montoMovilizacion) {
        this.montoMovilizacion = montoMovilizacion;
    }

    @Basic
    @Column(name = "monto_colacion", nullable = false)
    public int getMontoColacion() {
        return montoColacion;
    }

    public void setMontoColacion(int montoColacion) {
        this.montoColacion = montoColacion;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PersonalSueldo that = (PersonalSueldo) o;

        if (id != that.id) return false;
        if (montoBruto != that.montoBruto) return false;
        if (estado != that.estado) return false;
        if (montoMovilizacion != that.montoMovilizacion) return false;
        if (montoColacion != that.montoColacion) return false;
        if (fecha != null ? !fecha.equals(that.fecha) : that.fecha != null) return false;
        if (adjunto != null ? !adjunto.equals(that.adjunto) : that.adjunto != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (fecha != null ? fecha.hashCode() : 0);
        result = 31 * result + montoBruto;
        result = 31 * result + estado;
        result = 31 * result + (adjunto != null ? adjunto.hashCode() : 0);
        result = 31 * result + montoMovilizacion;
        result = 31 * result + montoColacion;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "personal_id", referencedColumnName = "id", nullable = false)
    public Personal getPersonalByPersonalId() {
        return personalByPersonalId;
    }

    public void setPersonalByPersonalId(Personal personalByPersonalId) {
        this.personalByPersonalId = personalByPersonalId;
    }
}
