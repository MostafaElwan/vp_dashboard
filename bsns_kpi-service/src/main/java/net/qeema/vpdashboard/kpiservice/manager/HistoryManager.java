package net.qeema.vpdashboard.kpiservice.manager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import net.qeema.vpdashboard.kpiservice.model.domain.DetailItem;
import net.qeema.vpdashboard.kpiservice.model.domain.DetailItemHistory;
import net.qeema.vpdashboard.kpiservice.model.domain.KPI;
import net.qeema.vpdashboard.kpiservice.model.domain.KPIHistory;
import net.qeema.vpdashboard.kpiservice.repository.DetailedItemHistoryRepository;
import net.qeema.vpdashboard.kpiservice.repository.HistoryRepository;

@Component
public class HistoryManager {
	
	@Autowired
    private HistoryRepository historyRepository;
    
    @Autowired
    private DetailedItemHistoryRepository detailedItemHistoryRepository;
    
	public void save(KPI kpi) {
		KPIHistory history = KPIHistory.from(kpi);
        KPIHistory savedHistory = historyRepository.save(history);
        
        List<DetailItem> details = kpi.getDetailItems();
        for(DetailItem di : details) {
			DetailItemHistory dih = DetailItemHistory.from(di);
        	dih.setKpi(savedHistory);
        	detailedItemHistoryRepository.save(dih);
        }
	}
	
	public List<KPIHistory> get(String title) {
		return historyRepository.findByTitle(title).orElse(new ArrayList<KPIHistory>());
	}

}
