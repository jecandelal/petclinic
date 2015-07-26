package com.richardhell.petclinic.model;
import com.richardhell.petclinic.helper.TypesUtil;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "gen_usuario")
public class Usuario implements Serializable {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "estado")
    private String estado;

    @Column(name = "perfil")
    private String perfil;

    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "id_persona")
    private Persona persona;

    public Usuario() {}

    public Usuario(Object id) {
        this.id = TypesUtil.getDefaultLong(id);
    }

    public Long getId() {
        return id;
    }	

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }	

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }	

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEstado() {
        return estado;
    }	

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getPerfil() {
        return perfil;
    }	

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }
}