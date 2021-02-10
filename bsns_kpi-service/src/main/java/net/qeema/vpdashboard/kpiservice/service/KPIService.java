package net.qeema.vpdashboard.kpiservice.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.qeema.vpdashboard.kpiservice.domain.DetailItem;
import net.qeema.vpdashboard.kpiservice.domain.DetailItemAudit;
import net.qeema.vpdashboard.kpiservice.domain.DetailItemHistory;
import net.qeema.vpdashboard.kpiservice.domain.KPI;
import net.qeema.vpdashboard.kpiservice.domain.KPIAudit;
import net.qeema.vpdashboard.kpiservice.domain.KPIHistory;
import net.qeema.vpdashboard.kpiservice.repository.AuditRepository;
import net.qeema.vpdashboard.kpiservice.repository.DetailedItemAuditRepository;
import net.qeema.vpdashboard.kpiservice.repository.DetailedItemHistoryRepository;
import net.qeema.vpdashboard.kpiservice.repository.DetailedItemRepository;
import net.qeema.vpdashboard.kpiservice.repository.HistoryRepository;
import net.qeema.vpdashboard.kpiservice.repository.KPIRepository;
 
@Service
public class KPIService {
    
    @Autowired
    private KPIRepository kpiRepository;
    
    @Autowired
    private DetailedItemRepository detailedItemRepository;
    
    @Autowired
    private HistoryRepository historyRepository;
    
    @Autowired
    private DetailedItemHistoryRepository detailedItemHistoryRepository;
    
    @Autowired
    private AuditRepository auditRepository;
    
    @Autowired
    private DetailedItemAuditRepository detailedItemAuditRepository;

    private boolean existsById(Long id) {
        return kpiRepository.existsById(id);
    }
    
    public List<KPI> findAll() {
    	List<KPI> kpis = new ArrayList<KPI>();
    	Iterable<KPI> itr = kpiRepository.findAll();
        itr.forEach(kpis::add);
    	return kpis;
    }
    
	public KPI findByTitle(String title) {
        return kpiRepository.findByTitle(title);
    }
	
	@Transactional
	public KPI create(KPI kpi) {
		KPI old = kpiRepository.findByTitle(kpi.getTitle());
		if(old != null) {
			List<DetailItem> details = old.getDetailItems();
	        for(DetailItem di : details) {
	        	di.setKpi(old);
	        	detailedItemRepository.delete(di);
	        }
			kpiRepository.delete(old);
		}
		
        KPI saved = kpiRepository.save(kpi);
        List<DetailItem> details = kpi.getDetailItems();
        for(DetailItem di : details) {
        	di.setKpi(saved);
        	detailedItemRepository.save(di);
        }
        
//        if(kpi.getKeepHistory()) {
        	KPIHistory history = KPIHistory.from(saved);
            KPIHistory savedHistory = historyRepository.save(history);
            for(DetailItem di : details) {
    			DetailItemHistory dih = DetailItemHistory.from(di);
            	dih.setKpi(savedHistory);
            	detailedItemHistoryRepository.save(dih);
            }
//        }
		
		KPIAudit audit = KPIAudit.from(saved);
		audit.setOperation("Insert");
		KPIAudit savedAudit = auditRepository.save(audit);
		for(DetailItem di : details) {
			DetailItemAudit dia = DetailItemAudit.from(di);
        	dia.setAudit(savedAudit);
        	detailedItemAuditRepository.save(dia);
        }
		
        return saved;
    }

	@Transactional
    public KPI update(KPI kpi) throws Exception {
        if (!existsById(kpi.getId())) 
            throw new Exception("Cannot find a kpi with id: " + kpi.getId());

        
        KPI updated = kpiRepository.save(kpi);
        List<DetailItem> details = kpi.getDetailItems();
        for(DetailItem di : details) {
        	di.setKpi(updated);
        	detailedItemRepository.save(di);
        }
        
//        if(kpi.getKeepHistory()) {
        	KPIHistory history = KPIHistory.from(updated);
            KPIHistory savedHistory = historyRepository.save(history);
            for(DetailItem di : details) {
    			DetailItemHistory dih = DetailItemHistory.from(di);
            	dih.setKpi(savedHistory);
            	detailedItemHistoryRepository.save(dih);
            }
//        }
        
        KPIAudit audit = KPIAudit.from(updated);
		audit.setOperation("Update");
		auditRepository.save(audit);
		for(DetailItem di : details) {
			DetailItemAudit dia = DetailItemAudit.from(di);
        	dia.setAudit(audit);
        	detailedItemAuditRepository.save(dia);
        }
		
		return updated;
    }
    
    @Transactional
    public KPI publish(KPI kpi) throws Exception {
        if (!existsById(kpi.getId())) 
            throw new Exception("Cannot find a kpi with id: " + kpi.getId());

        kpi.setPublishDate(new Date());
        KPI updated = kpiRepository.save(kpi);
        List<DetailItem> details = kpi.getDetailItems();
        for(DetailItem di : details) {
        	di.setKpi(updated);
        	detailedItemRepository.save(di);
        }
        
//        if(kpi.getKeepHistory()) {
        	KPIHistory history = KPIHistory.from(updated);
            KPIHistory savedHistory = historyRepository.save(history);
            for(DetailItem di : details) {
    			DetailItemHistory dih = DetailItemHistory.from(di);
            	dih.setKpi(savedHistory);
            	detailedItemHistoryRepository.save(dih);
            }
//        }
        
        KPIAudit audit = KPIAudit.from(updated);
		audit.setOperation("Publish");
		auditRepository.save(audit);
		for(DetailItem di : details) {
			DetailItemAudit dia = DetailItemAudit.from(di);
        	dia.setAudit(audit);
        	detailedItemAuditRepository.save(dia);
        }
		
		return updated;
    }
    
    @Transactional
    public void deleteById(Long id) throws Exception {
        KPI kpi = kpiRepository.findById(id).orElse(null);
        if (kpi == null) 
            throw new Exception("Cannot find a kpi with id: " + id);        
            
        kpiRepository.deleteById(id);
        
        KPIAudit audit = KPIAudit.from(kpi);
		audit.setOperation("Delete");
		auditRepository.save(audit);
    }
	
	public List<KPIHistory> findHistoryByTitle(String title) {
        return historyRepository.findByTitle(title).orElse(new ArrayList<KPIHistory>());
    }
	
	public List<KPIAudit> findAuditByTitle(String title) throws Exception {
		List<KPIAudit> audit = auditRepository.findAllByKpi(title);
        return audit;
    }
	
}