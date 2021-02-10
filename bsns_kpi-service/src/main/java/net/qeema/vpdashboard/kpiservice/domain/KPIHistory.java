package net.qeema.vpdashboard.kpiservice.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.validation.annotation.Validated;

import lombok.Data;
 
@Validated
@Entity
@Table(name = "Kpi_basic_info_history", indexes = {@Index(name = "title_index",  columnList="title")})
@EntityListeners(AuditingEntityListener.class)
@Data
public class KPIHistory implements Serializable {
 
    private static final long serialVersionUID = 5057388942388599423L;
 
    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false, updatable = false)
    private String title;
    
    @Column(nullable = false)
    private String caption;
 
    @Column(nullable = false, updatable = false)
    @CreatedDate
    private Date createdAt;
    
    @Column(nullable = false, updatable = false)
    private String createdBy;
 
    private Date updatedAt;
    
    private String updatedBy;
    
    private Date publishDate;
    
    private float overallValue;
    
    private float overallThreshold;
    
    @OneToMany(targetEntity = DetailItemHistory.class, 
    		mappedBy = "kpi", 
    		orphanRemoval = false, 
    		fetch = FetchType.LAZY)
    private List<DetailItemHistory> detailItems = new ArrayList<DetailItemHistory>();
    
    @OneToMany(targetEntity = AdminItemHistory.class, 
    		mappedBy = "kpi", 
    		orphanRemoval = false, 
    		fetch = FetchType.LAZY)
    private List<AdminItemHistory> adminItems = new ArrayList<AdminItemHistory>();
    
    
	public static KPIHistory from(KPI kpi) {
		KPIHistory history = new KPIHistory();
		
		history.setId(kpi.getId());
		history.setTitle(kpi.getTitle());
		history.setCaption(kpi.getCaption());
		history.setCreatedAt(kpi.getCreatedAt());
		history.setCreatedBy(kpi.getCreatedBy());
		history.setUpdatedAt(kpi.getUpdatedAt());
		history.setUpdatedBy(kpi.getUpdatedBy());
		
		List<DetailItemHistory> detailedItemsHistory = new ArrayList<DetailItemHistory>();
		List<DetailItem> detailedItems = kpi.getDetailItems();
		if(detailedItems != null && detailedItems.size() > 0) {
			for(DetailItem di : detailedItems) {
				
				DetailItemHistory dih = DetailItemHistory.from(di);
				detailedItemsHistory.add(dih);
				
				history.setDetailItems(detailedItemsHistory);
			}
		}
		
		List<AdminItemHistory> adminItemHistory = new ArrayList<AdminItemHistory>();
		List<AdminItem> adminItems = kpi.getAdminItems();
		if(adminItems != null && adminItems.size() > 0) {
			for(AdminItem ai : adminItems) {
				
				AdminItemHistory aih = AdminItemHistory.from(ai);
				adminItemHistory.add(aih);
				
				history.setAdminItems(adminItemHistory);
			}
		}
		
		
		return history;
	}
 

}