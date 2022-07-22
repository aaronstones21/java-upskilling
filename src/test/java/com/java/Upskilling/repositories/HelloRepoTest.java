package com.java.Upskilling.repositories;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import com.java.Upskilling.models.HelloModel;

public class HelloRepoTest {

    private final HelloRepository repo = new HelloRepository();

    @Test
    public void opinion() {
        final HelloModel result = repo.get("42");

        HelloModel expected = new HelloModel();

        expected.setAge("42");
        expected.setName("Jenna Stones");

        assertEquals(expected.getAge(), result.getAge());
        assertEquals(expected.getName(), result.getName());

    }
}
