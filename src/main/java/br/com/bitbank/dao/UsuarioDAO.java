package br.com.bitbank.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import br.com.bitbank.modelo.Usuario;

@Repository
public class UsuarioDAO implements UserDetailsService {

    @PersistenceContext
    private EntityManager manager;

    public Usuario loadUserByUsername(String email) {
        List<Usuario> usuarios = manager
            .createQuery("select u from Usuario u where email = :email", Usuario.class)
            .setParameter("email", email)
            .getResultList();

        if(usuarios.isEmpty()) {
            throw new UsernameNotFoundException("Usuário " + email + " não foi encontrado");
        }

        return usuarios.get(0);
    }
}