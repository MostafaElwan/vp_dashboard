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
import javax.persistence.Index;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.validation.annotation.Validated;

import lombok.Data;
 
@Validated
@Entity
@Table(name = "Kpi_basic_info", indexes = {@Index(name = "title_index",  columnList="title")})
@EntityListeners(AuditingEntityListener.class)
@Data
public class KPI implements Serializable {
 
    private static final long serialVersionUID = 5057388942388599423L;
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
    
//    @Column(columnDefinition = "boolean default false")
//    private Boolean keepHistory;
    
    @Column(columnDefinition = "boolean default true")
    private Boolean keepAudit;
    
    @OneToMany(targetEntity = DetailItem.class, 
    		mappedBy = "kpi", 
    		orphanRemoval = false, 
    		fetch = FetchType.LAZY)
    private List<DetailItem> detailItems = new ArrayList<DetailItem>();
    
    @OneToMany(targetEntity = AdminItem.class, 
    		mappedBy = "kpi", 
    		orphanRemoval = false, 
    		fetch = FetchType.LAZY)
    private List<AdminItem> adminItems = new ArrayList<AdminItem>();
    
    
}