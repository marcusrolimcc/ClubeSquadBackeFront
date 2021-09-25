package com.br.marcusrolim.clubesquad.biz;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import com.br.marcusrolim.clubesquad.Mensagem;
import com.br.marcusrolim.clubesquad.entities.Passeio;

public class PasseioBiz {

	SimpleDateFormat sdfHora = new SimpleDateFormat("HH:mm");
	SimpleDateFormat sdfData = new SimpleDateFormat("dd:MM:yyyy");

	public Mensagem msg;
	private Date dia;
	private Date diaVencimento;
	private Date hora;
	
	
	private ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
	private Validator validator = factory.getValidator();
	
	public PasseioBiz() {
		msg = new Mensagem();
	}

	public Boolean validar(Passeio passeio) {

		Boolean valido = true;
		Set<ConstraintViolation<Passeio>> constraintViolationSet = validator.validate(passeio);
		
		if(passeio.getNome().isEmpty() ) {
			msg.mensagens.add("O campo de nome não pode estar vazio");
			valido = false;
		}
		if(passeio.getPreco() == null) {
			msg.mensagens.add("O campo de valor não pode estar vazio");
			valido = false;
		}
		if(!constraintViolationSet.isEmpty()){
            ConstraintViolationException exceptionConstraint = new ConstraintViolationException(constraintViolationSet);
            msg.mensagens.add(exceptionConstraint.getMessage());
            valido = false;
        }
        if(valido == true) {
        	msg.mensagens.add("Incluído com sucesso!");
        }
        
		return valido;
	}

	public Date getDia() {
		return dia;
	}

	public void setDia(Date dia) {
		this.dia = dia;
	}

	public Date getDiaVencimento() {
		return diaVencimento;
	}

	public void setDiaVencimento(Date diaVencimento) {
		this.diaVencimento = diaVencimento;
	}

	public Date getHora() {
		return hora;
	}

	public void setHora(Date hora) {
		this.hora = hora;
	}

	
}