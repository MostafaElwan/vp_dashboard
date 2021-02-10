package net.qeema.vpdashboard.zuulapigateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.context.annotation.Bean;

import net.qeema.vpdashboard.zuulapigateway.filter.MyErrorFilter;
import net.qeema.vpdashboard.zuulapigateway.filter.MyPostFilter;
import net.qeema.vpdashboard.zuulapigateway.filter.MyPreFilter;
import net.qeema.vpdashboard.zuulapigateway.filter.MyRouteFilter;

@SpringBootApplication
@EnableDiscoveryClient
@EnableZuulProxy
public class ZuulApiGatewayApplication {

	public static void main(String[] args) {
		SpringApplication.run(ZuulApiGatewayApplication.class, args);
	}
	
	@Bean
	public MyPreFilter preFilter() {
		return new MyPreFilter();
	}
	@Bean
	public MyPostFilter postFilter() {
		return new MyPostFilter();
	}
	@Bean
	public MyErrorFilter errorFilter() {
		return new MyErrorFilter();
	}
	@Bean
	public MyRouteFilter routeFilter() {
		return new MyRouteFilter();
	}

}
