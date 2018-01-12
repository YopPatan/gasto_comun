package com.gasto.model;

import javax.persistence.*;
import java.util.HashMap;

@Entity
@Table(name = "personal_item")
public class PersonalItem {
    private int id;
    private String nombre;
    private double monto;
    private int tipo;
    private int esPorcentaje;
    private Personal personal;

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
    @Column(name = "monto", nullable = false, precision = 0)
    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    @Basic
    @Column(name = "tipo", nullable = false)
    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    @Basic
    @Column(name = "es_porcentaje", nullable = false)
    public int getEsPorcentaje() {
        return esPorcentaje;
    }

    public void setEsPorcentaje(int esPorcentaje) {
        this.esPorcentaje = esPorcentaje;
    }

    @ManyToOne
    @JoinColumn(name = "personal_id", referencedColumnName = "id", nullable = false)
    public Personal getPersonal() {
        return personal;
    }

    public void setPersonal(Personal personal) {
        this.personal = personal;
    }

    private static HashMap<Integer, String> tipoNombres = new HashMap<Integer, String>();
    static {
        tipoNombres.put(1, "Haberes");
        tipoNombres.put(2, "Descuentos");
    }

    @Transient
    public String getTipoNombre() {
        return tipoNombres.get(this.tipo);
    }

    @Transient
    public HashMap<Integer, String> getTipoNombres() {
        return tipoNombres;
    }
}
