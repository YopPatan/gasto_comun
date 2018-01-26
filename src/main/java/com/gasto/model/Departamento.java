package com.gasto.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "departamento")
public class Departamento {
    private int id;
    private String nombre;
    private String propietario;
    private String residente;
    private double alicuota;
    private Collection<DepartamentoPago> departamentoPagos;
    private Collection<DepartamentoGasto> departamentoGastos;

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
    @Column(name = "propietario", nullable = true, length = 255)
    public String getPropietario() {
        return propietario;
    }

    public void setPropietario(String propietario) {
        this.propietario = propietario;
    }

    @Basic
    @Column(name = "residente", nullable = true, length = 255)
    public String getResidente() {
        return residente;
    }

    public void setResidente(String residente) {
        this.residente = residente;
    }

    @Basic
    @Column(name = "alicuota", nullable = false, precision = 0)
    public double getAlicuota() {
        return alicuota;
    }

    public void setAlicuota(double alicuota) {
        this.alicuota = alicuota;
    }

    @OneToMany(mappedBy = "departamento")
    public Collection<DepartamentoPago> getDepartamentoPagos() {
        return departamentoPagos;
    }

    public void setDepartamentoPagos(Collection<DepartamentoPago> departamentoPagos) {
        this.departamentoPagos = departamentoPagos;
    }

    @OneToMany(mappedBy = "departamento")
    public Collection<DepartamentoGasto> getDepartamentoGastos() {
        return departamentoGastos;
    }

    public void setDepartamentoGastos(Collection<DepartamentoGasto> departamentoGastos) {
        this.departamentoGastos = departamentoGastos;
    }
}
