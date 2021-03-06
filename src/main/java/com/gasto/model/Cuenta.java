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
        tipoNombres.put(1, "Uso y Consumo");
        tipoNombres.put(2, "Mantención y Reparación");
        tipoNombres.put(3, "Otros");
    }

    @Transient
    public String getTipoNombre() {
        return tipoNombres.get(this.tipo);
    }

    @Transient
    public static HashMap<Integer, String> getTipoNombres() {
        return tipoNombres;
    }

}
