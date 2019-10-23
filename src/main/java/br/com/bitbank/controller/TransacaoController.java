package br.com.bitbank.controller;

import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.bitbank.dao.ClienteDAO;
import br.com.bitbank.modelo.Cliente;
import br.com.bitbank.modelo.DadosDeposito;

@Controller
@RequestMapping("/transacoes")
public class TransacaoController {

	@Autowired
	private ClienteDAO clienteDAO;

	@Autowired
	RestTemplate restTemplate;

	@RequestMapping(method = RequestMethod.GET, value = "/deposita/{id}")
	public ModelAndView form(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView("transacao/transacao");

		Cliente cliente = clienteDAO.find(id);
		modelAndView.addObject("cliente", cliente);
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/deposita/{id}")
	//entender melhor a class Callable
	public Callable<ModelAndView> deposita(@PathVariable("id") int id, WebRequest request,
			RedirectAttributes redirectAttributes) {
		return () -> {
			try {
				String uri = "http://book-payment.herokuapp.com/payment";
				String response = restTemplate.postForObject(uri,
						new DadosDeposito(Double.parseDouble(request.getParameter("deposita"))), String.class);
				Cliente cliente = clienteDAO.find(Integer.parseInt(request.getParameter("id")));
				cliente.getConta().deposita(Double.parseDouble(request.getParameter("deposita")));
				clienteDAO.atualizar(cliente);
				redirectAttributes.addFlashAttribute("sucesso", response);
				
				return new ModelAndView("redirect:/");

			} catch (Exception e) {
				e.printStackTrace();
				redirectAttributes.addFlashAttribute("falha", "Valor maior que o permitido");
				return new ModelAndView("redirect:/");
			}
		};
	}

	@RequestMapping(method = RequestMethod.POST, value = "/saca/{id}")
	public ModelAndView saca(@PathVariable("id") int id, WebRequest request) {
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		Cliente cliente = clienteDAO.find(Integer.parseInt(request.getParameter("id")));
		cliente.getConta().saca(Double.parseDouble(request.getParameter("saca")));
		return modelAndView;
	}

}
