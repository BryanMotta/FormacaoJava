package br.com.bitbank.controller;

import java.util.Arrays;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.bitbank.dao.UsuarioDAO;
import br.com.bitbank.modelo.Role;
import br.com.bitbank.modelo.Usuario;

@Controller
public class HomeController{

    @RequestMapping(value = "/" )
    public String index(){
        return "home";
    }
    
    @Autowired
    private UsuarioDAO usuarioDao;

    @Transactional
    @ResponseBody
    @RequestMapping("/url-magica-maluca-dsdhASDSDJJALDJIJEJ5618461646163484AJHAKHINSKFAHWid")
    public String urlMagicaMaluca() {
        Usuario admin = new Usuario(); 
        admin.setNome("Admin");
        admin.setEmail("admin@bitbank.com.br");
        admin.setSenha("$2a$10$lt7pS7Kxxe5JfP.vjLNSyOXP11eHgh7RoPxo5fvvbMCZkCUss2DGu");
        admin.setRoles(Arrays.asList(new Role("ROLE_ADMIN")));

        Usuario user = new Usuario(); 
        user.setNome("User");
        user.setEmail("user@bitbank.com.br");
        user.setSenha("$2a$10$lt7pS7Kxxe5JfP.vjLNSyOXP11eHgh7RoPxo5fvvbMCZkCUss2DGu");
        user.setRoles(Arrays.asList(new Role("ROLE_USER")));
        
        usuarioDao.gravar(admin);
        usuarioDao.gravar(user);

        return "Url Mágica executada";
    }

}