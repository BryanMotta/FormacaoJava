package br.com.bitbank.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.bitbank.dao.ClienteDAO;
import br.com.bitbank.modelo.Cliente;

@Controller
@RequestMapping("/bitconta")
public class BitContaController {

	@Autowired
	private ClienteDAO clienteDAO;
	
	@RequestMapping(value = "")
	public ModelAndView index(Principal principal) {
		ModelAndView modelAndView = new ModelAndView("/bitconta/detalhe");
		System.out.println(principal.getName());
		System.out.println(clienteDAO.findUsuario(principal.getName()));
		Cliente cliente = clienteDAO.findUsuario(principal.getName());
		modelAndView.addObject("cliente", cliente);
		return modelAndView;
		
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/atualizar/{id}")
	public ModelAndView atualizarForm(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView("bitconta/atualizarform");
		Cliente cliente = clienteDAO.find(id);
		modelAndView.addObject("cliente", cliente);

		return modelAndView;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/atualizar")
	public ModelAndView atualizar(Cliente cliente) {
		ModelAndView modelAndView = new ModelAndView("redirect:/bitconta/detalhe/"+ cliente.getId());
		clienteDAO.atualizar(cliente);
		modelAndView.addObject("cliente", cliente);
		return modelAndView;
	}
	
	
}
