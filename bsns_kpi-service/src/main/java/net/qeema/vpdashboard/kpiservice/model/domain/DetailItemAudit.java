package net.qeema.vpdashboard.kpiservice.model.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.validation.annotation.Validated;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
 
@Validated
@Entity
@Table(name = "Kpi_detailed_data_audit")
@EntityListeners(AuditingEntityListener.class)
@Data
public class DetailItemAudit  implements Serializable {
 
    private static final long serialVersionUID = 5057388942388599423L;
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
 
    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "audit_id", nullable = false)
	@Fetch(FetchMode.JOIN)
    private KPIAudit audit;
    
    @Column(nullable = false, updatable = false)
    private String title;
    
    @Column(nullable = false)
    private float value;
    
    private float threshold;

	public static DetailItemAudit from(DetailItem di) {
		DetailItemAudit dia = new DetailItemAudit();
		dia.setTitle(di.getTitle());
		dia.setValue(di.getValue());
		dia.setThreshold(di.getThreshold());
		return dia;
	}
 
}