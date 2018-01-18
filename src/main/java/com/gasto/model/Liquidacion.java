package com.gasto.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
@Table(name = "liquidacion")
public class Liquidacion {
    private int id;
    private Timestamp fecha;
    /*private String adjunto;*/
    private int montoImponible;
    private int montoNoImponible;
    private int montoDescuentos;
    private int montoLiquido;
    private int diasTrabajados;
    private Gastocomun gastocomun;
    private Personal personal;
    private Collection<PersonalPago> personalPagos;
    private Collection<LiquidacionItem> liquidacionItems;

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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

    /*@Basic
    @Column(name = "adjunto", nullable = false, length = 255)
    public String getAdjunto() {
        return adjunto;
    }

    public void setAdjunto(String adjunto) {
        this.adjunto = adjunto;
    }*/

    @Basic
    @Column(name = "monto_imponible", nullable = false)
    public int getMontoImponible() {
        return montoImponible;
    }

    public void setMontoImponible(int montoImponible) {
        this.montoImponible = montoImponible;
    }

    @Basic
    @Column(name = "monto_no_imponible", nullable = false)
    public int getMontoNoImponible() {
        return montoNoImponible;
    }

    public void setMontoNoImponible(int montoNoImponible) {
        this.montoNoImponible = montoNoImponible;
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

    @Basic
    @Column(name = "dias_trabajados", nullable = false)
    public int getDiasTrabajados() {
        return diasTrabajados;
    }

    public void setDiasTrabajados(int diasTrabajados) {
        this.diasTrabajados = diasTrabajados;
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
    @JoinColumn(name = "personal_id", referencedColumnName = "id", nullable = false)
    public Personal getPersonal() {
        return personal;
    }

    public void setPersonal(Personal personal) {
        this.personal = personal;
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
