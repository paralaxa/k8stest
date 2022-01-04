package com.example.k8stest;

import java.net.InetAddress;
import javax.servlet.http.HttpServletRequest;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class K8stestApplication {

  public static void main(String[] args) {
    SpringApplication.run(K8stestApplication.class, args);
  }

  @GetMapping
  public String getTest(HttpServletRequest request) {
    try {
      return "test_v2 " + InetAddress.getLocalHost().getHostAddress();
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

}
