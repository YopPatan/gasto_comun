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
    private String observaciones;
    private int montoComun;
    private int montoNoComun;
    private int montoReserva;
    private int montoTotal;
    private Collection<BoletaPago> boletaPagos;
    private Collection<PersonalPago> personalPagos;
    private Collection<DepartamentoGasto> departamentoGastos;
    private Collection<Consumo> consumos;

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
    @Column(name = "fecha_vencimiento", nullable = false)
    public Timestamp getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(Timestamp fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }

    @Basic
    @Column(name = "observaciones", nullable = true, length = -1)
    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    @Basic
    @Column(name = "monto_comun", nullable = false)
    public int getMontoComun() {
        return montoComun;
    }

    public void setMontoComun(int montoComun) {
        this.montoComun = montoComun;
    }

    @Basic
    @Column(name = "monto_no_comun", nullable = false)
    public int getMontoNoComun() {
        return montoNoComun;
    }

    public void setMontoNoComun(int montoNoComun) {
        this.montoNoComun = montoNoComun;
    }

    @Basic
    @Column(name = "monto_reserva", nullable = false)
    public int getMontoReserva() {
        return montoReserva;
    }

    public void setMontoReserva(int montoReserva) {
        this.montoReserva = montoReserva;
    }

    @Basic
    @Column(name = "monto_total", nullable = false)
    public int getMontoTotal() {
        return montoTotal;
    }

    public void setMontoTotal(int montoTotal) {
        this.montoTotal = montoTotal;
    }

    @OneToMany(mappedBy = "gastocomun")
    public Collection<BoletaPago> getBoletaPagos() {
        return boletaPagos;
    }

    public void setBoletaPagos(Collection<BoletaPago> boletaPagos) {
        this.boletaPagos = boletaPagos;
    }

    @OneToMany(mappedBy = "gastocomun")
    public Collection<PersonalPago> getPersonalPago() {
        return personalPagos;
    }

    public void setPersonalPago(Collection<PersonalPago> personalPagos) {
        this.personalPagos = personalPagos;
    }

    @OneToMany(mappedBy = "gastocomun")
    public Collection<DepartamentoGasto> getDepartamentoGastos() {
        return departamentoGastos;
    }

    public void setDepartamentoGastos(Collection<DepartamentoGasto> departamentoGastos) {
        this.departamentoGastos = departamentoGastos;
    }

    @OneToMany(mappedBy = "gastocomun")
    public Collection<Consumo> getConsumos() {
        return consumos;
    }

    public void setConsumos(Collection<Consumo> consumos) {
        this.consumos = consumos;
    }

}
