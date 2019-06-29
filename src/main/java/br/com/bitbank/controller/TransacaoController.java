package br.com.bitbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.bitbank.dao.ClienteDAO;
import br.com.bitbank.modelo.Cliente;

@Controller
@RequestMapping("/transacao")
public class TransacaoController {
	
	@Autowired
	private ClienteDAO clienteDAO;
	
	@RequestMapping(method = RequestMethod.GET, value = "/deposita/{id}")
	public ModelAndView form(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView("transacao/transacao");

		Cliente cliente = clienteDAO.find(id);
		modelAndView.addObject("cliente", cliente);
		return modelAndView;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/deposita/{id}")
	public ModelAndView deposita(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		
		Cliente cliente = clienteDAO.find(id);
		clienteDAO.gravar(cliente);
		modelAndView.addObject("cliente", cliente);
		return modelAndView;
	}
	
	
	
	
	

}
