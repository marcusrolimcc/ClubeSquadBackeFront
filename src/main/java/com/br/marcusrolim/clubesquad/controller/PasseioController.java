package com.br.marcusrolim.clubesquad.controller;

import java.util.List;

import javax.validation.ConstraintViolationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.br.marcusrolim.clubesquad.Mensagem;
import com.br.marcusrolim.clubesquad.biz.PasseioBiz;
import com.br.marcusrolim.clubesquad.entities.Passeio;
import com.br.marcusrolim.clubesquad.repositories.PasseioRepository;

@RestController
@RequestMapping("clubesquad")
public class PasseioController {
	
	@Autowired
	private PasseioRepository xxxxRepository;

	@GetMapping("listar")
	public List<Passeio> listar(){
		
		List<Passeio> lista = xxxxRepository.findAll();
		return lista;
	}
	
	@PostMapping("incluir")
	public Mensagem incluir(@RequestBody Passeio xxxx) {
		
		xxxx.setId(0);
		PasseioBiz xxxxBiz = new PasseioBiz();
		try {
			
			if(xxxxBiz.validar(xxxx)) {
				xxxxRepository.save(xxxx);
				xxxxRepository.flush();
			}else {
				return xxxxBiz.msg;
			}
			
		}catch (ConstraintViolationException e) {
            e.getConstraintViolations().forEach(v -> xxxxBiz.msg.mensagens.add(v.getMessage()));
            return xxxxBiz.msg;
        }
		return xxxxBiz.msg;
	}
}