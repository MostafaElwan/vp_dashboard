package net.qeema.vpdashboard.kpiservice.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import net.qeema.vpdashboard.kpiservice.model.domain.DetailItemHistory;
 
public interface DetailedItemHistoryRepository 
	extends PagingAndSortingRepository<DetailItemHistory, Long>, JpaSpecificationExecutor<DetailItemHistory> {
	
}
