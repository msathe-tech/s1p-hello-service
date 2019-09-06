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
		System.out.println("v2.sayHello");
		return "Hello " + name + "! this is hello-service v2";
	}

	@GetMapping("/")
	public String sayHi() {
		System.out.println("v2.sayHi");
		return "Hi!!! ";
	}
}
