package br.com.bitbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.bitbank.dao.ClienteDAO;
import br.com.bitbank.modelo.Cliente;

@Controller
@RequestMapping("/cliente")
public class ClienteController {
	
	@Autowired
	private ClienteDAO clienteDAO;
	
	
	@RequestMapping(value = "/lista")
	@Cacheable(value = "listaClientes")
	public ModelAndView lista() {
		List<Cliente> cliente = clienteDAO.listar();
		ModelAndView modelAndView = new ModelAndView("cliente/lista");
		modelAndView.addObject("cliente", cliente);
		return modelAndView;
	}

	@RequestMapping("/detalhe/{id}")
	public ModelAndView detalhe(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView("cliente/detalhe");

		Cliente cliente = clienteDAO.find(id);
		modelAndView.addObject("cliente", cliente);
		return modelAndView;
	}
}
