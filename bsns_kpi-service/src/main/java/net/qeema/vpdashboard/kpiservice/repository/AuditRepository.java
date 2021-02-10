package net.qeema.vpdashboard.kpiservice.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import net.qeema.vpdashboard.kpiservice.domain.KPIAudit;
 
public interface AuditRepository 
	extends PagingAndSortingRepository<KPIAudit, Long>, JpaSpecificationExecutor<KPIAudit> {

	List<KPIAudit> findByKpiId(Long id);
	
	@Query("Select a from KPIAudit a Inner Join KPIHistory h on a.kpiId = h.id where h.title = ?1")
	List<KPIAudit> findAllByKpi(String title);
}
