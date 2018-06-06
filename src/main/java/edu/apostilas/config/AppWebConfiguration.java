package edu.apostilas.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.format.datetime.DateFormatterRegistrar;
import org.springframework.format.support.DefaultFormattingConversionService;
import org.springframework.format.support.FormattingConversionService;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
//import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import edu.apostilas.controllers.HomeController;
import edu.apostilas.dao.AlunoDAO;
import edu.apostilas.dao.ApostilaDAO;
import edu.apostilas.dao.ApostilaXAlunoDAO;
import edu.apostilas.dao.MovimentoDAO;
import edu.apostilas.dao.UsuarioDAO;
import edu.apostilas.interceptor.AutorizadorInterceptor;

@EnableWebMvc
@ComponentScan(basePackageClasses= {HomeController.class, UsuarioDAO.class, ApostilaDAO.class, AlunoDAO.class, 
		ApostilaXAlunoDAO.class, MovimentoDAO.class})
public class AppWebConfiguration extends WebMvcConfigurerAdapter {
	
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
	@Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new AutorizadorInterceptor());
	}

	@Bean
	public FormattingConversionService mvcConversionService() {
		DefaultFormattingConversionService service = 
				new DefaultFormattingConversionService();
		DateFormatterRegistrar registrar = new DateFormatterRegistrar();
		registrar.setFormatter(new DateFormatter("dd/MM/yyyy"));
		registrar.registerFormatters(service);
		
		return service;
	}
	
}
