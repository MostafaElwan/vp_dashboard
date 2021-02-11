package net.qeema.vpdashboard.kpiservice.api;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.qeema.vpdashboard.kpiservice.domain.KPI;
import net.qeema.vpdashboard.kpiservice.domain.KPIAudit;
import net.qeema.vpdashboard.kpiservice.domain.KPIHistory;

@Api(tags = { "KPI operations" })
public interface KPIOperations {
	
	@ApiOperation("Returns all KPIs")
	@GetMapping(value = {""})
	public List<KPI> fetchAllKPIs() throws Exception;
	
	@ApiOperation("Returns the KPI corresponding to a specific title that is passed as a path variable")
	@GetMapping(value = {"/{title}"})
	public KPI fetchKPI(@PathVariable String title) throws Exception;
	
	@ApiOperation("Returns the KPI history which is corresponding to a specific title that is passed as a path variable")
	@GetMapping(value = {"/history/{title}"})
	public List<KPIHistory> fetchHistory(@PathVariable String title) throws Exception;
	
	@ApiOperation("Returns the KPI audit which is corresponding to a specific title that is passed as a path variable")
	@GetMapping(value = {"/audit/{title}"})
	public List<KPIAudit> fetchAudit(@PathVariable String title) throws Exception;
	
	@ApiOperation("Creates the received KPI object and stores it into database, then returning another object with full data after generating the corresponding parameters")
	@PostMapping(value = {""})
	public KPI createKPI(@RequestBody KPI kpi);
	
	@ApiOperation("Uodates the specified KPI which is being passed into the request body")
	@PutMapping(value = {""})
	public KPI updateKPI(@RequestBody KPI kpi) throws Exception;
	
	@ApiOperation("Publishes the passed KPI to display its values")
	@PutMapping(value = {"/publish"})
	public KPI publishKPI(@RequestBody KPI kpi) throws Exception;
	
}
