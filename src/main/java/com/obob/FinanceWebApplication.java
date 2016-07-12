package com.obob;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;

//@ImportResource({"classpath:/spring/spring-cache.xml"})

@SpringBootApplication
@ComponentScan(basePackages={"com.obob"})
@PropertySource("classpath:config.properties")
public class FinanceWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(FinanceWebApplication.class, args);
	}
}
