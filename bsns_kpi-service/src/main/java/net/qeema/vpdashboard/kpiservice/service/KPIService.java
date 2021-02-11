package net.qeema.vpdashboard.kpiservice.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.qeema.vpdashboard.kpiservice.domain.KPI;
import net.qeema.vpdashboard.kpiservice.domain.KPIAudit;
import net.qeema.vpdashboard.kpiservice.domain.KPIHistory;
import net.qeema.vpdashboard.kpiservice.manager.AuditManager;
import net.qeema.vpdashboard.kpiservice.manager.HistoryManager;
import net.qeema.vpdashboard.kpiservice.manager.KPIManager;
 
@Service
public class KPIService {
    
	@Autowired
    private KPIManager kpiManager;
	
    @Autowired
    private HistoryManager historyManager;
    
    @Autowired
    private AuditManager auditManager;
    
    public List<KPI> findAll() {
    	return kpiManager.getAll();
    }
    
	public KPI findByTitle(String title) {
        return kpiManager.get(title);
    }
	
	@Transactional
	public KPI create(KPI kpi) {
		kpiManager.deleteKPI(kpi.getTitle());

		KPI saved = kpiManager.saveKPI(kpi);
        historyManager.saveHistory(saved);
        auditManager.addAudit(saved, "Insert");
		
        return saved;
    }

	@Transactional
    public KPI update(KPI kpi) throws Exception {
        if (!kpiManager.exist(kpi.getId())) 
            throw new Exception("Cannot find a kpi with id: " + kpi.getId());
        
        KPI saved = kpiManager.saveKPI(kpi);
        historyManager.saveHistory(saved);
        auditManager.addAudit(saved, "Updated");
		
		return saved;
    }
    
    @Transactional
    public KPI publish(KPI kpi) throws Exception {
        if (!kpiManager.exist(kpi.getId())) 
            throw new Exception("Cannot find a kpi with id: " + kpi.getId());

        kpi.setPublishDate(new Date());

        KPI saved = kpiManager.saveKPI(kpi);
        historyManager.saveHistory(kpi);
        auditManager.addAudit(kpi, "Publish");
		
		return saved;
    }
    
	public List<KPIHistory> findHistoryByTitle(String title) {
        return historyManager.get(title);
    }
	
	public List<KPIAudit> findAuditByTitle(String title) throws Exception {
		return auditManager.get(title);
    }
	
}