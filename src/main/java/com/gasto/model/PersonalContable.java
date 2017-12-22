package com.gasto.model;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "personal_contable", schema = "gastosdb", catalog = "")
public class PersonalContable {
    private int id;
    private Timestamp fecha;
    private int tipo;
    private int monto;
    private String descripcion;
    private Personal personal;
    private Liquidacion liquidacion;

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
    @Column(name = "tipo", nullable = false)
    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
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
    @Column(name = "descripcion", nullable = false, length = -1)
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PersonalContable that = (PersonalContable) o;

        if (id != that.id) return false;
        if (tipo != that.tipo) return false;
        if (monto != that.monto) return false;
        if (fecha != null ? !fecha.equals(that.fecha) : that.fecha != null) return false;
        if (descripcion != null ? !descripcion.equals(that.descripcion) : that.descripcion != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (fecha != null ? fecha.hashCode() : 0);
        result = 31 * result + tipo;
        result = 31 * result + monto;
        result = 31 * result + (descripcion != null ? descripcion.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "personal_id", referencedColumnName = "id", nullable = false)
    public Personal getPersonal() {
        return personal;
    }

    public void setPersonal(Personal personal) {
        this.personal = personal;
    }

    @ManyToOne
    @JoinColumn(name = "liquidacion_id", referencedColumnName = "id")
    public Liquidacion getLiquidacion() {
        return liquidacion;
    }

    public void setLiquidacion(Liquidacion liquidacion) {
        this.liquidacion = liquidacion;
    }
}
