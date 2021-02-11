package net.qeema.vpdashboard.kpiservice.model.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.validation.annotation.Validated;

import lombok.Data;
 
@Validated
@Entity
@Table(name = "Kpi_basic_info_audit")
@EntityListeners(AuditingEntityListener.class)
@Data
public class KPIAudit implements Serializable {
 
    private static final long serialVersionUID = 5057388942388599423L;
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false, updatable = false)
    private Long kpiId;
    
    @Column(nullable = false, updatable = false)
    @CreatedDate
    private Date createdAt;
    
    @Column(nullable = false, updatable = false)
    private String createdBy;
 
    @Column(nullable = false, updatable = false)
    private String operation;

    @OneToMany(targetEntity = DetailItemAudit.class, 
    		mappedBy = "audit", 
    		orphanRemoval = false, 
    		fetch = FetchType.LAZY)
    private List<DetailItemAudit> detailItems = new ArrayList<DetailItemAudit>();
    
    @OneToMany(targetEntity = AdminItemAudit.class, 
    		mappedBy = "audit", 
    		orphanRemoval = false, 
    		fetch = FetchType.LAZY)
    private List<AdminItemAudit> adminItems = new ArrayList<AdminItemAudit>();
    
    
	public static KPIAudit from(KPI kpi) {
		KPIAudit audit = new KPIAudit();
		
		audit.setKpiId(kpi.getId());
		audit.setCreatedAt(kpi.getUpdatedAt() != null ? kpi.getUpdatedAt() : kpi.getCreatedAt());
		audit.setCreatedBy(kpi.getUpdatedBy() != null ? kpi.getUpdatedBy() : kpi.getCreatedBy());
		
		List<DetailItemAudit> detailedItemsAudit = new ArrayList<DetailItemAudit>();
		List<DetailItem> detailedItems = kpi.getDetailItems();
		if(detailedItems != null && detailedItems.size() > 0) {
			for(DetailItem di : detailedItems) {
				
				DetailItemAudit dia = DetailItemAudit.from(di);
				detailedItemsAudit.add(dia);
				
				audit.setDetailItems(detailedItemsAudit);
			}
		}
		
		List<AdminItemAudit> adminItemAudit = new ArrayList<AdminItemAudit>();
		List<AdminItem> adminItems = kpi.getAdminItems();
		if(adminItems != null && adminItems.size() > 0) {
			for(AdminItem ai : adminItems) {
				
				AdminItemAudit aia = AdminItemAudit.from(ai);
				adminItemAudit.add(aia);
				
				audit.setAdminItems(adminItemAudit);
			}
		}
		
		return audit;
	}
 

}