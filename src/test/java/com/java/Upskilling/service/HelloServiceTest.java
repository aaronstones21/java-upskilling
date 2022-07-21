package com.java.Upskilling.service;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import com.java.Upskilling.models.HelloModel;
import com.java.Upskilling.services.HelloService;

public class HelloServiceTest {

    private final HelloService service = new HelloService();

    @Test
    public void get() {

        final HelloModel result = service.get("42");

        assertEquals(result.getAge(), "42");
        assertEquals(result.getName(), "Jenna Stones");
    }
}
