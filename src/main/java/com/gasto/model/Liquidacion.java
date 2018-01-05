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
    private int montoHaberes;
    private int montoDescuentos;
    private int montoLiquido;
    private Gastocomun gastocomun;
    private Collection<PersonalPago> personalPagos;
    private Collection<LiquidacionItem> liquidacionItems;

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

    @Basic
    @Column(name = "monto_haberes", nullable = false)
    public int getMontoHaberes() {
        return montoHaberes;
    }

    public void setMontoHaberes(int montoHaberes) {
        this.montoHaberes = montoHaberes;
    }

    @Basic
    @Column(name = "monto_descuentos", nullable = false)
    public int getMontoDescuentos() {
        return montoDescuentos;
    }

    public void setMontoDescuentos(int montoDescuentos) {
        this.montoDescuentos = montoDescuentos;
    }

    @Basic
    @Column(name = "monto_liquido", nullable = false)
    public int getMontoLiquido() {
        return montoLiquido;
    }

    public void setMontoLiquido(int montoLiquido) {
        this.montoLiquido = montoLiquido;
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
    public Collection<PersonalPago> getPersonalPagos() {
        return personalPagos;
    }

    public void setPersonalPagos(Collection<PersonalPago> personalPagos) {
        this.personalPagos = personalPagos;
    }

    @OneToMany(mappedBy = "liquidacion")
    public Collection<LiquidacionItem> getLiquidacionItems() {
        return liquidacionItems;
    }

    public void setLiquidacionItems(Collection<LiquidacionItem> liquidacionItems) {
        this.liquidacionItems = liquidacionItems;
    }
}
