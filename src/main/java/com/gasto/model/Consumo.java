package com.gasto.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
@Table(name = "consumo")
public class Consumo {
    private int id;
    private String nombre;
    private Timestamp fecha;
    private int cantidad;
    private int monto;
    private Gastocomun gastocomun;
    private Collection<BoletaPago> boletaPagos;
    private Collection<DepartamentoConsumo> departamentoConsumos;

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
    @Column(name = "nombre", nullable = false, length = 255)
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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
    @Column(name = "cantidad", nullable = true)
    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
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

    @OneToMany(mappedBy = "consumo")
    public Collection<BoletaPago> getBoletaPagos() {
        return boletaPagos;
    }

    public void setBoletaPagos(Collection<BoletaPago> boletaPagos) {
        this.boletaPagos = boletaPagos;
    }

    @OneToMany(mappedBy = "consumo")
    public Collection<DepartamentoConsumo> getDepartamentoConsumos() {
        return departamentoConsumos;
    }

    public void setDepartamentoConsumos(Collection<DepartamentoConsumo> departamentoConsumos) {
        this.departamentoConsumos = departamentoConsumos;
    }
}
