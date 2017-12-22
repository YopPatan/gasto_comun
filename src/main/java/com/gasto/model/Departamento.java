package com.gasto.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
public class Departamento {
    private int id;
    private String nombre;
    private double alicuota;
    private Collection<DepartamentoPago> departamento;
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
    @Column(name = "nombre", nullable = false, length = 255)
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Basic
    @Column(name = "alicuota", nullable = false, precision = 0)
    public double getAlicuota() {
        return alicuota;
    }

    public void setAlicuota(double alicuota) {
        this.alicuota = alicuota;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Departamento that = (Departamento) o;

        if (id != that.id) return false;
        if (Double.compare(that.alicuota, alicuota) != 0) return false;
        if (nombre != null ? !nombre.equals(that.nombre) : that.nombre != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = id;
        result = 31 * result + (nombre != null ? nombre.hashCode() : 0);
        temp = Double.doubleToLongBits(alicuota);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }

    @OneToMany(mappedBy = "departamento")
    public Collection<DepartamentoPago> getDepartamento() {
        return departamento;
    }

    public void setDepartamento(Collection<DepartamentoPago> departamento) {
        this.departamento = departamento;
    }

    @OneToMany(mappedBy = "departamento")
    public Collection<MapaGastocomunDepartamento> getMapaGastocomunDepartamentos() {
        return mapaGastocomunDepartamentos;
    }

    public void setMapaGastocomunDepartamentos(Collection<MapaGastocomunDepartamento> mapaGastocomunDepartamentos) {
        this.mapaGastocomunDepartamentos = mapaGastocomunDepartamentos;
    }
}
