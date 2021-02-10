package net.qeema.vpdashboard.kpiservice.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import net.qeema.vpdashboard.kpiservice.domain.KPI;
 
public interface KPIRepository 
	extends PagingAndSortingRepository<KPI, Long>, JpaSpecificationExecutor<KPI> {
	
	KPI findByTitle(String title);
	
}
