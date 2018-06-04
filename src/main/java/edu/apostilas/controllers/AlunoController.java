package edu.apostilas.controllers;

import java.util.List;

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
import edu.apostilas.models.Aluno;
import edu.apostilas.models.Apostila;
import edu.apostilas.models.ApostilaXAluno;
import edu.apostilas.models.Sexo;

@Controller
public class AlunoController {
	
	@Autowired
	private AlunoDAO alunoDao;
	
	@Autowired
	private ApostilaXAlunoDAO apostilaAlunoDao;
	
	@Autowired
	private ApostilaDAO apostilaDao;
	
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
		
		alunoDao.gravar(aluno);
		redirectAttributes.addFlashAttribute("sucesso", "Aluno(a) cadastrado(a) com sucesso!");
		return model;
	}
	
	@RequestMapping(value = "/alunos/consulta")
	public ModelAndView listarAlunos(){
		ModelAndView model = new ModelAndView("alunos/consulta");
		List<Aluno> alunos = alunoDao.listar();
		model.addObject("alunos", alunos);
		return model;
	}
	
	@RequestMapping("/alunos/detalhe/{id}")
	public ModelAndView detalheAluno(@PathVariable("id") Integer id) {
		ModelAndView model = new ModelAndView("alunos/detalhe");
		Aluno aluno = alunoDao.findAluno(id);
		List<Apostila> apostilas = alunoDao.listarApostilas(id);
		model.addObject("aluno", aluno);
		model.addObject("sexos", Sexo.values());
		model.addObject("apostilas", apostilas);
		return model;
	}
	
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
	
	@RequestMapping("/alunos/adiciona/{id}")
	public ModelAndView apostilasForm(@PathVariable("id") Integer id) {
		ModelAndView model = new ModelAndView("alunos/adiciona");
		Aluno aluno = alunoDao.findAluno(id);
		List<Apostila> apostilas = apostilaDao.listar();
		model.addObject("aluno", aluno);
		model.addObject("apostilas", apostilas);
		return model;
	}
	
	@RequestMapping(value = "/alunos/adiciona", method = RequestMethod.POST)
	public ModelAndView adicionarApostila(ApostilaXAluno apostilaAluno, Aluno aluno, Apostila apostila, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/alunos/consulta");
		int quantidade = apostilaDao.findApostila(apostila.getIdApostila()).getQuantidade();
		
		if(quantidade > 0) {
			apostilaAluno.setAluno(aluno);
			apostilaAluno.setApostila(apostila);
			
			boolean result = apostilaAlunoDao.gravar(apostilaAluno);
			if(result) {
				apostilaDao.removerApostila(apostila.getIdApostila());
				redirectAttributes.addFlashAttribute("sucesso", "Apostila adicionada com sucesso!");
			}else
				redirectAttributes.addFlashAttribute("erro", "O aluno já possui essa apostila!");
		} else {
			redirectAttributes.addFlashAttribute("erro", "Essa apostila não se encontra no estoque!");
		}
		return model;
	}
	
	
}
