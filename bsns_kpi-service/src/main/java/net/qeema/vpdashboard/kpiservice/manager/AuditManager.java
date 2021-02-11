package net.qeema.vpdashboard.kpiservice.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import net.qeema.vpdashboard.kpiservice.domain.DetailItem;
import net.qeema.vpdashboard.kpiservice.domain.DetailItemAudit;
import net.qeema.vpdashboard.kpiservice.domain.KPI;
import net.qeema.vpdashboard.kpiservice.domain.KPIAudit;
import net.qeema.vpdashboard.kpiservice.repository.AuditRepository;
import net.qeema.vpdashboard.kpiservice.repository.DetailedItemAuditRepository;

@Component
public class AuditManager {
	
	@Autowired
    private AuditRepository auditRepository;
    
    @Autowired
    private DetailedItemAuditRepository detailedItemAuditRepository;
    
	public void addAudit(KPI kpi, String operation) {
		KPIAudit audit = KPIAudit.from(kpi);
		audit.setOperation(operation);
		auditRepository.save(audit);
		
		List<DetailItem> details = kpi.getDetailItems();
		for(DetailItem di : details) {
			DetailItemAudit dia = DetailItemAudit.from(di);
        	dia.setAudit(audit);
        	detailedItemAuditRepository.save(dia);
        }
	}

	public List<KPIAudit> get(String title) throws Exception {
		List<KPIAudit> audit = auditRepository.findAllByKpi(title);
        return audit;
    }
}
