package br.com.bitbank.validacao;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import br.com.bitbank.modelo.Cliente;


public class ClienteValidation implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Cliente.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "titular.nome", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "titular.rg", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "titular.cpf", "field.required");
	}
	
}