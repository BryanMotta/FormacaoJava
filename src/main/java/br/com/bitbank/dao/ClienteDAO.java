package br.com.bitbank.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.bitbank.modelo.Cliente;

@Repository
@Transactional
public class ClienteDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Cliente cliente) {
		manager.persist(cliente);
	}

	public List<Cliente> listar() {
		return manager.createQuery("select c from Cliente c", Cliente.class)
				.getResultList();
	}

	public Cliente find(int id) {
		return manager.find(Cliente.class, id);
	}
}
