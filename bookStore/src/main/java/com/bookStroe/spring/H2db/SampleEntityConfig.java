package com.bookStroe.spring.H2db;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;


/**
 * Bean설정 파일을 사용하지 않고 클래스로 정의할 수 있음. 이전에 dbbean.xml에서 엔티티 관리자 팩토리를 준비했지만, 클래스를 사용하여 같은 것을 만듦
 * 아래와 같이 구현함으로써 이 클래스를 사용함으로써, Bean을 작성할 수 있음
 * dbbean.xml 불필요
 * persistence.xml 불필요
 * application.properties 불필요 -> 클래스에 직접 값을 쓰고 있기 때문.
 * 
 * 클래스를 사용하는 것이 보다 깔끔하게 엔티티 관리자를 준비할 수 있다는 것을 알 수 있음
 */


@Configuration 
public class SampleEntityConfig {

	@Bean
	public DataSource dataSource() {
		//DataSource의 작성
		EmbeddedDatabaseBuilder builder = new EmbeddedDatabaseBuilder(); //DataSource는 EmbeddedDatabaseBuilder라는 클래스의 인스턴스를 만든다
		
		return builder.setType(EmbeddedDatabaseType.H2).build(); //setType에서 데이터베이스 종류를 설정. build를 호출하면 생성됨.
	}
	
	
	@Bean
	public EntityManagerFactory entityManagerFactory() {
		//EntityManagerFactory 생성
		HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter(); //HibernateJpaVendorAdapter 인스턴스 생성
		vendorAdapter.setGenerateDdl(true);
		
		LocalContainerEntityManagerFactoryBean factory = new LocalContainerEntityManagerFactoryBean();
		factory.setJpaVendorAdapter(vendorAdapter);
		factory.setPackagesToScan("com.bookStore.spring.H2db");
		factory.setDataSource(dataSource());
		factory.afterPropertiesSet(); //호출
		
		return factory.getObject(); //EntityManager 인스턴스를 가져옴
	}
	
}
