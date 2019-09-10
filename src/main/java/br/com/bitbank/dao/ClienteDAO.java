package br.com.bitbank.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mysql.cj.Session;
import com.mysql.cj.xdevapi.SessionFactory;

import br.com.bitbank.modelo.Cliente;

@Repository
@Transactional
public class ClienteDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Cliente cliente) {
		manager.persist(cliente);
	}
	
	public void atualizar(Cliente cliente) {
		manager.merge(cliente);
	}
	
	public void deposita(double deposita, int id) {
		manager.createQuery("UPDATE Conta SET saldo = deposita where id = 1;",Cliente.class)
		.setParameter("deposita", deposita)
		.setParameter("id", id);
		
		/*
		 * manager.createQuery("select distinct(p) from Produto p join fetch p.precos precos where p.id = :id", 
     		Produto.class).setParameter("id", id)
       		.getSingleResult();
		 */
		}
	
	public Cliente getProduto(Integer id) {
		Cliente cliente = manager.find(Cliente.class, id);
		return cliente;
	}
	public List<Cliente> listar() {
		return manager.createQuery("select c from Cliente c", Cliente.class)
				.getResultList();
	}
	
	public Cliente find(int id) {
		
		return manager.find(Cliente.class, id);
		
	}

	public Cliente findUsuario(String usuarioNome) {
		return manager.createQuery("select c from Cliente c where usuario_id = :usuarioNome", Cliente.class)
				.setParameter("usuarioNome", usuarioNome)
				.getSingleResult();
		 
	}

	public void deletarCliente(String usuarioNome) {
		manager.createQuery("delete from Cliente c where usuario_id = :usuarioNome")
		.setParameter("usuarioNome", usuarioNome);
	}
}
