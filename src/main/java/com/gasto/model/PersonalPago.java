package com.gasto.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.HashMap;

@Entity
@Table(name = "personal_pago")
public class PersonalPago {
    private int id;
    private Timestamp fecha;
    private int tipo;
    private int monto;
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

    private static HashMap<Integer, String> tipoNombres = new HashMap<Integer, String>();
    static {
        tipoNombres.put(1, "Remuneración");
        tipoNombres.put(2, "Anticipo");
    }

    @Transient
    public String getTipoNombre() {
        return tipoNombres.get(this.tipo);
    }

    @Transient
    public HashMap<Integer, String> getTipoNombres() {
        return tipoNombres;
    }
}
