package net.qeema.vpdashboard.kpiservice.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import net.qeema.vpdashboard.kpiservice.model.domain.DetailItem;
import net.qeema.vpdashboard.kpiservice.model.domain.DetailItemAudit;
 
public interface DetailedItemAuditRepository 
	extends PagingAndSortingRepository<DetailItemAudit, Long>, JpaSpecificationExecutor<DetailItemAudit> {
	
}
