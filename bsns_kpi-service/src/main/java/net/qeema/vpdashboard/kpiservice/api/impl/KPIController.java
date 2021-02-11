package net.qeema.vpdashboard.kpiservice.api.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.qeema.vpdashboard.kpiservice.api.KPIOperations;
import net.qeema.vpdashboard.kpiservice.model.domain.KPI;
import net.qeema.vpdashboard.kpiservice.model.domain.KPIAudit;
import net.qeema.vpdashboard.kpiservice.model.domain.KPIHistory;
import net.qeema.vpdashboard.kpiservice.service.KPIService;

@RestController
@RequestMapping(path = "/api/kpis")
public class KPIController implements KPIOperations {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private KPIService kpiService;
	
	public List<KPI> fetchAllKPIs() throws Exception {
		logger.info("fetchAllKPIs just started ...");
		
		List<KPI> kpis = kpiService.findAll();
		
		logger.info("fetchAllKPIs finished successfully");
		return kpis;
	}
	
	public KPI fetchKPI(@PathVariable String title) throws Exception {
		logger.info("fetchKPI just started ...");
		
		KPI kpi = kpiService.findByTitle(title);
		
		logger.info("fetchKPI finished successfully");
		return kpi;
	}
	
	public List<KPIHistory> fetchHistory(@PathVariable String title) throws Exception {
		logger.info("fetchHistory just started ...");
		
		List<KPIHistory> history = kpiService.findHistoryByTitle(title);
		
		logger.info("fetchHistory finished successfully");
		return history;
	}
	
	public List<KPIAudit> fetchAudit(@PathVariable String title) throws Exception {
		logger.info("fetchAudit just started ...");
		
		List<KPIAudit> audit = kpiService.findAuditByTitle(title);
		
		logger.info("fetchAudit finished successfully");
		return audit;
	}
	
	public KPI createKPI(@RequestBody KPI kpi) {
		logger.info("createKPI just started ...");
		
		KPI created = kpiService.create(kpi);
		
		logger.info("createKPI finished successfully");
		return created;
	}
	
	public KPI updateKPI(@RequestBody KPI kpi) throws Exception {
		logger.info("updateKPI just started ...");
		
		KPI updated = kpiService.update(kpi);
		
		logger.info("updateKPI finished successfully");
		return updated;
	}
	
}
