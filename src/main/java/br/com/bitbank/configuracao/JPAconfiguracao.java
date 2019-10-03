package br.com.bitbank.configuracao;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@EnableTransactionManagement
public class JPAconfiguracao {

	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory(DataSource dataSource, Properties additionalProperties) {
		LocalContainerEntityManagerFactoryBean factoryBean = new LocalContainerEntityManagerFactoryBean();
		JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
		factoryBean.setPackagesToScan("br.com.bitbank.modelo");

		factoryBean.setJpaVendorAdapter(vendorAdapter);
		factoryBean.setDataSource(dataSource);
		factoryBean.setJpaProperties(additionalProperties());
		

		return factoryBean;
	}

//	@Bean
//	@Profile("dev")
//	public DataSource dataSource() {
//		DriverManagerDataSource dataSource = new DriverManagerDataSource();
//		dataSource.setUsername("root");
//		dataSource.setPassword("0000");
//		dataSource.setUrl("jdbc:mysql://localhost:3306/bitbank?useTimezone=true&serverTimezone=UTC");
//		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
//
//		return dataSource;
//	}
//
//	@Bean
//	@Profile("dev")
//	private Properties additionalProperties() {
//        Properties props = new Properties();
//        props.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
//		props.setProperty("hibernate.show_sql", "true");
//		props.setProperty("hibernate.hbm2ddl.auto", "update");
//
//        return props;
//    }
	
	@Bean
	@Profile("dev")
	public DataSource dataSource() throws PropertyVetoException {
			ComboPooledDataSource dataSource = new ComboPooledDataSource();

		    dataSource.setDriverClass("org.postgresql.Driver");    
		    dataSource.setJdbcUrl("jdbc:postgresql://localhost:5432/bitbank");
		    dataSource.setUser("postgres");
		    dataSource.setPassword("0000");

		    dataSource.setMinPoolSize(3);
		    dataSource.setMaxPoolSize(5);

		    dataSource.setIdleConnectionTestPeriod(1);

			return dataSource;
	}
	
	@Bean
	@Profile("dev")
	private Properties additionalProperties() {
        Properties props = new Properties();
        props.setProperty("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
        props.setProperty("hibernate.show_sql", "true");
        props.setProperty("hibernate.hbm2ddl.auto", "update");
        
        return props;
    }
	
	@Bean
	public JpaTransactionManager transactionManager(EntityManagerFactory emf) {
		return new JpaTransactionManager(emf);
	}
}