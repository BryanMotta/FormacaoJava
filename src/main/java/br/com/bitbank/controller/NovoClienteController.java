package br.com.bitbank.controller;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.bitbank.dao.ClienteDAO;
import br.com.bitbank.dao.UsuarioDAO;
import br.com.bitbank.modelo.Cliente;
import br.com.bitbank.modelo.TipoGenero;
import br.com.bitbank.modelo.Usuario;
import br.com.bitbank.validacao.ClienteValidation;
import br.com.bitbank.validacao.UsuarioValidation;

@Controller
@RequestMapping("/novo-cliente")
public class NovoClienteController {

	@Autowired
	private ClienteDAO clienteDAO;

	@Autowired
	private UsuarioDAO usuarioDAO;

//	@Autowired
//	private FileSaver fileSaver;

	@InitBinder("cliente")
	public void initClienteBinder(WebDataBinder binder) {
		binder.addValidators(new ClienteValidation());
	}

	@InitBinder("usuario")
	public void initUsuarioBinder(WebDataBinder binder) {
		binder.addValidators(new UsuarioValidation());
	}

	@RequestMapping(value = "/cadastrar", method = RequestMethod.GET)
	public ModelAndView form(Cliente cliente, Usuario usuario) {
		ModelAndView modelAndView = new ModelAndView("cliente/form");
		modelAndView.addObject("genero", TipoGenero.values());
		return modelAndView;
	}

	@Transactional
	@RequestMapping(value = "/cadastrar", method = RequestMethod.POST)
	@CacheEvict(value = "listaClientes", allEntries = true)
	public ModelAndView gravar(@Valid Cliente cliente, BindingResult result, Usuario usuario,
			RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			return form(cliente, usuario);
		}
		try {
			
//			String path = fileSaver.write("arquivos-fotos-perfil", fotoPerfil);
//			cliente.getTitular().setFotoPerfilPath(path);
//			melhorar esse codigo*

			usuario.setRoles(usuarioDAO.getRoleUser());
			clienteDAO.gravar(cliente);
			usuarioDAO.gravar(usuario);
			redirectAttributes.addFlashAttribute("sucesso", "Cliente cadastrado com sucesso!");
			
//			Sera implementado após configurar o gmail
//			enviaEmailCadastroEfetuado(cliente);
			
			return new ModelAndView("redirect:/");
		} catch (Exception e) {
			e.printStackTrace();
			return form(cliente, usuario);
		}
	}

//	Sera implementado após configurar o gmail
//	@Autowired
//	private MailSender sender;
//
//	private void enviaEmailCadastroEfetuado(Cliente cliente) {
//		SimpleMailMessage email = new SimpleMailMessage();
//		email.setSubject("Conta criadda com sucesso!");
//		email.setTo(cliente.getTitular().getEmail());
//		email.setText("Sua conta no Bitbank foi criada.");
//		email.setFrom("bryanmotta7@mail.com");
//
//		sender.send(email);
//	}

}
