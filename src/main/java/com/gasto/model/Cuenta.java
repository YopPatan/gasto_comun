package com.gasto.model;

import javax.persistence.*;
import java.util.Collection;
import java.util.HashMap;

@Entity
@Table(name = "cuenta")
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

    @OneToMany(mappedBy = "cuenta", fetch = FetchType.LAZY)
    public Collection<Boleta> getBoletas() {
        return boletas;
    }

    public void setBoletas(Collection<Boleta> boletas) {
        this.boletas = boletas;
    }

    private static HashMap<Integer, String> tipoNombres = new HashMap<Integer, String>();
    static {
        tipoNombres.put(0, "Cuentas");
        tipoNombres.put(1, "Mantención");
        tipoNombres.put(2, "Otros");
    }

    @Transient
    public String getTipoNombre() {
        return tipoNombres.get(this.tipo);
    }

}
