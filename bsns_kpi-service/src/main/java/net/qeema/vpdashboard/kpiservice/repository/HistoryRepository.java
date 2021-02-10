package net.qeema.vpdashboard.kpiservice.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import net.qeema.vpdashboard.kpiservice.domain.KPIHistory;
 
public interface HistoryRepository 
	extends PagingAndSortingRepository<KPIHistory, Long>, JpaSpecificationExecutor<KPIHistory> {
	
	Optional<List<KPIHistory>> findByTitle(String title);
	
	
}
