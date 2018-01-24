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
    private int montoReserva;
    private int montoTotal;
    private Collection<BoletaPago> boletaPagos;
    private Collection<PersonalPago> personalPagos;
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

    @Basic
    @Column(name = "observaciones", nullable = false, length = -1)
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
    public Collection<MapaGastocomunDepartamento> getMapaGastocomunDepartamentos() {
        return mapaGastocomunDepartamentos;
    }

    public void setMapaGastocomunDepartamentos(Collection<MapaGastocomunDepartamento> mapaGastocomunDepartamentos) {
        this.mapaGastocomunDepartamentos = mapaGastocomunDepartamentos;
    }
}
