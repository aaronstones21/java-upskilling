package com.java.Upskilling.controllers;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.boot.test.context.SpringBootTest;

import com.java.Upskilling.models.HelloModel;
import com.java.Upskilling.services.HelloService;

@SpringBootTest
public class HelloControllerTest {

    @InjectMocks
    private HelloController helloController = new HelloController();

    @Mock
    private HelloService helloService;

    private HelloModel helloModel = new HelloModel();

    @DisplayName("Test Mock helloController + helloService")
    @Test
    void testGet() {
        when(helloService.get("42")).thenReturn(helloModel);
        assertEquals(helloModel, helloController.get("42"));
    }

}
