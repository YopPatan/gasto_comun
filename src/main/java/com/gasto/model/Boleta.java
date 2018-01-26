package com.gasto.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashMap;

@Entity
@Table(name = "boleta")
public class Boleta {
    private int id;
    private Timestamp fecha;
    private String folio;
    private String adjunto;
    private int estado;
    private int monto;
    private Cuenta cuenta;
    private Collection<BoletaPago> boletaPagos;

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
    @Column(name = "fecha", nullable = false)
    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }

    @Basic
    @Column(name = "folio", nullable = true, length = 255)
    public String getFolio() {
        return folio;
    }

    public void setFolio(String folio) {
        this.folio = folio;
    }

    @Basic
    @Column(name = "adjunto", nullable = true, length = 255)
    public String getAdjunto() {
        return adjunto;
    }

    public void setAdjunto(String adjunto) {
        this.adjunto = adjunto;
    }

    @Basic
    @Column(name = "estado", nullable = false)
    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    @Basic
    @Column(name = "monto", nullable = false)
    public int getMonto() {
        return monto;
    }

    public void setMonto(int monto) {
        this.monto = monto;
    }

    @ManyToOne
    @JoinColumn(name = "cuenta_id", referencedColumnName = "id", nullable = false)
    public Cuenta getCuenta() {
        return cuenta;
    }

    public void setCuenta(Cuenta cuenta) {
        this.cuenta = cuenta;
    }

    @OneToMany(mappedBy = "boleta")
    public Collection<BoletaPago> getBoletaPagos() {
        return boletaPagos;
    }

    public void setBoletaPagos(Collection<BoletaPago> boletaPagos) {
        this.boletaPagos = boletaPagos;
    }

    private static HashMap<Integer, String> estadoNombres = new HashMap<Integer, String>();
    static {
        estadoNombres.put(0, "Adeudado");
        estadoNombres.put(1, "Pagado");
    }

    @Transient
    public String getEstadoNombre() {
        return estadoNombres.get(this.estado);
    }

    @Transient
    public HashMap<Integer, String> getEstadoNombres() {
        return estadoNombres;
    }
}
