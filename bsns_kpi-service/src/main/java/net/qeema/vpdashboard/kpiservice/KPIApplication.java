package net.qeema.vpdashboard.kpiservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.netflix.hystrix.dashboard.EnableHystrixDashboard;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
@EnableFeignClients
@EnableHystrix
@EnableHystrixDashboard
public class KPIApplication {

	public static void main(String[] args) {
		SpringApplication.run(KPIApplication.class, args);
	}

}
