package spring.k8s.helloservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;


@RestController
public class HelloServiceController {

	private final HelloService helloService;

	public HelloServiceController(HelloService helloService) {
		this.helloService = helloService;
	}

	@GetMapping("/{name}")
	public String sayHello(@PathVariable String name) {
		return helloService.sayHello(name);
	}

	@GetMapping("/")
	public String sayHi() {
		StringBuffer message = new StringBuffer("Hi!");
		message.append(System.getProperty("line.separator"));
		message.append("n = ").append(System.getenv("metadata.name"));
		message.append(", ");
		message.append("p = ").append(System.getenv("metadata.namespace"));

		System.out.println(message.toString());
		return message.toString();
	}
}

