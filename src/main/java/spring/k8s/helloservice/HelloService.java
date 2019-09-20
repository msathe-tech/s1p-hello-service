package spring.k8s.helloservice;

import org.springframework.stereotype.Service;

@Service
public class HelloService {

    public String sayHello(String name) {
        StringBuffer message = new StringBuffer("Hello ").append(name).append("!");
        message.append(System.getProperty("line.separator"));
        message.append("n = ").append(System.getenv("metadata.name"));
        message.append(", ");
        message.append("p = ").append(System.getenv("metadata.namespace"));

        System.out.println(message.toString());
        return message.toString();
    }

}