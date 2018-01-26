package com.gasto.model;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "boleta_pago")
public class BoletaPago {
    private int id;
    private Timestamp fecha;
    private String adjunto;
    private int monto;
    private Gastocomun gastocomun;
    private Boleta boleta;

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

    @Basic
    @Column(name = "adjunto", nullable = true, length = 255)
    public String getAdjunto() {
        return adjunto;
    }

    public void setAdjunto(String adjunto) {
        this.adjunto = adjunto;
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
