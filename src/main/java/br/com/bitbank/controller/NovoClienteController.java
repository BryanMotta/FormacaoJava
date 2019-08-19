package br.com.bitbank.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.bitbank.dao.ClienteDAO;
import br.com.bitbank.infra.FileSaver;
import br.com.bitbank.modelo.Cliente;
import br.com.bitbank.modelo.TipoGenero;
import br.com.bitbank.validacao.ClienteValidation;

@Controller
@RequestMapping("/novo-cliente")
public class NovoClienteController {

	@Autowired
	private ClienteDAO clienteDAO;

	@Autowired
	private FileSaver fileSaver;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(new ClienteValidation());
	}

	@RequestMapping(value = "/cadastrar", method = RequestMethod.GET)
	public ModelAndView form(Cliente cliente) {
		ModelAndView modelAndView = new ModelAndView("cliente/form");
		modelAndView.addObject("genero", TipoGenero.values());
		return modelAndView;
	}

	@RequestMapping(value = "/cadastrar", method = RequestMethod.POST)
	@CacheEvict(value = "listaClientes", allEntries = true)
	public ModelAndView gravar(MultipartFile fotoPerfil, @Valid Cliente cliente, BindingResult result,
			RedirectAttributes redirectAttributes) {
		System.out.println(fotoPerfil.getOriginalFilename());
		if (result.hasErrors()) {
			return form(cliente);
		}

		String path = fileSaver.write("arquivos-fotos-perfil", fotoPerfil);
		cliente.getTitular().setFotoPerfilPath(path);
		clienteDAO.gravar(cliente);
		redirectAttributes.addFlashAttribute("sucesso", "Cliente cadastrado com sucesso!");
		System.out.println(cliente.getTitular().getFotoPerfilPath());
		return new ModelAndView("redirect:/");
	}

	
	
	
	
	
	
	
}
