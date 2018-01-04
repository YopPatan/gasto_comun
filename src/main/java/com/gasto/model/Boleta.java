package com.gasto.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "boleta")
public class Boleta {
    private int id;
    private String folio;
    private int monto;
    private String adjunto;
    private Cuenta cuenta;
    private Collection<BoletaPago> boletaPagos;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "folio", nullable = false, length = 255)
    public String getFolio() {
        return folio;
    }

    public void setFolio(String folio) {
        this.folio = folio;
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
    @Column(name = "adjunto", nullable = false, length = 255)
    public String getAdjunto() {
        return adjunto;
    }

    public void setAdjunto(String adjunto) {
        this.adjunto = adjunto;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Boleta boleta = (Boleta) o;

        if (id != boleta.id) return false;
        if (monto != boleta.monto) return false;
        if (folio != null ? !folio.equals(boleta.folio) : boleta.folio != null) return false;
        if (adjunto != null ? !adjunto.equals(boleta.adjunto) : boleta.adjunto != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (folio != null ? folio.hashCode() : 0);
        result = 31 * result + monto;
        result = 31 * result + (adjunto != null ? adjunto.hashCode() : 0);
        return result;
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
}
