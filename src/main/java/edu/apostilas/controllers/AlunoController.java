package edu.apostilas.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.apostilas.dao.AlunoDAO;
import edu.apostilas.dao.ApostilaDAO;
import edu.apostilas.dao.ApostilaXAlunoDAO;
import edu.apostilas.dao.MovimentoDAO;
import edu.apostilas.models.Aluno;
import edu.apostilas.models.Apostila;
import edu.apostilas.models.ApostilaXAluno;
import edu.apostilas.models.Movimento;
import edu.apostilas.models.Sexo;
import edu.apostilas.models.Status;
import edu.apostilas.models.TipoMovimento;
import edu.apostilas.models.Usuario;

@Controller
public class AlunoController {
	
	@Autowired
	private AlunoDAO alunoDao;
	
	@Autowired
	private ApostilaXAlunoDAO apostilaAlunoDao;
	
	@Autowired
	private ApostilaDAO apostilaDao;
	
	@Autowired
	private MovimentoDAO movimentoDao;
	
	@RequestMapping("/alunos/novo")
	public ModelAndView novoForm() {
		ModelAndView model = new ModelAndView("alunos/novo");
		model.addObject("sexos", Sexo.values());
		return model;
	}
	
	@RequestMapping(value = "/alunos/novo", method = RequestMethod.POST)
	public ModelAndView gravarAluno(Aluno aluno, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/alunos/novo");
		
		Aluno alunoExistente = alunoDao.findAluno(aluno.getCpf());
		if(alunoExistente != null) {
			redirectAttributes.addFlashAttribute("erro", "Este(a) aluno(a) já foi cadastrado(a)!");
			return model;
		}
		aluno.setStatus(Status.Ativo);
		alunoDao.gravar(aluno);
		redirectAttributes.addFlashAttribute("sucesso", "Aluno(a) cadastrado(a) com sucesso!");
		return model;
	}
	
	@RequestMapping(value = "/alunos/consulta")
	public ModelAndView listarAlunos(){
		ModelAndView model = new ModelAndView("alunos/consulta");
		List<Aluno> alunos = alunoDao.listar();
		List<Apostila> apostilas = apostilaDao.listar();
		model.addObject("alunos", alunos);
		model.addObject("apostilas", apostilas);
		model.addObject("sexos", Sexo.values());
		return model;
	}
	
	/*
	@RequestMapping("/alunos/detalhe/{id}")
	public ModelAndView detalheAluno(@PathVariable("id") Integer id) {
		ModelAndView model = new ModelAndView("alunos/detalhe");
		Aluno aluno = alunoDao.findAluno(id);
		List<Apostila> apostilas = alunoDao.listarApostilas(id);
		model.addObject("aluno", aluno);
		model.addObject("sexos", Sexo.values());
		model.addObject("apostilas", apostilas);
		return model;
	}*/
	
	@RequestMapping(value = "/alunos/detalhe", method = RequestMethod.POST)
	public ModelAndView alterarAluno(Aluno aluno, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/alunos/consulta");
		boolean result = alunoDao.alterar(aluno);
		if(result)
			redirectAttributes.addFlashAttribute("sucesso", "Aluno(a) alterado(a) com sucesso!");
		else
			redirectAttributes.addFlashAttribute("erro", "Aluno(a) não foi alterado(a)!");
		
		return model;
	}
	
	/*
	@RequestMapping("/alunos/adiciona/{id}")
	public ModelAndView apostilasForm(@PathVariable("id") Integer id) {
		ModelAndView model = new ModelAndView("alunos/adiciona");
		Aluno aluno = alunoDao.findAluno(id);
		List<Apostila> apostilas = apostilaDao.listar();
		model.addObject("aluno", aluno);
		model.addObject("apostilas", apostilas);
		return model;
	}*/
	
	@RequestMapping(value = "/alunos/adiciona", method = RequestMethod.POST)
	public ModelAndView adicionarApostila(ApostilaXAluno apostilaAluno, Aluno aluno, Apostila apostila, RedirectAttributes redirectAttributes,
			HttpSession session) {
		ModelAndView model = new ModelAndView("redirect:/alunos/consulta");
		int quantidade = apostilaDao.findApostila(apostila.getIdApostila()).getQuantidade();
		
		if(quantidade > 0) {
			apostilaAluno.setAluno(aluno);
			apostilaAluno.setApostila(apostila);
			
			boolean result = apostilaAlunoDao.gravar(apostilaAluno);
			if(result) {
				apostilaDao.removerApostila(apostila.getIdApostila());
				DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				Calendar cal = Calendar.getInstance();
				Movimento movimento = new Movimento();
				movimento.setDt(sdf.format(cal.getTime()));
				movimento.setQuantidade(1);
				movimento.setAluno(aluno);
				movimento.setApostila(apostila);
				movimento.setTipo(TipoMovimento.Saída);
				movimento.setUser((Usuario)session.getAttribute("usuarioLogado"));
				movimentoDao.gravar(movimento);
				redirectAttributes.addFlashAttribute("sucesso", "Apostila adicionada com sucesso!");
			}else
				redirectAttributes.addFlashAttribute("erro", "O aluno já possui essa apostila!");
		} else {
			redirectAttributes.addFlashAttribute("erro", "Essa apostila não se encontra no estoque!");
		}
		return model;
	}
	
	@RequestMapping(value = "/alunos/ativar{id}")
	public ModelAndView ativarAluno(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/alunos/consulta");
		Aluno aluno = alunoDao.findAluno(id);
		boolean result = alunoDao.ativar(aluno);
		if(result)
			redirectAttributes.addFlashAttribute("sucesso", "Aluno(a) ativado(a) com sucesso!");
		else
			redirectAttributes.addFlashAttribute("erro", "Aluno(a) não foi ativado(a)!");
			
		return model;
	}
	
	@RequestMapping(value = "/alunos/remover", method = RequestMethod.POST)
	public ModelAndView removerAluno(Aluno aluno, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/alunos/consulta");
		
		boolean result = alunoDao.remover(aluno);
		if(result)
			redirectAttributes.addFlashAttribute("sucesso", "Aluno(a) removido(a) com sucesso!");
		else
			redirectAttributes.addFlashAttribute("erro", "Aluno(a) não foi removido(a)!");
			
		return model;
		
	}
	
}
