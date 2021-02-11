package net.qeema.vpdashboard.kpiservice.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.qeema.vpdashboard.kpiservice.manager.AuditManager;
import net.qeema.vpdashboard.kpiservice.manager.HistoryManager;
import net.qeema.vpdashboard.kpiservice.manager.KPIManager;
import net.qeema.vpdashboard.kpiservice.model.AuditOperation;
import net.qeema.vpdashboard.kpiservice.model.domain.KPI;
import net.qeema.vpdashboard.kpiservice.model.domain.KPIAudit;
import net.qeema.vpdashboard.kpiservice.model.domain.KPIHistory;
 
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
		KPI old = kpiManager.get(kpi.getTitle());
		if(old != null)
		kpiManager.delete(old);

		KPI saved = kpiManager.save(kpi);
        historyManager.save(saved);
        
        if(saved.getKeepAudit())
        	auditManager.save(saved, AuditOperation.CREATE);
		
        return saved;
    }

	@Transactional
    public KPI update(KPI kpi) throws Exception {
        if (!kpiManager.exist(kpi.getId())) 
            throw new Exception("Cannot find a kpi with id: " + kpi.getId());
        
        KPI saved = kpiManager.save(kpi);
        historyManager.save(saved);
        
        if(saved.getKeepAudit())
        	auditManager.save(saved, AuditOperation.UPDATE);
		
		return saved;
    }
    
	public List<KPIHistory> findHistoryByTitle(String title) {
        return historyManager.get(title);
    }
	
	public List<KPIAudit> findAuditByTitle(String title) throws Exception {
		return auditManager.get(title);
    }
	
}