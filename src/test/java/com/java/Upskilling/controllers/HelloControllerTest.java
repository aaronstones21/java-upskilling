package com.java.Upskilling.controllers;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import com.java.Upskilling.models.HelloModel;

public class HelloControllerTest {

    private final HelloController helloController = new HelloController();

    @Test
    public void getTest() {
        HelloModel model = helloController.find("42");

        assertEquals("Aaron Stones", model.getName());
        assertEquals("42", model.getAge());
    }
}
