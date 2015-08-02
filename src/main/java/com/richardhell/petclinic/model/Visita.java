package com.richardhell.petclinic.model;
import com.richardhell.petclinic.helper.TypesUtil;
import java.util.Date;
import javax.persistence.TemporalType;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.Transient;

@Entity
@Table(name = "cli_visita")
public class Visita implements Serializable {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @Column(name = "fecha_ingreso")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaIngreso;

    @Column(name = "fecha_salida")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaSalida;

    @Column(name = "motivo")
    private String motivo;

    @Column(name = "diagnostico")
    private String diagnostico;

    @Column(name = "tratamiento")
    private String tratamiento;

    @Column(name = "dieta")
    private String dieta;

    @Column(name = "proxima_visita")
    @Temporal(TemporalType.DATE)
    private Date proximaVisita;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "id_mascota")
    private Mascota mascota;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "id_veterinario")
    private Veterinario veterinario;

    @Transient
    private boolean finalizado;
    
    public Visita() {}

    public Visita(Object id) {
        this.id = TypesUtil.getDefaultLong(id);
    }

    public Long getId() {
        return id;
    }	

    public void setId(Long id) {
        this.id = id;
    }

    public Date getFechaIngreso() {
        return fechaIngreso;
    }	

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public Date getFechaSalida() {
        return fechaSalida;
    }	

    public void setFechaSalida(Date fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public String getMotivo() {
        return motivo;
    }	

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getDiagnostico() {
        return diagnostico;
    }	

    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }

    public String getTratamiento() {
        return tratamiento;
    }	

    public void setTratamiento(String tratamiento) {
        this.tratamiento = tratamiento;
    }

    public String getDieta() {
        return dieta;
    }	

    public void setDieta(String dieta) {
        this.dieta = dieta;
    }

    public Date getProximaVisita() {
        return proximaVisita;
    }	

    public void setProximaVisita(Date proximaVisita) {
        this.proximaVisita = proximaVisita;
    }

    public Mascota getMascota() {
        return mascota;
    }

    public void setMascota(Mascota mascota) {
        this.mascota = mascota;
    }
    public Veterinario getVeterinario() {
        return veterinario;
    }

    public void setVeterinario(Veterinario veterinario) {
        this.veterinario = veterinario;
    }

    public boolean isFinalizado() {
        return finalizado;
    }

    public void setFinalizado(boolean finalizado) {
        this.finalizado = finalizado;
    }
    
    
}