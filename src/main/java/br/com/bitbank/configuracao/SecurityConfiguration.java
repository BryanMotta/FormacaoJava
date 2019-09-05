package br.com.bitbank.configuracao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import br.com.bitbank.dao.UsuarioDAO;

@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{

	
	@Autowired
    private UsuarioDAO usuarioDao;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) 
            throws Exception {

        auth.userDetailsService(usuarioDao)
            .passwordEncoder(new BCryptPasswordEncoder());
    }
    
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		

		
	    http.authorizeRequests()
	    .antMatchers("/resources/**").permitAll()
	    .antMatchers("/url-magica-maluca-dsdhASDSDJJALDJIJEJ5618461646163484AJHAKHINSKFAHWid").permitAll()
	    .antMatchers("/cliente/lista").hasRole("ADMIN")
	    .antMatchers("/transacoes/**").authenticated()
	    .antMatchers("/novo-cliente/cadastrar").permitAll()
	    .antMatchers("/").permitAll()
	    .anyRequest().authenticated()
	    .and().formLogin().loginPage("/login")
        .defaultSuccessUrl("/").permitAll()
    .and().logout()
        .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
            .permitAll().logoutSuccessUrl("/login"); 
	}
}
