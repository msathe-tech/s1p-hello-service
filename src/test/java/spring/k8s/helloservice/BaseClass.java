package spring.k8s.helloservice;

import io.restassured.module.mockmvc.RestAssuredMockMvc;
import org.junit.Before;
import org.mockito.BDDMockito;

public class BaseClass {

    @Before
    public void setup() {
        HelloService service = BDDMockito.mock(HelloService.class);
        BDDMockito.given(service.sayHello("Rockstar")).willReturn("Hello Rockstar!");
        RestAssuredMockMvc.standaloneSetup(new HelloServiceController(service));
    }
}