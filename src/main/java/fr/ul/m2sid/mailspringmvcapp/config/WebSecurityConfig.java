package fr.ul.m2sid.mailspringmvcapp.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/resources/**", "webapp/**").permitAll()
                .anyRequest().authenticated();

        http
                .authorizeRequests()
                .antMatchers("/send-mail", "/check-mail")
                .authenticated();

        http
                .formLogin()
                .loginPage("/login")
                .permitAll()
                .and()
                .antMatcher("/logout")
                .logout()
                .permitAll()
                /*.and()
                .csrf()
                .disable()*/;
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .inMemoryAuthentication()
                .withUser("test")
                .password("test")
                .roles("USER");
    }
}