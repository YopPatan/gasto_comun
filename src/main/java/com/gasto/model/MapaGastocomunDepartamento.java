package com.gasto.model;

import javax.persistence.*;

@Entity
@Table(name = "mapa_gastocomun_departamento", schema = "gastosdb", catalog = "")
public class MapaGastocomunDepartamento {
    private int id;
    private int montoComun;
    private int montoAgua;
    private int montoReserva;
    private int montoInteres;
    private Gastocomun gastocomun;
    private Departamento departamento;

    @Id
    @Column(name = "id", nullable = false)
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
    @Column(name = "monto_agua", nullable = false)
    public int getMontoAgua() {
        return montoAgua;
    }

    public void setMontoAgua(int montoAgua) {
        this.montoAgua = montoAgua;
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
    @Column(name = "monto_interes", nullable = false)
    public int getMontoInteres() {
        return montoInteres;
    }

    public void setMontoInteres(int montoInteres) {
        this.montoInteres = montoInteres;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MapaGastocomunDepartamento that = (MapaGastocomunDepartamento) o;

        if (id != that.id) return false;
        if (montoComun != that.montoComun) return false;
        if (montoAgua != that.montoAgua) return false;
        if (montoReserva != that.montoReserva) return false;
        if (montoInteres != that.montoInteres) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + montoComun;
        result = 31 * result + montoAgua;
        result = 31 * result + montoReserva;
        result = 31 * result + montoInteres;
        return result;
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
