package br.com.bitbank.configuracao;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Profile;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Profile("prod")
@EnableTransactionManagement
public class JPAProductionConfiguration {

	@Autowired
	private Environment environment;

    @Bean
    public Properties additionalProperties() {
        Properties props = new Properties();
        props.setProperty("hibernate.dialect", "org.hibernate.dialect.Progress95Dialect");
        props.setProperty("hibernate.show_sql", "true");
        props.setProperty("hibernate.hbm2ddl.auto", "create"); 
        
        
        return props;
    }

//	@Bean
//	private Properties additionalProperties() {
//		Properties props = new Properties();
//		props.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
//		props.setProperty("hibernate.show_sql", "true");
//		props.setProperty("hibernate.hbm2ddl.auto", "create");
//
//		return props;
//	}

	@Bean
	public DataSource dataSource() throws URISyntaxException {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("org.postgresql.Driver");

		URI dbUrl = new URI(environment.getProperty("DATABASE_URL"));
		dataSource.setUrl("jdbc:postgresql://" + dbUrl.getHost() + ":" + dbUrl.getPort() + dbUrl.getPath());
		dataSource.setUsername(dbUrl.getUserInfo().split(":")[0]);
		dataSource.setPassword(dbUrl.getUserInfo().split(":")[1]);

		return dataSource;
	}
	
//	@Bean
//	public DataSource dataSource() throws URISyntaxException {
//		DriverManagerDataSource dataSource = new DriverManagerDataSource();
//		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
//		
//		URI dbUrl = new URI(environment.getProperty("JAWSDB_URL"));
//		dataSource.setUrl("jdbc:mysql2://" + dbUrl.getHost() + ":" + dbUrl.getPort() + dbUrl.getPath());
//		dataSource.setUsername(dbUrl.getUserInfo().split(":")[0]);
//		dataSource.setPassword(dbUrl.getUserInfo().split(":")[1]);
//		
//		return dataSource;
//	}



}
