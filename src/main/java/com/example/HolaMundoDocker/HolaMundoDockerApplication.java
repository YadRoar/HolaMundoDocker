package com.example.HolaMundoDocker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class HolaMundoDockerApplication {

	public static void main(String[] args) {
		SpringApplication.run(HolaMundoDockerApplication.class, args);
	}

	@RestController
    class HelloWorldController {
        @GetMapping("/")
        public String hello() {
            return "Hola Mundo";
        }
    }

}
