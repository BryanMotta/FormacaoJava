package br.com.bitbank.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.bitbank.dao.ClienteDAO;
import br.com.bitbank.modelo.Cliente;
import br.com.bitbank.modelo.TipoGenero;

@Controller
@RequestMapping("/bitconta")
public class BitContaController {

	@Autowired
	private ClienteDAO clienteDAO;
	
	@RequestMapping(value = "/")
	public ModelAndView index(Principal principal) {
		ModelAndView modelAndView = new ModelAndView("/bitconta/detalhe");
		Cliente cliente = clienteDAO.findUsuario(principal.getName());
		modelAndView.addObject("cliente", cliente);
		return modelAndView;
		
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/atualizar")
	public ModelAndView atualizarForm(Principal principal) {
		ModelAndView modelAndView = new ModelAndView("bitconta/formatualizacao");
		Cliente cliente = clienteDAO.findUsuario(principal.getName());
		modelAndView.addObject("cliente", cliente);
		modelAndView.addObject("genero", TipoGenero.values());

		return modelAndView;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/atualizar")
	public ModelAndView atualizar(Cliente cliente) {
		ModelAndView modelAndView = new ModelAndView("redirect:/bitconta/"+ cliente.getId());
		clienteDAO.atualizar(cliente);
		modelAndView.addObject("cliente", cliente);
		return modelAndView;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/deletar")
	public ModelAndView deletarConta(Principal principal) {
		ModelAndView modelAndView = new ModelAndView("redirect:/logout");
		clienteDAO.deletarCliente(principal.getName());
		System.out.println(principal.getName() + " deletado");
		return modelAndView;
	}
	
}
