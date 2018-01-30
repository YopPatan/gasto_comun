package com.gasto.model;

import javax.persistence.*;

@Entity
@Table(name = "departamento_gasto")
public class DepartamentoGasto {
    private int id;
    private int montoComun;
    private int montoNoComun;
    private int montoReserva;
    private int montoTotal;
    private int montoInteres;
    private int montoAdeudado;
    private Gastocomun gastocomun;
    private Departamento departamento;

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

    @Basic
    @Column(name = "monto_adeudado", nullable = false)
    public int getMontoAdeudado() {
        return montoAdeudado;
    }

    public void setMontoAdeudado(int montoAdeudado) {
        this.montoAdeudado = montoAdeudado;
    }

    @Basic
    @Column(name = "monto_interes", nullable = false)
    public int getMontoInteres() {
        return montoInteres;
    }

    public void setMontoInteres(int montoInteres) {
        this.montoInteres = montoInteres;
    }

    @ManyToOne
    @JoinColumn(name = "gastocomun_id", referencedColumnName = "id", nullable = false)
    public Gastocomun getGastocomun() {
        return gastocomun;
    }

    public void setGastocomun(Gastocomun gastocomun) {
        this.gastocomun = gastocomun;
    }

    @ManyToOne
    @JoinColumn(name = "departamento_id", referencedColumnName = "id", nullable = false)
    public Departamento getDepartamento() {
        return departamento;
    }

    public void setDepartamento(Departamento departamento) {
        this.departamento = departamento;
    }

}
