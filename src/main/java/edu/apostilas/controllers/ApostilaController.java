package edu.apostilas.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.apostilas.dao.ApostilaDAO;
import edu.apostilas.models.Apostila;
import edu.apostilas.models.TipoApostila;

@Controller
public class ApostilaController {
	
	@Autowired
	private ApostilaDAO apostilaDao;
	
	@RequestMapping("/apostilas/novo")
	public ModelAndView novoForm() {
		ModelAndView model = new ModelAndView("apostilas/novo");
		model.addObject("tipos", TipoApostila.values());
		return model;
	}
	
	@RequestMapping(value = "/apostilas/novo", method = RequestMethod.POST)
	public ModelAndView gravar(Apostila apostila, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/apostilas/novo");
		
		Apostila apostilaExistente = apostilaDao.findApostila(apostila);
		if(apostilaExistente != null) {
			redirectAttributes.addFlashAttribute("erro", "Esta apostila já foi cadastrada!");
			return model;
		}
		
		apostilaDao.gravar(apostila);
		redirectAttributes.addFlashAttribute("sucesso", "Apostila cadastrada com sucesso!");
		return model;
	}
	
	@RequestMapping("/apostilas/consulta")
	public ModelAndView listar() {
		ModelAndView model = new ModelAndView("apostilas/consulta");
		List<Apostila> apostilas = apostilaDao.listar();
		model.addObject("apostilas", apostilas);
		model.addObject("tipos", TipoApostila.values());
		return model;
	}
	
	/*
	@RequestMapping("/apostilas/detalhe/{id}")
	public ModelAndView detalhe(@PathVariable("id") Integer id) {
		ModelAndView model = new ModelAndView("apostilas/detalhe");
		Apostila apostila = apostilaDao.findApostila(id);
		model.addObject("apostila", apostila);
		model.addObject("tipos", TipoApostila.values());
		return model;
	}*/
	
	@RequestMapping(value = "/apostilas/detalhe", method = RequestMethod.POST)
	public ModelAndView alterar(Apostila apostila, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/apostilas/consulta");
		boolean result = apostilaDao.alterar(apostila);
		if(result)
			redirectAttributes.addFlashAttribute("sucesso", "Apostila alterada com sucesso!");
		else
			redirectAttributes.addFlashAttribute("erro", "Apostila não foi alterada!");
			
		return model;
	}
	
	/*
	@RequestMapping("/apostilas/adiciona/{id}")
	public ModelAndView quantidadeForm(@PathVariable("id") Integer id) {
		ModelAndView model = new ModelAndView("apostilas/adiciona");
		Apostila apostila = apostilaDao.findApostila(id);
		model.addObject("apostila", apostila);
		return model;
	}*/
	
	@RequestMapping(value = "/apostilas/adiciona", method = RequestMethod.POST)
	public ModelAndView adicionar(Apostila apostila, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/apostilas/consulta");
		boolean result = apostilaDao.adicionar(apostila);
		if(result)
			redirectAttributes.addFlashAttribute("sucesso", "Apostila adicionada com sucesso!");
		else
			redirectAttributes.addFlashAttribute("erro", "Apostila não foi adicionada!");
			
		return model;
	}
}
