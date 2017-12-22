package com.gasto.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
public class Cuenta {
    private int id;
    private String nombre;
    private int tipo;
    private Collection<Boleta> boletas;

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
    @Column(name = "tipo", nullable = false)
    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Cuenta cuenta = (Cuenta) o;

        if (id != cuenta.id) return false;
        if (tipo != cuenta.tipo) return false;
        if (nombre != null ? !nombre.equals(cuenta.nombre) : cuenta.nombre != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (nombre != null ? nombre.hashCode() : 0);
        result = 31 * result + tipo;
        return result;
    }

    @OneToMany(mappedBy = "cuenta")
    public Collection<Boleta> getBoletas() {
        return boletas;
    }

    public void setBoletas(Collection<Boleta> boletas) {
        this.boletas = boletas;
    }
}
