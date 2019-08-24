package spring.k8s.helloservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;


@RestController
public class HelloServiceController {

	@GetMapping("/{name}")
	public String sayHello(@PathVariable String name) {
		return "Hello " + name;
	}

	@GetMapping("/")
	public String sayHi() {
		return "Hi!!! ";
	}
}
