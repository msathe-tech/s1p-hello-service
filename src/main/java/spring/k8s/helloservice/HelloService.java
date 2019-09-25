package spring.k8s.helloservice;

import org.springframework.stereotype.Service;

@Service
public class HelloService {

    public String sayHello(String name) {
        StringBuffer message = new StringBuffer("Hello ").append(name).append("!");
        return message.toString();
    }

}