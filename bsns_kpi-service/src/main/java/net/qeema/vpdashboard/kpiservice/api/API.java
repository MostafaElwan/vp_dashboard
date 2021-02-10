package net.qeema.vpdashboard.kpiservice.api;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.qeema.vpdashboard.kpiservice.domain.KPI;
import net.qeema.vpdashboard.kpiservice.domain.KPIAudit;
import net.qeema.vpdashboard.kpiservice.domain.KPIHistory;
import net.qeema.vpdashboard.kpiservice.service.KPIService;

@Api(tags = { "KPI operations" })
@RestController
@RequestMapping(path = "/api/kpis")
public class API {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private KPIService kpiService;
	
	@ApiOperation("Returns all KPIs")
	@GetMapping(value = {""})
	public List<KPI> fetchAllKPIs() throws Exception {
		logger.info("fetchAllKPIs just started ...");
		
		List<KPI> kpis = kpiService.findAll();
		
		logger.info("fetchAllKPIs finished successfully");
		return kpis;
	}
	
	@ApiOperation("Returns the KPI corresponding to a specific title that is passed as a path variable")
	@GetMapping(value = {"/{title}"})
	public KPI fetchKPI(@PathVariable String title) throws Exception {
		logger.info("fetchKPI just started ...");
		
		KPI kpi = kpiService.findByTitle(title);
		
		logger.info("fetchKPI finished successfully");
		return kpi;
	}
	
	@ApiOperation("Returns the KPI history which is corresponding to a specific title that is passed as a path variable")
	@GetMapping(value = {"/history/{title}"})
	public List<KPIHistory> fetchHistory(@PathVariable String title) throws Exception {
		logger.info("fetchHistory just started ...");
		
		List<KPIHistory> history = kpiService.findHistoryByTitle(title);
		
		logger.info("fetchHistory finished successfully");
		return history;
	}
	
	@ApiOperation("Returns the KPI audit which is corresponding to a specific title that is passed as a path variable")
	@GetMapping(value = {"/audit/{title}"})
	public List<KPIAudit> fetchAudit(@PathVariable String title) throws Exception {
		logger.info("fetchAudit just started ...");
		
		List<KPIAudit> audit = kpiService.findAuditByTitle(title);
		
		logger.info("fetchAudit finished successfully");
		return audit;
	}
	
	@PostMapping(value = {""})
	public KPI createKPI(@RequestBody KPI kpi) {
		logger.info("createKPI just started ...");
		
		KPI created = kpiService.create(kpi);
		
		logger.info("createKPI finished successfully");
		return created;
	}
	
	@PutMapping(value = {""})
	public KPI updateKPI(@RequestBody KPI kpi) throws Exception {
		logger.info("updateKPI just started ...");
		
		KPI updated = kpiService.update(kpi);
		
		logger.info("updateKPI finished successfully");
		return updated;
	}
	
	@PutMapping(value = {"/publish"})
	public KPI publishKPI(@RequestBody KPI kpi) throws Exception {
		logger.info("publishKPI just started ...");
		
		KPI updated = kpiService.publish(kpi);
		
		logger.info("publishKPI finished successfully");
		return updated;
	}
	
	@DeleteMapping(value = {""})
	public void deleteKPI(@RequestBody KPI kpi) throws Exception {
		logger.info("deleteKPI just started ...");
		
		kpiService.deleteById(kpi.getId());
		
		logger.info("deleteKPI finished successfully");
	}
}
