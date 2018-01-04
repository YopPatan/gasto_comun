package com.gasto.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "personal")
public class Personal {
    private int id;
    private String nombres;
    private String apellidos;
    private String direccion;
    private int estado;
    private Collection<PersonalContable> personalContables;
    private Collection<PersonalSueldo> personalSueldos;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Personal personal = (Personal) o;

        if (id != personal.id) return false;
        if (estado != personal.estado) return false;
        if (nombres != null ? !nombres.equals(personal.nombres) : personal.nombres != null) return false;
        if (apellidos != null ? !apellidos.equals(personal.apellidos) : personal.apellidos != null) return false;
        if (direccion != null ? !direccion.equals(personal.direccion) : personal.direccion != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (nombres != null ? nombres.hashCode() : 0);
        result = 31 * result + (apellidos != null ? apellidos.hashCode() : 0);
        result = 31 * result + (direccion != null ? direccion.hashCode() : 0);
        result = 31 * result + estado;
        return result;
    }

    @OneToMany(mappedBy = "personal")
    public Collection<PersonalContable> getPersonalContables() {
        return personalContables;
    }

    public void setPersonalContables(Collection<PersonalContable> personalContables) {
        this.personalContables = personalContables;
    }

    @OneToMany(mappedBy = "personalByPersonalId")
    public Collection<PersonalSueldo> getPersonalSueldos() {
        return personalSueldos;
    }

    public void setPersonalSueldos(Collection<PersonalSueldo> personalSueldos) {
        this.personalSueldos = personalSueldos;
    }
}
