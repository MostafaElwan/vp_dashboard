package net.qeema.vpdashboard.kpiservice.manager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import net.qeema.vpdashboard.kpiservice.domain.DetailItem;
import net.qeema.vpdashboard.kpiservice.domain.KPI;
import net.qeema.vpdashboard.kpiservice.repository.DetailedItemRepository;
import net.qeema.vpdashboard.kpiservice.repository.KPIRepository;

@Component
public class KPIManager {
	
	@Autowired
    private KPIRepository kpiRepository;
    
    @Autowired
    private DetailedItemRepository detailedItemRepository;
    
    public List<KPI> getAll() {
    	List<KPI> kpis = new ArrayList<KPI>();
    	Iterable<KPI> itr = kpiRepository.findAll();
        itr.forEach(kpis::add);
    	return kpis;
    }
    
  public boolean exist(Long id) {
	  return kpiRepository.existsById(id);
	}
    
    public KPI get(String title) {
        return kpiRepository.findByTitle(title);
    }
    
	public KPI saveKPI(KPI kpi) {
		KPI saved = kpiRepository.save(kpi);
        List<DetailItem> details = kpi.getDetailItems();
        for(DetailItem di : details) {
        	di.setKpi(saved);
        	detailedItemRepository.save(di);
        }
        return saved;
	}
	
	public void deleteKPI(String title) {
		KPI old = kpiRepository.findByTitle(title);
		if(old != null) {
			List<DetailItem> details = old.getDetailItems();
	        for(DetailItem di : details) {
	        	di.setKpi(old);
	        	detailedItemRepository.delete(di);
	        }
			kpiRepository.delete(old);
		}
	}

}
