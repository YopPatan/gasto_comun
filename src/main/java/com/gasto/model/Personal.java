package com.gasto.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "personal")
public class Personal {
    private int id;
    private String rut;
    private String nombres;
    private String apellidos;
    private String direccion;
    private int estado;

    private Collection<PersonalPago> personalPagos;
    private Collection<PersonalItem> personalItems;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "rut", nullable = false, length = 255)
    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    @Basic
    @Column(name = "nombres", nullable = false, length = 255)
    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    @Basic
    @Column(name = "apellidos", nullable = false, length = 255)
    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    @Basic
    @Column(name = "direccion", nullable = false, length = 255)
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    @Basic
    @Column(name = "estado", nullable = false)
    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    @OneToMany(mappedBy = "personal")
    public Collection<PersonalPago> getPersonalPagos() {
        return personalPagos;
    }

    public void setPersonalPagos(Collection<PersonalPago> personalPagos) {
        this.personalPagos = personalPagos;
    }

    @OneToMany(mappedBy = "personal")
    public Collection<PersonalItem> getPersonalItems() {
        return personalItems;
    }

    public void setPersonalItems(Collection<PersonalItem> personalItems) {
        this.personalItems = personalItems;
    }

}
