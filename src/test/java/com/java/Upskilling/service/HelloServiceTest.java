package com.java.Upskilling.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.boot.test.context.SpringBootTest;

import com.java.Upskilling.models.HelloModel;
import com.java.Upskilling.repositories.HelloRepository;
import com.java.Upskilling.services.HelloService;

@SpringBootTest
public class HelloServiceTest {

    @Mock
    private HelloRepository helloRepository;

    @InjectMocks
    private HelloService helloService = new HelloService();

    private HelloModel helloModel = new HelloModel();

    @BeforeEach
    void setMockOutput() {
        when(helloRepository.get("42")).thenReturn(helloModel);
    }

    @DisplayName("Test Mock helloService + helloRepository")
    @Test
    void testGet() {
        assertEquals(helloModel, helloService.get("42"));
    }

}
