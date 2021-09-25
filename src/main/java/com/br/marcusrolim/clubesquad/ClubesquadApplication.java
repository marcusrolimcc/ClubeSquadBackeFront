package com.br.marcusrolim.clubesquad;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ClubesquadApplication {

	public static void main(String[] args) {
		
		System.out.println("Iniciando acesso...");
		SpringApplication.run(ClubesquadApplication.class, args);
		System.out.println("Inicialização concluída. Acesso concedido");
	}

}