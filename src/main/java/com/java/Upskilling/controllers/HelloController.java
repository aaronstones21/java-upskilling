package com.java.Upskilling.controllers;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.java.Upskilling.models.HelloModel;
import com.java.Upskilling.services.HelloService;

@RestController()
public class HelloController {

    private HelloService helloService = new HelloService();

    @GetMapping("/hello/{id}")
    public HelloModel get(@PathVariable(value = "id") String id) {

        return helloService.get(id);
    }

    @PutMapping("/hello")
    public String update() {
        return "Hello Worlds";

    }

    @PostMapping("/hello")
    public String save() {
        return "Hello World";
    }

    @DeleteMapping("/hello")
    public String delete() {
        return "Hello World";
    }
}
