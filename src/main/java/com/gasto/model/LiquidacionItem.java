package com.gasto.model;

import javax.persistence.*;

@Entity
@Table(name = "liquidacion_item")
public class LiquidacionItem {
    private int id;
    private int monto;
    private String nombre;
    private int tipo;
    private Liquidacion liquidacion;

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
    @Column(name = "monto", nullable = false)
    public int getMonto() {
        return monto;
    }

    public void setMonto(int monto) {
        this.monto = monto;
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


    @ManyToOne
    @JoinColumn(name = "liquidacion_id", referencedColumnName = "id", nullable = false)
    public Liquidacion getLiquidacion() {
        return liquidacion;
    }

    public void setLiquidacion(Liquidacion liquidacion) {
        this.liquidacion = liquidacion;
    }

    @Transient
    public int getEsPorcentaje() {
        return 0;
    }
}
