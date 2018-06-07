package edu.apostilas.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.apostilas.dao.ApostilaDAO;
import edu.apostilas.dao.LogApostilaDAO;
import edu.apostilas.dao.MovimentoDAO;
import edu.apostilas.models.Apostila;
import edu.apostilas.models.LogApostila;
import edu.apostilas.models.Movimento;
import edu.apostilas.models.TipoApostila;
import edu.apostilas.models.TipoMovimento;
import edu.apostilas.models.Usuario;

@Controller
public class ApostilaController {
	
	@Autowired
	private ApostilaDAO apostilaDao;
	
	@Autowired
	private MovimentoDAO movimentoDao;
	
	@Autowired
	private LogApostilaDAO logApostiaDao;
	
	@RequestMapping("/apostilas/novo")
	public ModelAndView novoForm() {
		ModelAndView model = new ModelAndView("apostilas/novo");
		model.addObject("tipos", TipoApostila.values());
		return model;
	}
	
	@RequestMapping(value = "/apostilas/novo", method = RequestMethod.POST)
	public ModelAndView gravar(Apostila apostila, RedirectAttributes redirectAttributes, HttpSession session) {
		ModelAndView model = new ModelAndView("redirect:/apostilas/novo");
		
		Apostila apostilaExistente = apostilaDao.findApostila(apostila);
		if(apostilaExistente != null) {
			redirectAttributes.addFlashAttribute("erro", "Esta apostila já foi cadastrada!");
			return model;
		}
		
		apostilaDao.gravar(apostila);
		gravaLog(apostila, session, "Inserção", "", apostila.toString2());
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
	public ModelAndView alterar(Apostila apostila, RedirectAttributes redirectAttributes, HttpSession session) {
		ModelAndView model = new ModelAndView("redirect:/apostilas/consulta");
		
		String antes = apostilaDao.findApostila(apostila.getIdApostila()).toString2();
		
		boolean result = apostilaDao.alterar(apostila);
		if(result) {
			gravaLog(apostila, session, "Alteração", antes, apostila.toString2());
			redirectAttributes.addFlashAttribute("sucesso", "Apostila alterada com sucesso!");
		}
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
	public ModelAndView adicionar(Apostila apostila, RedirectAttributes redirectAttributes, HttpSession session) {
		ModelAndView model = new ModelAndView("redirect:/apostilas/consulta");
		
		DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy-HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		Movimento movimento = new Movimento();
		movimento.setDt(sdf.format(cal.getTime()));
		movimento.setQuantidade(apostila.getQuantidade());
		movimento.setApostila(apostila);
		movimento.setTipo(TipoMovimento.Entrada);
		movimento.setUser((Usuario)session.getAttribute("usuarioLogado"));
		movimentoDao.gravar(movimento);
		boolean result = apostilaDao.adicionar(apostila);
		if(result)
			redirectAttributes.addFlashAttribute("sucesso", "Apostila adicionada com sucesso!");
		else
			redirectAttributes.addFlashAttribute("erro", "Apostila não foi adicionada!");
			
		return model;
	}
	
	public void gravaLog(Apostila apostila, HttpSession session, String transacao, String antes, String depois) {
		DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy-HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		LogApostila logApostila = new LogApostila();
		logApostila.setApostila(apostila);
		logApostila.setTransacao(transacao);
		logApostila.setDt(sdf.format(cal.getTime()));
		logApostila.setUser((Usuario)session.getAttribute("usuarioLogado"));
		logApostila.setAntes(antes);
		logApostila.setDepois(depois);
		logApostiaDao.gravar(logApostila);
	}
}
